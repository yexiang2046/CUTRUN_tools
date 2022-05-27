#!/bin/bash

FILE_DIR=/home/xiang/DNA_seq/CD8_CUTRUN/all_ChIPseq_aligned/
FILE_DIR_LOG=/home/xiang/DNA_seq/CD8_CUTRUN/bw_files/
T24acFILEs=("7523-MM-26.filteredChr.bl.bw" "7523-MM-27.filteredChr.bl.bw" "7523-MM-31.filteredChr.bl.bw" "7523-MM-32.filteredChr.bl.bw" "7523-MM-36.filteredChr.bl.bw" "7523-MM-37.filteredChr.bl.bw" "7523-MM-41.filteredChr.bl.bw" "7523-MM-42.filteredChr.bl.bw")
T24me3FILEs=("7523-MM-28.filteredChr.bl.bw" "7523-MM-29.filteredChr.bl.bw" "7523-MM-33.filteredChr.bl.bw" "7523-MM-34.filteredChr.bl.bw" "7523-MM-39.filteredChr.bl.bw" "7523-MM-43.filteredChr.bl.bw" "7523-MM-44.filteredChr.bl.bw") #  "7523-MM-38.filteredChr.bl.bw" 24hr DON failed

T48ac_FILEs=("7523-MM-46.filteredChr.bl.bw" "7523-MM-47.filteredChr.bl.bw" "7523-MM-51.filteredChr.bl.bw" "7523-MM-52.filteredChr.bl.bw" "7523-MM-56.filteredChr.bl.bw" "7523-MM-57.filteredChr.bl.bw" "7523-MM-61.filteredChr.bl.bw" "7523-MM-62.filteredChr.bl.bw")
T48me3_FILEs=("7523-MM-48.filteredChr.bl.bw" "7523-MM-49.filteredChr.bl.bw" "7523-MM-53.filteredChr.bl.bw" "7523-MM-54.filteredChr.bl.bw" "7523-MM-58.filteredChr.bl.bw" "7523-MM-59.filteredChr.bl.bw" "7523-MM-63.filteredChr.bl.bw" "7523-MM-64.filteredChr.bl.bw")

T48ac_FILEs_log=("T48hr_H3K27ac_A.bw" "T48hr_H3K27ac_B.bw" "T48hr_CB839_H3K27ac_A.bw" "T48hr_CB839_H3K27ac_B.bw" "T48hr_DON_H3K27ac_A.bw" "T48hr_DON_H3K27ac_B.bw" "T48hr_NoQ_H3K27ac_A.bw" "T48hr_NoQ_H3K27ac_B.bw")
T48me3_FILEs_log=("T48hr_H3K27me3_A.bw" "T48hr_H3K27me3_B.bw" "T48hr_CB839_H3K27me3_A.bw" "T48hr_CB839_H3K27me3_B.bw" "T48hr_DON_H3K27me3_A.bw" "T48hr_DON_H3K27me3_B.bw" "T48hr_NoQ_H3K27me3_A.bw" "T48hr_NoQ_H3K27me3_B.bw")



# cd ${FILE_DIR}
T24hr_H3K27ac_peaks=T24hr_H3K27ac.bed
T24hr_H3K27me3_peaks=T24hr_H3K27me3.bed
T48hr_H3K27ac_peaks=T48hr_H3K27ac.bed
T48hr_H3K27me3_peaks=T48hr_H3K27me3.bed
# merge 24hr H3K27ac peaks
cat ${FILE_DIR}/T24hr_CB839_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T24hr_CB839_b2_H3K27ac_B_peaks.bed ${FILE_DIR}/T24hr_CTL_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T24hr_CTL_b2_H3K27ac_B_peaks.bed ${FILE_DIR}/T24hr_CTL_H3K27ac_A_peaks.bed ${FILE_DIR}/T24hr_CTL_H3K27ac_B_peaks.bed ${FILE_DIR}/T24hr_DON_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T24hr_DON_b2_H3K27ac_B_peaks.bed ${FILE_DIR}/T24hr_NoQ_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T24hr_NoQ_b2_H3K27ac_B_peaks.bed > ${FILE_DIR}/T24hr_H3K27ac_merged.bed
bedtools sort -i ${FILE_DIR}/T24hr_H3K27ac_merged.bed > ${FILE_DIR}/T24hr_H3K27ac_merged.srt.bed

# remove the regions abnormal mannually
bedtools intersect -v -a ${FILE_DIR}/T24hr_H3K27ac_merged.srt.bed -b ${FILE_DIR}/T24hr_ac_mannual_bl.bed > ${FILE_DIR}/T24hr_H3K27ac_merged.srt.bl.bed
bedtools merge -i ${FILE_DIR}/T24hr_H3K27ac_merged.srt.bl.bed -d -100 -o mean -c 5 > ${FILE_DIR}/${T24hr_H3K27ac_peaks}



