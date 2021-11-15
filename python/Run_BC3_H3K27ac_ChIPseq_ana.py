
import re
import subprocess
import os


def get_para(configfile):

    with open(configfile) as f:

        for line in f:
            line.rstrip()
            m = re.match(r"(Threads):(\d+)", line)
            idx = re.match(r"^(Index):(.*)$", line)
            outdir = re.match(r"(Output_dir):(.*)$", line)
            trim = re.match(r"(TrimGalore):(.*)$", line)
            align = re.match(r"(Alignment_dir):(.*)$", line)
            pairend = re.match(r"(PAIREND):(.*)$", line)
            trimmed = re.match(r"(Trimmed_dir):(.*)$", line)
            fastqdir = re.match(r"(Fastq_dir):(.*)", line)
            cutadapt = re.match(r"(Cutadapt):(.*)", line)
            fastqc = re.match(r"(FastQC_dir):(.*)", line)
            bowtie2 = re.match(r"(Bowtie2):(.*)", line)
            genome = re.match(r"(GENOME):(.*)", line)
            macs2 = re.match(r"(Macs2_output):(.*)", line)
            macs2_bin = re.match(r"(Macs2_dir):(.*)", line)
            idr = re.match(r"(IDR_dir):(.*)", line)
            if m:
                thread_num = m.group(2)
            elif idx:
                align_idx = idx.group(2)
            elif outdir:
                out_dir = outdir.group(2)
            elif trim:
                trimmer_dir = trim.group(2)
            elif align:
                alignment_dir = align.group(2)
            elif pairend:
                pair_end = pairend.group(2)
            elif trimmed:
                trimmed_dir = trimmed.group(2)
            elif fastqdir:
                fastq_dir = fastqdir.group(2)
            elif cutadapt:
                cutadapt_dir = cutadapt.group(2)
            elif fastqc:
                fastqc_dir = fastqc.group(2)
            elif bowtie2:
                bowtie2_dir = bowtie2.group(2)
            elif genome:
                genome_file = genome.group(2)
            elif macs2:
                macs2_output_dir = macs2.group(2)
            elif idr:
                IDR_dir = idr.group(2)
            elif macs2_bin:
                macs2_dir = macs2_bin.group(2)

    return thread_num, align_idx, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_dir, fastq_dir, cutadapt_dir, fastq_dir, bowtie2_dir, genome_file, macs2_output_dir, IDR_dir, macs2_dir


def get_fastq(configfile):

    with open(configfile) as f:
        files = []
        for line in f:
            line.rstrip()
            fq = re.match(r"^(.*fastq\.gz$)", line)
            if fq:
                file = fq.group(1)
                files.append(file)

    return files

def rank_superenhancers(sample, bamfiles, bamfile_control, bed, out_dir):
    print(sample, bamfiles, bamfile_control, bed)
    control_Wpath = os.path.join(out_dir, "control_tag")
#    subprocess.run(["makeTagDirectory", sample] + bamfiles)
#    subprocess.run(["makeTagDirectory", control_Wpath, bamfile_control])
    print(sample, bamfiles, bamfile_control, bed, out_dir)
    subprocess.run(["findPeaks", sample, "-i", control_Wpath, "-style", "super", "-size", "1000", "-superSlope", "1", "-superWindow", "15", "-o", "".join([sample, ".SE.txt"]), "-typical", "".join([sample, ".typical.txt"]), "-inputPeaks", bed])

Para = get_para(configfile="config_BC3_H3K27ac_ChIPseq.txt")
thread_num = Para[0]
align_idx = Para[1]
out_dir = Para[2]
trimmer_dir = Para[3]
alignment_dir = Para[4]
pair_end = Para[5]
trimmed_output = Para[6]
fastq_dir = Para[7]
cutadapt_dir = Para[8]
fastqc_dir = Para[9]
bowtie2_dir = Para[10]
genome_file = Para[11]
macs2_output_dir = Para[12]
idr_dir = Para[13]
macs2_dir = Para[14]


