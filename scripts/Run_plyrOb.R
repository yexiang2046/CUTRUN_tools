
library(devtools)
load_all()

WORKING_DIR <- getwd()

BAM_DIR <- "/home/xiang/New_disk1/CD8_CUTRUN/all_ChIPseq_aligned"
BAM_DATA <- "/home/xiang/New_disk1/CD8_CUTRUN/data"

if(FALSE){
	# input
	B1_cutrunbamFiles <- c("6781-MM-1.filteredChr.bl.bam",
	                    "6781-MM-2.filteredChr.bl.bam",
	                    "6781-MM-3.filteredChr.bl.bam",
	                    "6781-MM-4.filteredChr.bl.bam",
	                    "6781-MM-5.filteredChr.bl.bam",
	                    "6781-MM-6.filteredChr.bl.bam",
	                    "6781-MM-7.filteredChr.bl.bam",
	                    "6781-MM-8.filteredChr.bl.bam",
	                    "6781-MM-9.filteredChr.bl.bam",
	                    "6781-MM-10.filteredChr.bl.bam",
	                    "6781-MM-11.filteredChr.bl.bam",
	                    "6781-MM-12.filteredChr.bl.bam",
	                    "6781-MM-13.filteredChr.bl.bam",
	                    "6781-MM-14.filteredChr.bl.bam",
	                    "6781-MM-15.filteredChr.bl.bam",
	                    "6781-MM-16.filteredChr.bl.bam",
	                    "6781-MM-17.filteredChr.bl.bam",
	                    "6781-MM-18.filteredChr.bl.bam",
	                    "6781-MM-20.filteredChr.bl.bam",
	                    "6781-MM-21.filteredChr.bl.bam",
	                    "6781-MM-22.filteredChr.bl.bam",
	                    "6781-MM-23.filteredChr.bl.bam",
	                    "6781-MM-24.filteredChr.bl.bam",
	                    "6781-MM-25.filteredChr.bl.bam",
	                    "6781-MM-26.filteredChr.bl.bam",
	                    "6781-MM-27.filteredChr.bl.bam",
	                    "6781-MM-28.filteredChr.bl.bam",
	                    "6781-MM-29.filteredChr.bl.bam",
	                    "6781-MM-30.filteredChr.bl.bam",
	                    "6781-MM-31.filteredChr.bl.bam",
	                    "6781-MM-32.filteredChr.bl.bam",
	                    "6781-MM-33.filteredChr.bl.bam",
	                    "6781-MM-34.filteredChr.bl.bam",
	                    "6781-MM-35.filteredChr.bl.bam")
	
	B2_cutrunbamFiles <- c("7523-MM-01.filteredChr.bl.bam",
	                       "7523-MM-02.filteredChr.bl.bam",
	                       "7523-MM-03.filteredChr.bl.bam",
	                       "7523-MM-04.filteredChr.bl.bam",
	                       "7523-MM-05.filteredChr.bl.bam",
	                       "7523-MM-06.filteredChr.bl.bam",
	                       "7523-MM-07.filteredChr.bl.bam",
	                       "7523-MM-08.filteredChr.bl.bam",
	                       "7523-MM-09.filteredChr.bl.bam",
	                       "7523-MM-10.filteredChr.bl.bam",
	                       "7523-MM-11.filteredChr.bl.bam",
	                       "7523-MM-12.filteredChr.bl.bam",
	                       "7523-MM-13.filteredChr.bl.bam",
	                       "7523-MM-14.filteredChr.bl.bam",
	                       "7523-MM-15.filteredChr.bl.bam",
	                       "7523-MM-16.filteredChr.bl.bam",
	                       "7523-MM-17.filteredChr.bl.bam",
	                       "7523-MM-18.filteredChr.bl.bam",
	                       "7523-MM-19.filteredChr.bl.bam",
	                       "7523-MM-20.filteredChr.bl.bam",
	                       "7523-MM-21.filteredChr.bl.bam",
	                       "7523-MM-22.filteredChr.bl.bam",
	                       "7523-MM-23.filteredChr.bl.bam",
	                       "7523-MM-24.filteredChr.bl.bam",
	                       "7523-MM-25.filteredChr.bl.bam",
	                       
	                       "7523-MM-26.filteredChr.bl.bam",
	                       "7523-MM-27.filteredChr.bl.bam",
	                       "7523-MM-28.filteredChr.bl.bam",
	                       "7523-MM-29.filteredChr.bl.bam",
	                       "7523-MM-30.filteredChr.bl.bam",
	                       "7523-MM-31.filteredChr.bl.bam",
	                       "7523-MM-32.filteredChr.bl.bam",
	                       "7523-MM-33.filteredChr.bl.bam",
	                       "7523-MM-34.filteredChr.bl.bam",
	                       "7523-MM-35.filteredChr.bl.bam",
	                       "7523-MM-36.filteredChr.bl.bam",
	                       "7523-MM-37.filteredChr.bl.bam",
	                       "7523-MM-38.filteredChr.bl.bam",
	                       "7523-MM-39.filteredChr.bl.bam",
	                       "7523-MM-40.filteredChr.bl.bam",
	                       "7523-MM-41.filteredChr.bl.bam",
	                       "7523-MM-42.filteredChr.bl.bam",
	                       "7523-MM-43.filteredChr.bl.bam",
	                       "7523-MM-44.filteredChr.bl.bam",
	                       "7523-MM-45.filteredChr.bl.bam",
	
	                       "7523-MM-46.filteredChr.bl.bam",
	                       "7523-MM-47.filteredChr.bl.bam",
	                       "7523-MM-48.filteredChr.bl.bam",
	                       "7523-MM-49.filteredChr.bl.bam",
	                       "7523-MM-50.filteredChr.bl.bam",
	                       "7523-MM-51.filteredChr.bl.bam",
	                       "7523-MM-52.filteredChr.bl.bam",
	                       "7523-MM-53.filteredChr.bl.bam",
	                       "7523-MM-54.filteredChr.bl.bam",
	                       "7523-MM-55.filteredChr.bl.bam",
	                       "7523-MM-56.filteredChr.bl.bam",
	                       "7523-MM-57.filteredChr.bl.bam",
	                       "7523-MM-58.filteredChr.bl.bam",
	                       "7523-MM-59.filteredChr.bl.bam",
	                       "7523-MM-60.filteredChr.bl.bam",
	                       "7523-MM-61.filteredChr.bl.bam",
	                       "7523-MM-62.filteredChr.bl.bam",
	                       "7523-MM-63.filteredChr.bl.bam",
	                       "7523-MM-64.filteredChr.bl.bam",
	                       "7523-MM-65.filteredChr.bl.bam")
	
	
	
	B1_sample_ID <- c("T0hr_IgG",
	                  "T0hr_K4me3_A",
	                  "T0hr_K4me3_B",
	                  "T0hr_K27me3_A",
	                  "T0hr_K27me3_B",
	                  "T0hr_K27ac_A",
	                  "T0hr_K27ac_B",
	                  "T0.5hr_IgG",
	                  "T0.5hr_K4me3_A",
	                  "T0.5hr_K4me3_B",
	                  "T0.5hr_K27me3_A",
	                  "T0.5hr_K27me3_B",
	                  "T0.5hr_K27ac_A",
	                  "T0.5hr_K27ac_B",
	                  "T4hr_IgG",
	                  "T4hr_K4me3_A",
	                  "T4hr_K4me3_B",
	                  "T4hr_K27me3_A",
	                 # "T4hr_K27me3_B", fail duplicate
	                  "T4hr_K27ac_A",
	                  "T4hr_K27ac_B",
	                  "T24hr_IgG",
	                  "T24hr_K4me3_A",
	                  "T24hr_K4me3_B",
	                  "T24hr_K27me3_A",
	                  "T24hr_K27me3_B",
	                  "T24hr_K27ac_A",
	                  "T24hr_K27ac_B",
	                  "T48hr_IgG",
	                  "T48hr_K4me3_A",
	                  "T48hr_K4me3_B",
	                  "T48hr_K27me3_A",
	                  "T48hr_K27me3_B",
	                  "T48hr_K27ac_A",
	                  "T48hr_K27ac_B")
	
	
	B2_sample_ID <- c("T0hr_K27ac_b2_A",
	                  "T0hr_K27ac_b2_B",
	                  "T0hr_K27me3_b2_A",
	                  "T0hr_K27me3_b2_B",
	                  "T0hr_IgG_b2",
	                  "T4hr_CTL_K27ac_b2_A",
	                  "T4hr_CTL_K27ac_b2_B",
	                  "T4hr_CTL_K27me3_b2_A",
	                  "T4hr_CTL_K27me3_b2_B",
	                  "T4hr_CTL_IgG_b2",
	                  "T4hr_CB839_K27ac_b2_A",
	                  "T4hr_CB839_K27ac_b2_B",
	                  "T4hr_CB839_K27me3_b2_A",
	                  "T4hr_CB839_K27me3_b2_B",
	                  "T4hr_CB839_IgG_b2",
	                  "T4hr_DON_K27ac_b2_A",
	                  "T4hr_DON_K27ac_b2_B",
	                  "T4hr_DON_K27me3_b2_A",
	                  "T4hr_DON_K27me3_b2_B",
	                  "T4hr_DON_IgG_b2",
	                  "T4hr_NoQ_K27ac_b2_A",
	                  "T4hr_NoQ_K27ac_b2_B",
	                  "T4hr_NoQ_K27me3_b2_A",
	                  "T4hr_NoQ_K27me3_b2_B",
	                  "T4hr_NoQ_IgG_b2",
	                  "T24hr_CTL_K27ac_b2_A",
	                  "T24hr_CTL_K27ac_b2_B",
	                  "T24hr_CTL_K27me3_b2_A",
	                  "T24hr_CTL_K27me3_b2_B",
	                  "T24hr_CTL_IgG_b2",
	                  "T24hr_CB839_K27ac_b2_A",
	                  "T24hr_CB839_K27ac_b2_B",
	                  "T24hr_CB839_K27me3_b2_A",
	                  "T24hr_CB839_K27me3_b2_B",
	                  "T24hr_CB839_IgG_b2",
	                  "T24hr_DON_K27ac_b2_A",
	                  "T24hr_DON_K27ac_b2_B",
	                  "T24hr_DON_K27me3_b2_A",
	                  "T24hr_DON_K27me3_b2_B",
	                  "T24hr_DON_IgG_b2",
	                  "T24hr_NoQ_K27ac_b2_A",
	                  "T24hr_NoQ_K27ac_b2_B",
	                  "T24hr_NoQ_K27me3_b2_A",
	                  "T24hr_NoQ_K27me3_b2_B",
	                  "T24hr_NoQ_IgG_b2",
	                  "T48hr_CTL_K27ac_b2_A",
	                  "T48hr_CTL_K27ac_b2_B",
	                  "T48hr_CTL_K27me3_b2_A",
	                  "T48hr_CTL_K27me3_b2_B",
	                  "T48hr_CTL_IgG_b2",
	                  "T48hr_CB839_K27ac_b2_A",
	                  "T48hr_CB839_K27ac_b2_B",
	                  "T48hr_CB839_K27me3_b2_A",
	                  "T48hr_CB839_K27me3_b2_B",
	                  "T48hr_CB839_IgG_b2",
	                  "T48hr_DON_K27ac_b2_A",
	                  "T48hr_DON_K27ac_b2_B",
	                  "T48hr_DON_K27me3_b2_A",
	                  "T48hr_DON_K27me3_b2_B",
	                  "T48hr_DON_IgG_b2",
	                  "T48hr_NoQ_K27ac_b2_A",
	                  "T48hr_NoQ_K27ac_b2_B",
	                  "T48hr_NoQ_K27me3_b2_A",
	                  "T48hr_NoQ_K27me3_b2_B",
	                  "T48hr_NoQ_IgG_b2")
	
	
	
	
	
	
	
	
	
	B1_epi_signalFiles <- paste0(BAM_DIR, "/", B1_cutrunbamFiles)
	B2_epi_signalFiles <- paste0(BAM_DIR, "/", B2_cutrunbamFiles)
	#signalFiles <- paste0(BAM_DIR, "/", signalFiles)
	
	#require(Rsamtools)
	#for (file in c(B1_epi_signalFiles, B2_epi_signalFiles)){
	#  indexBam(file)
	#}
}



