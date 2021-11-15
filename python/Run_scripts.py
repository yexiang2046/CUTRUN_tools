
import re
import subprocess
import os


def get_para(configfile):

    with open(configfile) as f:

        for line in f:
            line.rstrip()
            m = re.match(r"(Threads):(\d+)", line)
            idx = re.match(r"^(Index):(.*)$", line)
            fqdir = re.match(r"^(Fastq_dir):(.*)$", line)
            outdir = re.match(r"(Output_dir):(.*)$", line)
            trim = re.match(r"(TrimGalore):(.*)$", line)
            align = re.match(r"(Alignment_dir):(.*)$", line)
            pairend = re.match(r"(PAIREND):(.*)$", line)
            trimmed = re.match(r"(Trimmed_dir):(.*)$", line)
            fastqdir = re.match(r"(Fastq_dir):(.*)", line)
            cutadapt = re.match(r"(Cutadapt):(.*)", line)
            fastqc = re.match(r"(FastQC_dir):(.*)", line)
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

    return thread_num, align_idx, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_dir, fastq_dir, cutadapt_dir


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

fastq_files = get_fastq(configfile="config_BC3_H3K27ac_ChIPseq.txt")
alignment_path = os.path.join(out_dir, alignment_dir)
trimmed_path = os.path.join(out_dir, trimmed_output)

if not os.path.exists(alignment_path)
    os.mkdir(alignment_path)

if not os.path.exists(trimmed_path):
    os.mkdir(trimmed_path)

print(Para)
print(fastq_files)
print(cutadapt_dir)
#if (pair_end == "Yes"):
#    print("not Yet")
#else:
#for i in range(len(fastq_files)):
#    subprocess.run(["./bash/step1_reads_trimming.sh", thread_num, align_idx, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_path, cutadapt_dir, os.path.join(fastq_dir, fastq_files[i])])
for i in range(len(fastq_files)):
    subprocess.run(["./bash/step2_align.sh", thread_num, align_idx, out_dir, bowtie2_dir, alignment_dir, pair_end, trimmed_path, os.path.join(fastq_dir, fastq_files[i])])
#    print(os.path.join(fastq_dir, fastq_files[1]))
