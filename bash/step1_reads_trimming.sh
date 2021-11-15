#!/bin/bash


threads=$1
align_idx=$2
out_dir=$3
trimmer_dir=$4
alignment_dir=$5
pairend=$6
trimmed_dir=$7
cutadapt_dir=$8
fastq_file1=$9
fastq_file2=$10

export PATH=$PATH:$trimmer_dir

if [[ $pairend == 'Yes' ]]; then
  echo "Trim paired reads: $pairend"
  trim_galore --path_to_cutadapt $cutadapt_dir --illumina --gzip --paired -q 20 --fastqc -j $threads $fastq_file1 $fastq_file2 -o $trimmed_dir
else
  echo "Trim single reads..."
  echo "cutadapt_dir: $cutadapt_dir"
  trim_galore --path_to_cutadapt $cutadapt_dir --illumina --gzip -q 20 --fastqc -j $threads $fastq_file1 -o $trimmed_dir
fi