library(SummarizedExperiment)
library(profileplyr)
library(dplyr)
#library(rtracklayer)
library(ggplot2)
library(BiocParallel)

T48hr_bam <- c("7523-MM-46.filteredChr.bl.bam",
	            "7523-MM-47.filteredChr.bl.bam",
	            "7523-MM-48.filteredChr.bl.bam",
	            "7523-MM-49.filteredChr.bl.bam",
	            "7523-MM-51.filteredChr.bl.bam",
	            "7523-MM-52.filteredChr.bl.bam",
	            "7523-MM-53.filteredChr.bl.bam",
	            "7523-MM-54.filteredChr.bl.bam",
	            "7523-MM-56.filteredChr.bl.bam",
	            "7523-MM-57.filteredChr.bl.bam",
	            "7523-MM-58.filteredChr.bl.bam",
	            "7523-MM-59.filteredChr.bl.bam",
	            "7523-MM-61.filteredChr.bl.bam",
	            "7523-MM-62.filteredChr.bl.bam",
	            "7523-MM-63.filteredChr.bl.bam",
	            "7523-MM-64.filteredChr.bl.bam")

T48hr_merged_bam <- c("T48hr_CTL_H3K27ac.bam",
						"T48hr_CB839_H3K27ac.bam",
						"T48hr_DON_H3K27ac.bam",
						"T48hr_NoQ_H3K27ac.bam",
						"T48hr_CTL_H3K27me3.bam",
						"T48hr_CB839_H3K27me3.bam",
						"T48hr_DON_H3K27me3.bam",
						"T48hr_NoQ_H3K27me3.bam")

