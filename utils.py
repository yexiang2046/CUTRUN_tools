import re
import subprocess
import os
import json



# function to parse json file and return sample pairs as dictionary


def parse_samples_for_callpeaks(json_file):
    with open(json_file) as f:
        sample_pair = json.load(f)
    return dict(sample_pair)


def get_para(configfile):
    """Parse configuration file and return assigned parameters."""
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
            #gopeaks = re.match(r"(gopeaks):(.*)", line)
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
            #elif gopeaks:
            #    gopeaks_dir = gopeaks.group(2)

    return thread_num, align_idx, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_dir, fastq_dir, cutadapt_dir, fastq_dir, bowtie2_dir, genome_file, macs2_output_dir, IDR_dir, macs2_dir


def get_fastq(configfile):
    """Parse configuration files and returns fastq file list."""
    with open(configfile) as f:
        files = []
        for line in f:
            line.strip()
            fq = re.match(r"^(.*fastq\.gz$)", line)
            if fq:
                file = fq.group(1)
                files.append(file)

    return files





def get_samples(configfile):
    """Parse configuration files and returns sample names."""
    with open(configfile) as f:
        files = []
        for line in f:
            line.rstrip()
            fq = re.match(r"^(Samples):(.*)", line)
            if fq:
                file = fq.group(2)
                files.append(file)

    return files


def get_treatments(configfile):
    """Parse configuration files and returns treatments for each sample."""
    with open(configfile) as f:
        files = []
        for line in f:
            line.rstrip()
            fq = re.match(r"^(Treatments):(.*)", line)
            if fq:
                file = fq.group(2)
                files.append(file)

    return files




def rank_superenhancers(sample, bamfiles, bamfile_control, bed, out_dir):
    """Rank peaks signals and call superenhancers as a text files."""
    print(sample, bamfiles, bamfile_control, bed)
    control_Wpath = os.path.join(out_dir, "control_tag")
    subprocess.run(["makeTagDirectory", sample] + bamfiles)
    subprocess.run(["makeTagDirectory", control_Wpath, bamfile_control])
    print(sample, bamfiles, bamfile_control, bed, out_dir)
    subprocess.run(["findPeaks", sample, "-i", control_Wpath, "-style", "superhistone", "-superSlope", "0.5", "-o", "".join([sample, ".SE.txt"]), "-typical", "".join([sample, ".typical.txt"]), "-inputPeaks", bed])

def bam_to_bw(bamfile, thread, output_file):
    """Convert bam file to bigwig file."""
    subprocess.run(["bamCoverage", "-b", bamfile, "-o", output_file, "--binSize", "10", "-p", thread, "--normalizeUsing", "CPM"])


def bam_to_log2bw(treatment_bam, control_bam, thread, output_file):
    """Convert bam file to bigwig file."""
    subprocess.run(["bamCompare", "-b1", treatment_bam, "-b2", control_bam, "--scaleFactorsMethod", "None", "-of", "bigwig", "-o", output_file, "--binSize", "10", "-p", thread, "--normalizeUsing", "CPM"])


def index_bam(bamfile, thread):
    """Index bam file."""
    subprocess.run(["samtools", "index", "-@", thread, bamfile])


def filter_bam(bamfile, thread, outdir, output_file, genome):
    """Filter bam to include only main chromosomes."""
    if not genome in ["mm10", "hg38", "hg38_KSHV"]:
        print("The genome has to be one of mm10, hg38, and hg38_KSHV")

    elif genome == "hg38_KSHV":
        # output_path = os.path.join(outdir, output_file)
        # filtered on combined genome of human and HHV8
        subprocess.run(["samtools", "view", "-b", "-h", "-@", thread, "-o", output_file, bamfile, "chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY", "chrGQ994935"])

    elif genome == "hg38":

        subprocess.run(["samtools", "view", "-b", "-h", "-@", thread, "-o", output_file, bamfile, "chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY"])

    elif genome == "mm10":

        subprocess.run(["samtools", "view", "-b", "-h", "-@", thread, "-o", output_file, bamfile, "chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chrX", "chrY"])



def call_gopeaks(control_bam, treatment_bam, gopeaks_dir, outfile):
    """Find peaks using gopeaks"""
    subprocess.run(["gopeaks", "-bam", treatment_bam, "-control", control_bam, "-cs", chromosome_sizes, "-of", outfile])



def call_macs2_peaks(macs2_dir, control_bam, treatment_bam, out_dir):
    subprocess.run([os.path.join(macs2_dir, "macs2"), "callpeak", "--broad", "-t", treatment_bam, "-c", control_bam, "-p", "1e-3", "-f", "BAMPE", "--keep-dup", "all", "-n", os.path.join(out_dir, treatment_bam)])
