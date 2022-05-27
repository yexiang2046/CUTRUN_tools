#!/bin/bash

cd ~/New_disk1/CD8_CUTRUN/all_ChIPseq_aligned/
#idr --samples 7523-MM-46.filteredChr.bam_peaks.broadPeak 7523-MM-47.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_CTL_H3K27ac_idr.05 --soft-idr-threshold 0.05
#idr --samples 7523-MM-48.filteredChr.bam_peaks.broadPeak 7523-MM-49.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_CTL_H3K27me3_idr.05 --soft-idr-threshold 0.05
#idr --samples 7523-MM-51.filteredChr.bam_peaks.broadPeak 7523-MM-52.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_CB839_H3K27ac_idr.05 --soft-idr-threshold 0.05
#idr --samples 7523-MM-53.filteredChr.bam_peaks.broadPeak 7523-MM-54.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_CB839_H3K27me3_idr.05 --soft-idr-threshold 0.05
#idr --samples 7523-MM-56.filteredChr.bam_peaks.broadPeak 7523-MM-57.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_DON_H3K27ac_idr.05 --soft-idr-threshold 0.05
#idr --samples 7523-MM-58.filteredChr.bam_peaks.broadPeak 7523-MM-59.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_DON_H3K27me3_idr.05 --soft-idr-threshold 0.05
#idr --samples 7523-MM-61.filteredChr.bam_peaks.broadPeak 7523-MM-62.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_NoQ_H3K27ac_idr.05 --soft-idr-threshold 0.05
#idr --samples 7523-MM-63.filteredChr.bam_peaks.broadPeak 7523-MM-64.filteredChr.bam_peaks.broadPeak --input-file-type broadPeak -o T48hr_NoQ_H3K27me3_idr.05 --soft-idr-threshold 0.05
#awk '{if ($5 >= 540) {print $0}}' T48hr_CTL_H3K27ac_idr.05 > T48hr_CTL_H3K27ac_idr.05.txt
#awk '{if ($5 >= 540) {print $0}}' T48hr_CB839_H3K27ac_idr.05 > T48hr_CB839_H3K27ac_idr.05.txt
#awk '{if ($5 >= 540) {print $0}}' T48hr_DON_H3K27ac_idr.05 > T48hr_DON_H3K27ac_idr.05.txt
#awk '{if ($5 >= 540) {print $0}}' T48hr_NoQ_H3K27ac_idr.05 > T48hr_NoQ_H3K27ac_idr.05.txt
#awk '{if ($5 >= 540) {print $0}}' T48hr_CTL_H3K27me3_idr.05 > T48hr_CTL_H3K27me3_idr.05.txt
#awk '{if ($5 >= 540) {print $0}}' T48hr_CB839_H3K27me3_idr.05 > T48hr_CB839_H3K27me3_idr.05.txt
#awk '{if ($5 >= 540) {print $0}}' T48hr_DON_H3K27me3_idr.05 > T48hr_DON_H3K27me3_idr.05.txt
#awk '{if ($5 >= 540) {print $0}}' T48hr_NoQ_H3K27me3_idr.05 > T48hr_NoQ_H3K27me3_idr.05.txt
#
#cut -f 1-3 T48hr_CTL_H3K27ac_idr.05.txt | bedtools sort -i - > T48hr_CTL_H3K27ac_idr.05.bed
#cut -f 1-3 T48hr_CB839_H3K27ac_idr.05.txt | bedtools sort -i - > T48hr_CB839_H3K27ac_idr.05.bed
#cut -f 1-3 T48hr_DON_H3K27ac_idr.05.txt | bedtools sort -i - > T48hr_DON_H3K27ac_idr.05.bed
#cut -f 1-3 T48hr_NoQ_H3K27ac_idr.05.txt | bedtools sort -i - > T48hr_NoQ_H3K27ac_idr.05.bed
#cut -f 1-3 T48hr_CTL_H3K27me3_idr.05.txt | bedtools sort -i - > T48hr_CTL_H3K27me3_idr.05.bed
#cut -f 1-3 T48hr_CB839_H3K27me3_idr.05.txt | bedtools sort -i - > T48hr_CB839_H3K27me3_idr.05.bed
#cut -f 1-3 T48hr_DON_H3K27me3_idr.05.txt | bedtools sort -i - > T48hr_DON_H3K27me3_idr.05.bed
#cut -f 1-3 T48hr_NoQ_H3K27me3_idr.05.txt | bedtools sort -i - > T48hr_NoQ_H3K27me3_idr.05.bed

cat T48hr_CB839_H3K27me3_idr.05.bed T48hr_CTL_H3K27me3_idr.05.bed T48hr_DON_H3K27me3_idr.05.bed T48hr_NoQ_H3K27me3_idr.05.bed > T48hr_H3K27me_merged.bed
bedtools sort -i T48hr_H3K27me_merged.bed > T48hr_H3K27me3_merged.srt.bed
bedtools merge -i T48hr_H3K27me3_merged.srt.bed -d -100 > T48hr_H3K27me3.bed

cat T48hr_CB839_H3K27ac_idr.05.bed T48hr_CTL_H3K27ac_idr.05.bed T48hr_DON_H3K27ac_idr.05.bed T48hr_NoQ_H3K27ac_idr.05.bed > T48hr_H3K27ac_merged.bed
bedtools sort -i T48hr_H3K27ac_merged.bed > T48hr_H3K27ac_merged.srt.bed
bedtools merge -i T48hr_H3K27ac_merged.srt.bed -d -100 > T48hr_H3K27ac.bed