T48hr_merged_ID <- c("T48hr_CTL_H3K27ac",
						"T48hr_CB839_H3K27ac",
						"T48hr_DON_H3K27ac",
						"T48hr_NoQ_H3K27ac",
						"T48hr_CTL_H3K27me3",
						"T48hr_CB839_H3K27me3",
						"T48hr_DON_H3K27me3",
						"T48hr_NoQ_H3K27me3")						


T48hr_ID <- c("T48hr_CTL_K27ac_b2_A",
	          "T48hr_CTL_K27ac_b2_B",
	          "T48hr_CTL_K27me3_b2_A",
	          "T48hr_CTL_K27me3_b2_B",
	          "T48hr_CB839_K27ac_b2_A",
	          "T48hr_CB839_K27ac_b2_B",
	          "T48hr_CB839_K27me3_b2_A",
	          "T48hr_CB839_K27me3_b2_B",
	          "T48hr_DON_K27ac_b2_A",
	          "T48hr_DON_K27ac_b2_B",
	          "T48hr_DON_K27me3_b2_A",
	          "T48hr_DON_K27me3_b2_B",
	          "T48hr_NoQ_K27ac_b2_A",
	          "T48hr_NoQ_K27ac_b2_B",
	          "T48hr_NoQ_K27me3_b2_A",
	          "T48hr_NoQ_K27me3_b2_B")

