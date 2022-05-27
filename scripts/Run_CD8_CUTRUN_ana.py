
import re
import subprocess
import os

# import custom library for get info from configfile
import py_lib.utils as pu

## For batch1
# TREATMENT_GROUP_N = 6

# For batch2
TREATMENT_GROUP_N = 4

Para = pu.get_para(configfile="config_CD8_CUTRUN.txt")
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
#gopeaks_dir = Para[15]

gopeaks_out_dir = "gopeaks_out"

fastq_files = pu.get_fastq(configfile="config_CD8_CUTRUN.txt")
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

sample_num = int(len(fastq_files)/2)
for i in range(sample_num):
    file = os.path.basename(fastq_files[i*2]).split('_', 1)[0]
#    print(file)
    trimmed_file1 = "".join([file, "_S1_L005_R1_001_val_1.fq.gz"])
    trimmed_files1 = os.path.join(trimmed_path, trimmed_file1)
    trimmed_file2 = "".join([file, "_S1_L005_R2_001_val_2.fq.gz"])
    trimmed_files2 = os.path.join(trimmed_path, trimmed_file2)
    subprocess.run(["./bash/step2_align.sh", thread_num, genome_file_wPath, align_idx, out_dir, bowtie2_dir, alignment_path, pair_end, trimmed_files1, trimmed_files2])
    # print(trimmed_files1, trimmed_files2)
    # print(samples[i])


for sample in samples:
    print(sample, "_sorted.bam")
    bam_file = "".join([sample, "_sorted.bam"])
    bam_file = os.path.join(alignment_path, bam_file)
    pu.index_bam(bam_file, thread = thread_num)
    pu.filter_bam(bamfile = bam_file, thread = thread_num, outdir = alignment_path, output_file = "".join([alignment_path, "/", sample, ".filteredChr.bam"]), genome = genome)
    pu.index_bam("".join([alignment_path, "/", sample, ".filteredChr.bam"]), thread = thread_num)


# callpeaks samples in order of control1, sample1A, sample1B control2, sample2A, sample2B ...
macs2_output_path = os.path.join(out_dir, macs2_output_dir)
if not os.path.exists(macs2_output_path):
    os.mkdir(macs2_output_path)
print(samples)

# call peaks
for i in range(int(len(samples)/5)):
    control_bam = "".join([samples[i*5+TREATMENT_GROUP_N], ".filteredChr.bl.bam"])
    control_bam_Wpath = os.path.join(alignment_path, control_bam)
    for j in range (TREATMENT_GROUP_N):

        treatment_bam = "".join([samples[i*5+j], ".filteredChr.bl.bam"])
        treatment_bam_Wpath = os.path.join(alignment_path, treatment_bam)
        pu.call_macs2_peaks(macs2_dir, control_bam_Wpath, treatment_bam_Wpath, macs2_output_path)


    # subprocess.run(["./bash/step4_filter_peak_idr.sh", idr_dir, macs2_output_path, "".join([samples[i*5], ".filteredChr.bam_peaks.broadPeak"]), "".join([samples[i*5+1], ".filteredChr.bam_peaks.broadPeak"]), samples[i*5]])

    # subprocess.run(["./bash/step4_filter_peak_idr.sh", idr_dir, macs2_output_path, "".join([samples[i*5+2], ".filteredChr.bam_peaks.broadPeak"]), "".join([samples[i*5+3], ".filteredChr.bam_peaks.broadPeak"]), samples[i*5+2]])
