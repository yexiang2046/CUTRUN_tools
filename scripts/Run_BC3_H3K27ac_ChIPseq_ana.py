
import re
import subprocess
import os

# import custom library for get info from configfile
import py_lib.utils as pu


Para = pu.get_para(configfile="config_BC3_H3K27ac_ChIPseq.txt")
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





fastq_files = pu.get_fastq(configfile="config_BC3_H3K27ac_ChIPseq.txt")
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


##print(Para)
##print(fastq_files)
##print(cutadapt_dir)
## trim reads
## don't run trim
# for i in range(len(fastq_files)):
    # subprocess.run(["./bash/step1_reads_trimming.sh", thread_num, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_path, cutadapt_dir, os.path.join(fastq_dir, fastq_files[i])])
    # print(i)

## align
for i in range(len(fastq_files)):
    subprocess.run(["./bash/Step2_SE_align.sh", thread_num, genome_file_wPath, align_idx, out_dir, bowtie2_dir, alignment_path, pair_end, trimmed_path, os.path.join(fastq_dir, fastq_files[i])])
    print(i)