epi_T48hr_merged_peaks <- "/home/xiang/New_disk1/CD8_CUTRUN/data/T48hr_ac_me3.bed"


epi_T48hr_ac_me3_peaks <- c("/home/xiang/New_disk1/CD8_CUTRUN/data/T48hr_H3K27ac.bed", "/home/xiang/New_disk1/CD8_CUTRUN/data/T48hr_H3K27me3.bed")


proplyrObject_CD8_epi <- generate_proplyrObject_from_bam(bam_files = paste0(BAM_DIR, "/", T48hr_bam),
                                        peaks_bed = epi_T48hr_merged_peaks,
                                        samplesID = T48hr_ID,
                                        outputFile = "CD8_epi_48hr_proplyrObject.rds")

proplyrObject_CD8_merged_epi <- generate_proplyrObject_from_bam(bam_files = paste0(BAM_DATA, "/", T48hr_merged_bam),
                                        peaks_bed = epi_T48hr_merged_peaks,
                                        samplesID = T48hr_merged_ID,
                                        outputFile = "CD8_epi_48hr_merged_proplyrObject.rds")


proplyrObject_CD8_ac_me3 <- generate_proplyrObject_from_bam(bam_files = paste0(BAM_DIR, "/", T48hr_bam),
                                        peaks_bed = epi_T48hr_ac_me3_peaks,
                                        samplesID = T48hr_ID,
                                        outputFile = "CD8_ac_me3_48hr_proplyrObject.rds")