# merge 24hr H3K27me3 peaks
cat ${FILE_DIR}/T24hr_CB839_b2_H3K27me3_A_peaks.bed ${FILE_DIR}/T24hr_CB839_b2_H3K27me3_B_peaks.bed ${FILE_DIR}/T24hr_CTL_b2_H3K27me3_A_peaks.bed ${FILE_DIR}/T24hr_CTL_b2_H3K27me3_B_peaks.bed ${FILE_DIR}/T24hr_CTL_H3K27me3_A_peaks.bed ${FILE_DIR}/T24hr_CTL_H3K27me3_B_peaks.bed ${FILE_DIR}/T24hr_DON_b2_H3K27me3_B_peaks.bed ${FILE_DIR}/T24hr_NoQ_b2_H3K27me3_A_peaks.bed ${FILE_DIR}/T24hr_NoQ_b2_H3K27me3_B_peaks.bed > ${FILE_DIR}/T24hr_H3K27me3_merged.bed # T24hr_DON_b2_H3K27me3_A_peaks.bed
bedtools sort -i ${FILE_DIR}/T24hr_H3K27me3_merged.bed > ${FILE_DIR}/T24hr_H3K27me3_merged.srt.bed
bedtools merge -i ${FILE_DIR}/T24hr_H3K27me3_merged.srt.bed -d -100 -o mean -c 5 > ${FILE_DIR}/${T24hr_H3K27me3_peaks}


# merge 48hr H3K27ac peaks
cat ${FILE_DIR}/T48hr_CB839_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T48hr_CB839_b2_H3K27ac_B_peaks.bed ${FILE_DIR}/T48hr_CTL_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T48hr_CTL_b2_H3K27ac_B_peaks.bed ${FILE_DIR}/T48hr_CTL_H3K27ac_A_peaks.bed ${FILE_DIR}/T48hr_CTL_H3K27ac_B_peaks.bed ${FILE_DIR}/T48hr_DON_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T48hr_DON_b2_H3K27ac_B_peaks.bed ${FILE_DIR}/T48hr_NoQ_b2_H3K27ac_A_peaks.bed ${FILE_DIR}/T48hr_NoQ_b2_H3K27ac_B_peaks.bed > ${FILE_DIR}/T48hr_H3K27ac_merged.bed
bedtools sort -i ${FILE_DIR}/T48hr_H3K27ac_merged.bed > ${FILE_DIR}/T48hr_H3K27ac_merged.srt.bed
bedtools merge -i ${FILE_DIR}/T48hr_H3K27ac_merged.srt.bed -d -100 -o mean -c 5 > ${FILE_DIR}/${T48hr_H3K27ac_peaks}


# merge 48hr H3K27me3 peaks
cat ${FILE_DIR}/T48hr_CB839_b2_H3K27me3_A_peaks.bed ${FILE_DIR}/T48hr_CB839_b2_H3K27me3_B_peaks.bed ${FILE_DIR}/T48hr_CTL_b2_H3K27me3_A_peaks.bed ${FILE_DIR}/T48hr_CTL_b2_H3K27me3_B_peaks.bed ${FILE_DIR}/T48hr_CTL_H3K27me3_A_peaks.bed ${FILE_DIR}/T48hr_CTL_H3K27me3_B_peaks.bed ${FILE_DIR}/T48hr_DON_b2_H3K27me3_A_peaks.bed ${FILE_DIR}/T48hr_DON_b2_H3K27me3_B_peaks.bed ${FILE_DIR}/T48hr_NoQ_b2_H3K27me3_A_peaks.bed ${FILE_DIR}/T48hr_NoQ_b2_H3K27me3_B_peaks.bed > ${FILE_DIR}/T48hr_H3K27me3_merged.bed
bedtools sort -i ${FILE_DIR}/T48hr_H3K27me3_merged.bed > ${FILE_DIR}/T48hr_H3K27me3_merged.srt.bed
bedtools merge -i ${FILE_DIR}/T48hr_H3K27me3_merged.srt.bed -d -100 -o mean -c 5 > ${FILE_DIR}/${T48hr_H3K27me3_peaks}

#computeMatrix reference-point --referencePoint center -S ${T24acFILEs[@]} -R ${T24hr_H3K27ac_peaks} -a 3000 -b 3000 -o T24ac.npz -p 32
#computeMatrix reference-point --referencePoint center -S ${T24me3FILEs[@]} -R ${T24hr_H3K27me3_peaks} -a 3000 -b 3000 -o T24me3.npz -p 32

# plotHeatmap -m T24ac.npz -o T24ac.pdf --kmeans 4 --outFileSortedRegions T24ac_km4.bed --samplesLabel 24hrA 24hrB 24hr_CB839A 24hr_CB839B 24hr_DONA 24hr_DONB 24hr_NoQA 24hr_NoQB
# plotHeatmap -m T24me3.npz -o T24me3.pdf --kmeans 4 --outFileSortedRegions T24me3_km4.bed --samplesLabel 24hrA 24hrB 24hr_CB839A 24hr_CB839B 24hr_DONB 24hr_NoQA 24hr_NoQB

# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs[@]} -R ${T48hr_H3K27ac_peaks} -a 3000 -b 3000 -o T48ac.npz -p 32
# computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs[@]} -R ${T48hr_H3K27me3_peaks} -a 3000 -b 3000 -o T48me3.npz -p 32

# plotHeatmap -m T48ac.npz -o T48ac_km.pdf --kmeans 4 --outFileSortedRegions T48ac_km4.bed --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB
# plotHeatmap -m T48me3.npz -o T48me3_km.pdf --kmeans 4 --outFileSortedRegions T48me3_km4.bed --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB
cd ${FILE_DIR_LOG}
# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs_log[@]} -R ${FILE_DIR}/${T48hr_H3K27ac_peaks} -a 3000 -b 3000 -o T48ac_log.npz -p 32
computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs_log[@]} -R ${FILE_DIR}/${T48hr_H3K27me3_peaks} -a 3000 -b 3000 -o T48me3_log.npz -p 32

# plotHeatmap -m T48ac_log.npz -o T48ac_km_log.pdf --kmeans 4 --outFileSortedRegions T48ac_km4_log.bed --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB
plotHeatmap -m T48me3_log.npz -o T48me3_km_log.pdf --kmeans 4 --outFileSortedRegions T48me3_km4_log.bed --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB

# plotHeatmap -m T48ac.npz -o T48ac.pdf --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB
# plotHeatmap -m T48me3.npz -o T48me3.pdf --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB


# computeMatrix reference-point --referencePoint center -S ${T24acFILEs[@]} ${T48ac_FILEs[@]} -R ${T24hr_H3K27ac_merged} ${T48hr_H3K27ac_peaks} -a 3000 -b 3000 -o T24_48hr_ac.npz -p 32
# computeMatrix reference-point --referencePoint center -S ${T24me3FILEs[@]} ${T48me3_FILEs[@]} -R ${T24hr_H3K27me3_peaks} ${T48hr_H3K27me3_peaks} -a 3000 -b 3000 -o T24_48hr_me3.npz -p 32
# plotHeatmap -m T24_48hr_ac.npz -o T24_48hr_ac.pdf --kmeans 4 --samplesLabel 24hrA 24hrB 24hr_CB839A 24hr_CB839B 24hr_DONA 24hr_DONB 24hr_NoQA 24hr_NoQB 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB
# plotHeatmap -m T24_48hr_me3.npz -o T24_48hr_me3.pdf --kmeans 4 --samplesLabel 24hrA 24hrB 24hr_CB839A 24hr_CB839B 24hr_DONB 24hr_NoQA 24hr_NoQB 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB

# separate time point analysis

# computeMatrix reference-point --referencePoint center -S ${T24acFILEs[@]} -R ${T24hr_H3K27ac_peaks} -a 3000 -b 3000 -o T24hr_ac.npz -p 32
# computeMatrix reference-point --referencePoint center -S ${T48ac_FILEs[@]} -R ${T48hr_H3K27ac_peaks} -a 3000 -b 3000 -o T48hr_ac.npz -p 32

# computeMatrix reference-point --referencePoint center -S ${T24me3FILEs[@]} -R ${T24hr_H3K27me3_peaks} -a 3000 -b 3000 -o T24hr_me3.npz -p 32
# computeMatrix reference-point --referencePoint center -S ${T48me3_FILEs[@]} -R ${T48hr_H3K27me3_peaks} -a 3000 -b 3000 -o T48hr_me3.npz -p 32

# plotHeatmap -m T24hr_ac.npz -o T24hr_ac.pdf --outFileSortedRegions T24hr_ac_cl.bed --kmeans 4 --samplesLabel 24hrA 24hrB 24hr_CB839A 24hr_CB839B 24hr_DONA 24hr_DONB 24hr_NoQA 24hr_NoQB
# plotHeatmap -m T48hr_ac.npz -o T48hr_ac.pdf --outFileSortedRegions T48hr_ac_cl.bed --kmeans 4 --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB

# plotHeatmap -m T24hr_me3.npz -o T24hr_me3.pdf --outFileSortedRegions T24hr_me3_cl.bed --kmeans 4 --samplesLabel 24hrA 24hrB 24hr_CB839A 24hr_CB839B 24hr_DONB 24hr_NoQA 24hr_NoQB
# plotHeatmap -m T48hr_me3.npz -o T48hr_me3.pdf --outFileSortedRegions T48hr_me3_cl.bed --kmeans 4 --samplesLabel 48hrA 48hrB 48hr_CB839A 48hr_CB839B 48hr_DONA 48hr_DONB 48hr_NoQA 48hr_NoQB
