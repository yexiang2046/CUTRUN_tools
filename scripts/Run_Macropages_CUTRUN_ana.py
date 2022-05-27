
import re
import subprocess
import os
import py_lib.utils as pu

Para = pu.get_para(configfile="config_macrophage_CUTRUN.txt")
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
genome = Para[11]
macs2_output_dir = Para[12]
idr_dir = Para[13]
macs2_dir = Para[14]
gopeaks_dir = Para[15]

gopeaks_out_dir = "gopeaks_out"

fastq_files = pu.get_fastq(configfile="config_macrophage_CUTRUN.txt")
samples = []
if pair_end == "Yes":

    for i in range(int(len(fastq_files)/2)):
        samples.append(os.path.basename(fastq_files[2*i]).split('_', 1)[0])
else:
    for i in range(len(fastq_files)):
        samples.append(os.path.basename(fastq_files[i]).split('_', 1)[0])

alignment_path = os.path.join(out_dir, alignment_dir)
trimmed_path = os.path.join(out_dir, trimmed_output)
genome_file_wPath = os.path.join(out_dir, genome)

if not os.path.exists(alignment_path):
    os.mkdir(alignment_path)

if not os.path.exists(trimmed_path):
    os.mkdir(trimmed_path)


##print(Para)
##print(fastq_files)
##print(cutadapt_dir)
## trim reads
fastq_path = os.path.join(out_dir, fastq_dir)
print(fastq_path)


if (pair_end == "Yes"):
    sample_num = int(len(fastq_files)/2)

    for i in range(sample_num):

        file1 = os.path.join(fastq_path, fastq_files[i*2])
        file2 = os.path.join(fastq_path, fastq_files[i*2+1])
#        subprocess.run(["./bash/step1_reads_trimming.sh", thread_num, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_path, cutadapt_dir, file1, file2])



## align

sample_num = int(len(fastq_files)/2)
for i in range(sample_num):
    file = os.path.basename(fastq_files[i*2]).split('_', 1)[0]
#    print(file)
    trimmed_file1 = "".join([file, "_S1_L005_R1_001_val_1.fq.gz"])
    trimmed_files1 = os.path.join(trimmed_path, trimmed_file1)
    trimmed_file2 = "".join([file, "_S1_L005_R2_001_val_2.fq.gz"])
    trimmed_files2 = os.path.join(trimmed_path, trimmed_file2)
#    subprocess.run(["./bash/step2_align.sh", thread_num, genome_file_wPath, align_idx, out_dir, bowtie2_dir, alignment_path, pair_end, trimmed_files1, trimmed_files2])
    print(trimmed_files1, trimmed_files2)
    print(samples[i])


for sample in samples:
    print(sample, "_sorted.bam")
    bam_file = "".join([sample, "_sorted.bam"])
    bam_file = os.path.join(alignment_path, bam_file)
#    index_bam(bam_file, thread = thread_num)
#    filter_bam(bamfile = bam_file, thread = thread_num, outdir = alignment_path, output_file = "".join([alignment_path, "/", sample, ".filteredChr.bam"]), genome = genome)
#    index_bam("".join([alignment_path, "/", sample, ".filteredChr.bam"]), thread = thread_num)


# callpeaks samples in order of control1, sample1A, sample1B control2, sample2A, sample2B ...
macs2_output_path = os.path.join(out_dir, macs2_output_dir)
if not os.path.exists(macs2_output_path):
    os.mkdir(macs2_output_path)
print(samples)

for i in range(int(len(samples)/3)):
    print(type(samples))
    print(samples[i*3])
    print(samples[i*3+1])
    print(samples[i*3+2])
    control_bam = "".join([samples[i*3+2], ".filteredChr.bam"])
    control_bam_Wpath = os.path.join(alignment_path, control_bam)
#    bam_to_bw(control_bam_Wpath, thread_num, "".join([control_bam_Wpath, ".bw"]))
    rep1_bam = "".join([samples[i*3], ".filteredChr.bam"])
    rep1_bam_Wpath = os.path.join(alignment_path, rep1_bam)
#    bam_to_bw(rep1_bam_Wpath, thread_num, "".join([rep1_bam_Wpath, ".bw"]))
#    pu.bam_to_log2bw(treatment_bam = rep1_bam_Wpath, control_bam = control_bam_Wpath, thread = thread_num, output_file = "".join([rep1_bam_Wpath, "lg2.bw"]))
    pu.gopeaks(control_bam = control_bam, treatment_bam=rep1_bam_Wpath, )
    rep2_bam = "".join([samples[i*3+1], ".filteredChr.bam"])
    rep2_bam_Wpath = os.path.join(alignment_path, rep2_bam)
#    bam_to_bw(rep2_bam_Wpath, thread_num, "".join([rep2_bam_Wpath, ".bw"]))
#    pu.bam_to_log2bw(treatment_bam = rep2_bam_Wpath, control_bam = control_bam_Wpath, thread = thread_num, output_file = "".join([rep2_bam_Wpath, "lg2.bw"]))
    print(control_bam_Wpath, rep1_bam_Wpath, rep2_bam_Wpath)
#    subprocess.run([os.path.join(macs2_dir, "macs2"), "callpeak", "--broad", "-t", rep1_bam_Wpath, "-c", control_bam_Wpath, "-q", "0.99", "-f", "BAMPE", "--keep-dup", "all", "-n", os.path.join(macs2_output_path, samples[i*3])])
#    subprocess.run([os.path.join(macs2_dir, "macs2"), "callpeak", "--broad", "-t", rep2_bam_Wpath, "-c", control_bam_Wpath, "-q", "0.99", "-f", "BAMPE", "--keep-dup", "all", "-n", os.path.join(macs2_output_path, samples[i*3+1])])

#    peak1 = "".join([os.path.join(macs2_output_dir, samples[i+1]), "_peaks.narrowPeak"])
#    peak2 = "".join([os.path.join(macs2_output_dir, samples[i+2]), "_peaks.narrowPeak"])

    peak1 = "".join([os.path.join(macs2_output_path, samples[i*3]), "_peaks.broadPeak"])
    peak2 = "".join([os.path.join(macs2_output_path, samples[i*3+1]), "_peaks.broadPeak"])
    print(peak1)
    print(peak2)
    print(samples[i*3])

    subprocess.run(["bash", "bash/step4_filter_peak_idr.sh", idr_dir, macs2_output_path, peak1, peak2, samples[i*3]])

#    idr_peak = os.path.join(macs2_output_path, samples[i*3])
#    print(idr_peak)
#    sample_Wpath = "".join([os.path.join(out_dir, samples[i*3]), "_tag"])
#    rank_superenhancers(sample = sample_Wpath, bamfiles = [rep1_bam_Wpath, rep2_bam_Wpath], bamfile_control=control_bam_Wpath, bed="".join([idr_peak, ".idr.01.bed"]), out_dir=out_dir)

## format and filter superenhancers to bed file
#    f=open("".join([sample_Wpath, "idr.SE.bed"]), "w")
#    p1=subprocess.Popen(["cat", os.path.join(out_dir, "".join([samples[i+2], "_tag.SE.txt"]))], stdout=subprocess.PIPE)
#    p2=subprocess.Popen(["sed", "1,45d"], stdin=p1.stdout, stdout=subprocess.PIPE)
#    p3=subprocess.Popen(["cut", "-f", "2-4"], stdin=p2.stdout, stdout=subprocess.PIPE)
#    p4=subprocess.Popen(["grep", "-v", "chrGQ994935"], stdin=p3.stdout, stdout=f)
#    f.close()
