#!/bin/bash

DATA_DIR=/home/xiang/New_disk1/CD8_CUTRUN/data/

WORK_DIR=$(pwd)

# bw from bamCoverage
# T48ac_FILEs=("7523-MM-46.filteredChr.bl.bw" "7523-MM-47.filteredChr.bl.bw" "7523-MM-51.filteredChr.bl.bw" "7523-MM-52.filteredChr.bl.bw" "7523-MM-56.filteredChr.bl.bw" "7523-MM-57.filteredChr.bl.bw" "7523-MM-61.filteredChr.bl.bw" "7523-MM-62.filteredChr.bl.bw")
# T48me3_FILEs=("7523-MM-48.filteredChr.bl.bw" "7523-MM-49.filteredChr.bl.bw" "7523-MM-53.filteredChr.bl.bw" "7523-MM-54.filteredChr.bl.bw" "7523-MM-58.filteredChr.bl.bw" "7523-MM-59.filteredChr.bl.bw" "7523-MM-63.filteredChr.bl.bw" "7523-MM-64.filteredChr.bl.bw")

T48ac_FILEs_cov=("T48hr_CTL_H3K27ac_cov.bw" "T48hr_CB839_H3K27ac_cov.bw" "T48hr_DON_H3K27ac_cov.bw" "T48hr_NoQ_H3K27ac_cov.bw")
T48me3_FILEs_cov=("T48hr_CTL_H3K27me3_cov.bw" "T48hr_CB839_H3K27me3_cov.bw" "T48hr_DON_H3K27me3_cov.bw" "T48hr_NoQ_H3K27me3_cov.bw")

T48ac_FILEs_log=("T48hr_CTL_H3K27ac.bw" "T48hr_CB839_H3K27ac.bw" "T48hr_DON_H3K27ac.bw" "T48hr_NoQ_H3K27ac.bw")
T48me3_FILEs_log=("T48hr_CTL_H3K27me3.bw" "T48hr_CB839_H3K27me3.bw" "T48hr_DON_H3K27me3.bw" "T48hr_NoQ_H3K27me3.bw")


T48hr_H3K27ac_all_peaks=(${DATA_DIR}/T48hr_CTL_H3K27ac_idr.05.bed ${DATA_DIR}/T48hr_CB839_H3K27ac_idr.05.bed ${DATA_DIR}/T48hr_DON_H3K27ac_idr.05.bed ${DATA_DIR}/T48hr_NoQ_H3K27ac_idr.05.bed)
T48hr_H3K27me3_all_peaks=(${DATA_DIR}/T48hr_CTL_H3K27me3_idr.05.bed ${DATA_DIR}/T48hr_CB839_H3K27me3_idr.05.bed ${DATA_DIR}/T48hr_DON_H3K27me3_idr.05.bed ${DATA_DIR}/T48hr_NoQ_H3K27me3_idr.05.bed)

T48hr_H3K27ac_peaks=T48hr_H3K27ac.bed
T48hr_H3K27me3_peaks=T48hr_H3K27me3.bed

T48hr_peaks=T48hr_ac_me3.bed

# merge 48hr H3K27ac peaks
# cat ${DATA_DIR}/T48hr_CTL_H3K27ac_idr.05.bed ${DATA_DIR}/T48hr_CB839_H3K27ac_idr.05.bed ${DATA_DIR}/T48hr_DON_H3K27ac_idr.05.bed ${DATA_DIR}/T48hr_NoQ_H3K27ac_idr.05.bed > ${DATA_DIR}/T48hr_H3K27ac_union.bed
# bedtools sort -i ${DATA_DIR}/T48hr_H3K27ac_union.bed > ${DATA_DIR}/T48hr_H3K27ac_union.srt.bed
# bedtools merge -i ${DATA_DIR}/T48hr_H3K27ac_union.srt.bed  > ${DATA_DIR}/${T48hr_H3K27ac_peaks}


# merge 48hr H3K27me3 peaks
# cat ${DATA_DIR}/T48hr_CTL_H3K27me3_idr.05.bed ${DATA_DIR}/T48hr_CB839_H3K27me3_idr.05.bed ${DATA_DIR}/T48hr_DON_H3K27me3_idr.05.bed ${DATA_DIR}/T48hr_NoQ_H3K27me3_idr.05.bed > ${DATA_DIR}/T48hr_H3K27me3_union.bed
# bedtools sort -i ${DATA_DIR}/T48hr_H3K27me3_union.bed > ${DATA_DIR}/T48hr_H3K27me3_union.srt.bed
# bedtools merge -i ${DATA_DIR}/T48hr_H3K27me3_union.srt.bed  > ${DATA_DIR}/${T48hr_H3K27me3_peaks}

cat ${DATA_DIR}/${T48hr_H3K27ac_peaks} ${DATA_DIR}/${T48hr_H3K27me3_peaks} > tmp.bed

