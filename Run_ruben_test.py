
import re
import subprocess
import os

# import custom library for get info from configfile
import py_lib.utils as pu

# Hard coded constant, to be added to configfile
TREATMENT_GROUP_N = 2
GROUP_SIZE = 9
IgG1_IDX = 4
TREAT1_IDX = [0,1,2,3,10,11,12,13]
IgG2_IDX = 9
TREAT2_IDX = [5,6,7,8,14,15,16,17]


Para = pu.get_para(configfile="config_LANA_KD_CUTRUN.txt")
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
#macs2_dir = Para[14]
#gopeaks_dir = Para[15]

gopeaks_out_dir = "gopeaks_out"

fastq_files = pu.get_fastq(configfile="config_LANA_KD_CUTRUN.txt")
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
bw_path = os.path.join(out_dir, "bw_files")

if not os.path.exists(alignment_path):
    os.mkdir(alignment_path)

if not os.path.exists(trimmed_path):
    os.mkdir(trimmed_path)

if not os.path.exists(bw_path):
    os.mkdir(bw_path)


## print(Para)
## print(fastq_files)
## print(cutadapt_dir)
## trim reads
fastq_path = os.path.join(out_dir, fastq_dir)
print(fastq_path)


if (pair_end == "Yes"):
    sample_num = int(len(fastq_files)/2)

    for i in range(sample_num):

        file1 = os.path.join(fastq_path, fastq_files[i*2])
        file2 = os.path.join(fastq_path, fastq_files[i*2+1])
        subprocess.run(["./bash/step1_reads_trimming.sh", thread_num, out_dir, trimmer_dir, alignment_dir, pair_end, trimmed_path, cutadapt_dir, file1, file2])



## align

print(samples)
sample_num = len(samples)
print("sample number:")
print(sample_num)
for i in range(sample_num):
    file = os.path.basename(samples[i]).split('_', 1)[0]
#    print(file)
    trimmed_file1 = "".join([file, "_S1_L005_R1_001_val_1.fq.gz"])
    trimmed_files1 = os.path.join(trimmed_path, trimmed_file1)
    trimmed_file2 = "".join([file, "_S1_L005_R2_001_val_2.fq.gz"])
    trimmed_files2 = os.path.join(trimmed_path, trimmed_file2)
    print(trimmed_files1)
    print(trimmed_files2)
    subprocess.run(["./bash/step2_align.sh", thread_num, genome_file_wPath, align_idx, out_dir, bowtie2_dir, alignment_path, pair_end, trimmed_files1, trimmed_files2])

# filter bam files
for sample in samples:
    print(sample, "_sorted.bam")
    bam_file = "".join([sample, "_sorted.bam"])
    bam_file = os.path.join(alignment_path, bam_file)
    pu.index_bam(bam_file, thread = thread_num)
    pu.filter_bam(bamfile = bam_file, thread = thread_num, outdir = alignment_path, output_file = "".join([alignment_path, "/", sample, ".filteredChr.bam"]), genome = genome)
    pu.index_bam("".join([alignment_path, "/", sample, ".filteredChr.bam"]), thread = thread_num)
    pu.bam_to_bw("".join([alignment_path, "/", sample, ".filteredChr.bam"]), thread = thread_num, output_file="".join([bw_path, "/", sample, ".bw"]))