proplyrObject_CD8_ac_me3_merged <- generate_proplyrObject_from_bam(bam_files = paste0(BAM_DATA, "/", T48hr_merged_bam),
                                        peaks_bed = epi_T48hr_ac_me3_peaks,
                                        samplesID = T48hr_merged_ID,
                                        outputFile = "CD8_ac_me3_48hr_merged_proplyrObject.rds")



proplyrObject_CD8_epi <- readRDS("CD8_epi_48hr_proplyrObject.rds")
proplyrObject_CD8_ac_me3 <- readRDS("CD8_ac_me3_48hr_proplyrObject.rds")


proplyrObject_CD8_epi_long <- summarize(proplyrObject_CD8_epi, fun = rowMeans,
                                        output = "long")



proplyrObject_CD8_ac_me3_long <- summarize(proplyrObject_CD8_ac_me3, fun = rowMeans,
                                        output = "long")
proplyrObject_CD8_ac_me3_merged_long <- summarize(proplyrObject_CD8_ac_me3_merged, fun = rowMeans,
                                        output = "long")


saveRDS(proplyrObject_CD8_epi_long, file = "RDS/proplyrObject_CD8_epi_long.rds")
saveRDS(proplyrObject_CD8_ac_me3_long, file = "RDS/proplyrObject_CD8_ac_me3_long.rds")



proplyrObject_CD8_ac_me3_long %>% filter(sgGroup %in% "T48hr_H3K27me3.bed") %>% ggplot(aes(x = Sample, y = log(Signal))) +
  geom_boxplot() + coord_flip()

proplyrObject_CD8_ac_me3_long %>% filter(sgGroup %in% "T48hr_H3K27ac.bed") %>% ggplot(aes(x = Sample, y = log(Signal))) +
  geom_boxplot() + coord_flip()



ggplot(proplyrObject_CD8_epi_long, aes(x = Sample, y = log(Signal))) +
  geom_boxplot() + coord_flip()

set.seed(0)
kmeans <- clusterRanges(proplyrObject_CD8_ac_me3, 
                        fun = rowMeans, 
                        kmeans_k = 3, 
                        silent = FALSE)
export_deepToolsMat(kmeans, con = "CD8_CUTRUN_ac_me3_cluster_mat.gz")

kmeans_merged <- clusterRanges(proplyrObject_CD8_ac_me3_merged, 
                        fun = rowMeans, 
                        kmeans_k = 3, 
                        silent = FALSE)
export_deepToolsMat(kmeans_merged, con = "CD8_CUTRUN_ac_me3_merged_cluster_mat.gz")

kmeans_merged <- clusterRanges(proplyrObject_CD8_merged_epi, 
                        fun = rowMeans, 
                        kmeans_k = 3, 
                        silent = FALSE)
export(kmeans_merged@rowRanges, con = "CD8_epi_clulsters.bed", format = "bed")
export(kmeans_merged@rowRanges[kmeans_merged@rowRanges$cluster == 1], con = "CD8_epi_clulster1.bed", format = "bed")
export(kmeans_merged@rowRanges[kmeans_merged@rowRanges$cluster == 2], con = "CD8_epi_clulster2.bed", format = "bed")
export(kmeans_merged@rowRanges[kmeans_merged@rowRanges$cluster == 3], con = "CD8_epi_clulster3.bed", format = "bed")


export_deepToolsMat(kmeans_merged, con = "CD8_CUTRUN_epi_merged_cluster_mat.gz")


generateEnrichedHeatmap(kmeans_merged)

set.seed(0)
kmeans <- clusterRanges(proplyrObject_CD8_epi,
                        fun = rowMeans,
                        kmeans_k = 4)
export_deepToolsMat(kmeans, con = "CD8_CUTRUN_cluster_mat.gz")
