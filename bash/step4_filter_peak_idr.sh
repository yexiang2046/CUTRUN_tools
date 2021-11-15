#!/bin/bash

IDR_DIR=$1
IDR_PEAKS_DIR=$2
PEAK1=$3
PEAK2=$4
SAMPLE=$5


#source ~/miniconda3/bin/activate
export PATH=$PATH:$IDR_DIR

idr --samples $PEAK1 $PEAK2 --input-file-type narrowPeak -o ${IDR_PEAKS_DIR}/$SAMPLE --soft-idr-threshold 0.01
awk '{if ($5 >= 540) {print $0}}' ${IDR_PEAKS_DIR}/$SAMPLE > ${IDR_PEAKS_DIR}/${SAMPLE}.idr.01.txt
cut -f 1-3 ${IDR_PEAKS_DIR}/${SAMPLE}.idr.01.txt | bedtools sort -i - > ${IDR_PEAKS_DIR}/${SAMPLE}.idr.01.bed
