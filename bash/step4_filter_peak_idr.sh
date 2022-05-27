#!/bin/bash

IDR_DIR=$1
IDR_PEAKS_DIR=$2
PEAK1=$3
PEAK2=$4
SAMPLE=$5


#source ~/miniconda3/bin/activate
export PATH=$PATH:$IDR_DIR


echo "Processing IDR for ${PEAK1} and ${PEAK2}"
idr --samples ${IDR_PEAKS_DIR}/$PEAK1 ${IDR_PEAKS_DIR}/$PEAK2 --input-file-type broadPeak -o ${IDR_PEAKS_DIR}/$SAMPLE --soft-idr-threshold 0.05
awk '{if ($5 >= 540) {print $0}}' ${IDR_PEAKS_DIR}/$SAMPLE > ${IDR_PEAKS_DIR}/${SAMPLE}.idr.05.txt
cut -f 1-3 ${IDR_PEAKS_DIR}/${SAMPLE}.idr.05.txt | bedtools sort -i - > ${IDR_PEAKS_DIR}/${SAMPLE}.idr.05.bed