fastq_files = get_fastq(configfile="config_BC3_H3K27ac_ChIPseq.txt")
samples = []
if pair_end == "Yes":

    for i in range(len(fastq_files)/2):
        samples.append(os.path.basename(fastq_files[2*i]))
else:
    for i in range(len(fastq_files)):
        samples.append(os.path.basename(fastq_files[i]))

alignment_path = os.path.join(out_dir, alignment_dir)
trimmed_path = os.path.join(out_dir, trimmed_output)
genome_file_wPath = os.path.join(out_dir, genome_file)

if not os.path.exists(alignment_path):
    os.mkdir(alignment_path)

if not os.path.exists(trimmed_path):
    os.mkdir(trimmed_path)


#print(Para)
#print(fastq_files)
#print(cutadapt_dir)
# trim reads
for i in range(len(fastq_files)):
    subprocess.run(["./bash/step1_reads_trimming.sh", thread_num, align_idx, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_path, cutadapt_dir, os.path.join(fastq_dir, fastq_files[i])])

# align
for i in range(len(fastq_files)):
    subprocess.run(["./bash/step2_align.sh", thread_num, genome_file_wPath, align_idx, out_dir, bowtie2_dir, alignment_path, pair_end, trimmed_path, os.path.join(fastq_dir, fastq_files[i])])

# callpeaks samples in order of control1, sample1A, sample1B control2, sample2A, sample2B ...
if not os.path.exists(macs2_output_dir):
    os.mkdir(macs2_output_dir)
print(samples)
for i in range(int(len(samples)/3)):
    print(type(samples))
    print(samples[i])
    print(samples[i+1])
    print(samples[i+2])
    control_bam = "".join([samples[i], ".filteredChr.bam"])
    control_bam_Wpath = os.path.join(alignment_path, control_bam)
    rep1_bam = "".join([samples[i+1], ".filteredChr.bam"])
    rep1_bam_Wpath = os.path.join(alignment_path, rep1_bam)
    rep2_bam = "".join([samples[i+2], ".filteredChr.bam"])
    rep2_bam_Wpath = os.path.join(alignment_path, rep2_bam)
    print(control_bam_Wpath, rep1_bam_Wpath, rep2_bam_Wpath)
    subprocess.run([os.path.join(macs2_dir, "macs2"), "callpeak", "-t", rep1_bam_Wpath, "-c", control_bam_Wpath, "-q", "0.99", "-f", "BAM", "--keep-dup", "all", "-n", os.path.join(macs2_output_dir, samples[i+1])])
    subprocess.run([os.path.join(macs2_dir, "macs2"), "callpeak", "-t", rep2_bam_Wpath, "-c", control_bam_Wpath, "-q", "0.99", "-f", "BAM", "--keep-dup", "all", "-n", os.path.join(macs2_output_dir, samples[i+2])])

    peak1 = "".join([os.path.join(macs2_output_dir, samples[i+1]), "_peaks.narrowPeak"])
    peak2 = "".join([os.path.join(macs2_output_dir, samples[i+2]), "_peaks.narrowPeak"])
    print(peak1)
    print(peak2)
    print(samples[i+2])
    subprocess.run(["bash", "bash/step4_filter_peak_idr.sh", idr_dir, macs2_output_dir, peak1, peak2, samples[i+2]])

    idr_peak = os.path.join(macs2_output_dir, samples[i+2])
    print(idr_peak)
    sample_Wpath = "".join([os.path.join(out_dir, samples[i+2]), "_tag"])
    rank_superenhancers(sample = sample_Wpath, bamfiles = [rep1_bam_Wpath, rep2_bam_Wpath], bamfile_control=control_bam_Wpath, bed="".join([idr_peak, ".01.bed"]), out_dir=out_dir)
