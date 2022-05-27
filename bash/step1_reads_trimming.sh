#!/bin/bash


threads=$1
out_dir=$2
trimmer_dir=$3
alignment_dir=$4
pairend=$5
trimmed_dir=$6
cutadapt_dir=$7
fastq_file1=$8
fastq_file2=$9

echo "threads = ${threads}"
echo "out_dir = ${out_dir}"
echo "trimmer_dir = ${trimmer_dir}"
echo "alignment_dir = ${alignment_dir}"
echo "pairend = ${pairend}"
echo "trimmed_dir = ${trimmed_dir}"
echo "cutadapt_dir = ${cutadapt_dir}"
echo "fastq_file1 = ${fastq_file1}"

export PATH=$PATH:$trimmer_dir
if [[ $pairend == 'Yes' ]]; then
  echo "Trim paired reads: $pairend"
  trim_galore --path_to_cutadapt $cutadapt_dir --illumina --gzip --paired -q 20 --fastqc -j $threads $fastq_file1 $fastq_file2 -o $trimmed_dir
else
  echo "Trim single reads with single end reads"
  trim_galore --path_to_cutadapt $cutadapt_dir --illumina --gzip -q 20 --fastqc -j $threads $fastq_file1 -o $trimmed_dir
fi