bedtools sort -i tmp.bed > tmp.srt.bed
rm tmp.bed
bedtools merge -i tmp.srt.bed > ${DATA_DIR}/${T48hr_peaks}


cd ${DATA_DIR}
# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs_log[@]} -R ${DATA_DIR}/${T48hr_H3K27ac_peaks} -a 5000 -b 5000 -o T48ac_log.npz -p 12

# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs_log[@]} -R ${DATA_DIR}/${T48hr_H3K27me3_peaks} -a 5000 -b 5000 -o T48ac_log_on_me3.npz -p 12
# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs_log[@]} -R ${DATA_DIR}/${T48hr_H3K27ac_peaks} -a 1500 -b 1500 -o T48ac_log1.5kb.npz -p 12
# computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs_log[@]} -R ${DATA_DIR}/${T48hr_H3K27me3_peaks} -a 5000 -b 5000 -o T48me3_log.npz -p 12
# computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs_log[@]} -R ${DATA_DIR}/${T48hr_H3K27ac_peaks} -a 5000 -b 5000 -o T48me3_log_on_ac.npz -p 12
# computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs_log[@]} -R ${DATA_DIR}/${T48hr_H3K27me3_peaks} -a 1500 -b 1500 -o T48me3_log1.5kb.npz -p 12
# plotHeatmap -m T48ac_log.npz -o T48ac_km_log.pdf --kmeans 4 --outFileSortedRegions T48ac_km4_log.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
# plotHeatmap -m T48ac_log1.5kb.npz -o T48ac_km_log1.5kb.pdf --kmeans 4 --outFileSortedRegions T48ac_km4_log1.5kb.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10

# plotHeatmap -m T48me3_log.npz -o T48me3_km_log.pdf --kmeans 4 --outFileSortedRegions T48me3_km4_log.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
# plotHeatmap -m T48me3_log1.5kb.npz -o T48me3_km_log1.5kb.pdf --kmeans 4 --outFileSortedRegions T48me3_km4_log1.5kb.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10

# plotHeatmap -m T48ac_log.npz -o T48ac_log.pdf --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
# plotHeatmap -m T48ac_log1.5kb.npz -o T48ac_log1.5kb.pdf --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10

# plotHeatmap -m T48me3_log.npz -o T48me3_log.pdf --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
# plotHeatmap -m T48me3_log1.5kb.npz -o T48me3_log1.5kb.pdf --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10


# plotHeatmap -m T48ac_log_on_me3.npz -o T48ac_log_on_me3.pdf --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
# plotHeatmap -m T48me3_log_on_ac.npz -o T48me3_log_on_ac.pdf --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10


# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs_cov[@]} -R ${DATA_DIR}/${T48hr_H3K27ac_peaks} -a 5000 -b 5000 -o T48ac_cov.npz -p 12
# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs_cov[@]} -R ${DATA_DIR}/${T48hr_H3K27ac_peaks} -a 1500 -b 1500 -o T48ac_cov1.5kb.npz -p 12
# computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs_cov[@]} -R ${DATA_DIR}/${T48hr_H3K27me3_peaks} -a 5000 -b 5000 -o T48me3_cov.npz -p 12
# computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs_cov[@]} -R ${DATA_DIR}/${T48hr_H3K27me3_peaks} -a 1500 -b 1500 -o T48me3_cov1.5kb.npz -p 12
# plotHeatmap -m T48ac_cov.npz -o T48ac_km_cov.pdf --kmeans 1 --outFileSortedRegions T48ac_km4_cov.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
# plotHeatmap -m T48ac_cov1.5kb.npz -o T48ac_km_cov1.5kb.pdf --kmeans 1 --outFileSortedRegions T48ac_km4_cov1.5kb.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10

# plotHeatmap -m T48me3_cov.npz -o T48me3_km_cov.pdf --kmeans 1 --outFileSortedRegions T48me3_km4_cov.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
# plotHeatmap -m T48me3_cov1.5kb.npz -o T48me3_km_cov1.5kb.pdf --kmeans 1 --outFileSortedRegions T48me3_km4_cov1.5kb.bed --samplesLabel 48hr_CTL 48hr_CB839 48hr_DON 48hr_NoQ --heatmapHeight 30 --heatmapWidth 10
cd ${WORK_DIR}


annotatePeaks.pl ${T48hr_H3K27ac_peaks} mm10 -cpu 20 > T48hr_H3K27ac_annotation.txt
annotatePeaks.pl ${T48hr_H3K27me3_peaks} mm10 -cpu 20 > T48hr_H3K27me3_annotation.txt

for f in "${T48hr_H3K27ac_all_peaks[@]}"
do
    annotatePeaks.pl $f mm10 -cpu 20 > $(basename -s .bed $f).annotation.txt
done

for f in "${T48hr_H3K27me3_all_peaks[@]}"
do
    annotatePeaks.pl $f mm10 -cpu 20 > $(basename -s .bed $f).annotation.txt
done