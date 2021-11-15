#!/bin/bash


export PATH=$PATH:/home/xiang/src/FastQC

FASTQC_OUT=FASTQC_OUT
THREADS=8
FASTQ_DIR=OG


fastq -o $FASTQC_OUT -t $THREADS -f fastq $FASTQ_DIR/*
