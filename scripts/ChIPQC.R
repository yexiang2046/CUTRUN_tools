




if(FALSE){
  require(ChIPQC)
  BAM_DIR <- "/home/xiang/DNA_seq/CD8_CUTRUN/all_ChIPseq_aligned/"


  BLACKLIST <- "mm10.blacklist.bed"
  BLACKLIST <- paste0("/home/xiang/DNA_seq/CD8_CUTRUN/", BLACKLIST)

  # input
  B1_cutrunbamFiles <- c(#"6781-MM-1.filteredChr.bam", # IgG
    "6781-MM-2.filteredChr.bl.bam",
    "6781-MM-3.filteredChr.bl.bam",
    "6781-MM-4.filteredChr.bl.bam",
    "6781-MM-5.filteredChr.bl.bam",
    "6781-MM-6.filteredChr.bl.bam",
    "6781-MM-7.filteredChr.bl.bam",
    #"6781-MM-8.filteredChr.bam", # IgG
    "6781-MM-9.filteredChr.bl.bam",
    "6781-MM-10.filteredChr.bl.bam",
    "6781-MM-11.filteredChr.bl.bam",
    "6781-MM-12.filteredChr.bl.bam",
    "6781-MM-13.filteredChr.bl.bam",
    "6781-MM-14.filteredChr.bl.bam",
    #"6781-MM-15.filteredChr.bam", #IgG
    "6781-MM-16.filteredChr.bl.bam",
    "6781-MM-17.filteredChr.bl.bam",
    "6781-MM-18.filteredChr.bl.bam",
    # sample 19 failed
    "6781-MM-20.filteredChr.bl.bam",
    "6781-MM-21.filteredChr.bl.bam",
    #"6781-MM-22.filteredChr.bam", # IgG
    "6781-MM-23.filteredChr.bl.bam",
    "6781-MM-24.filteredChr.bl.bam",
    "6781-MM-25.filteredChr.bl.bam",
    "6781-MM-26.filteredChr.bl.bam",
    "6781-MM-27.filteredChr.bl.bam",
    "6781-MM-28.filteredChr.bl.bam",
    #"6781-MM-29.filteredChr.bam", # IgG
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
                         # "7523-MM-05.filteredChr.bam", # IgG
                         "7523-MM-06.filteredChr.bl.bam",
                         "7523-MM-07.filteredChr.bl.bam",
                         "7523-MM-08.filteredChr.bl.bam",
                         "7523-MM-09.filteredChr.bl.bam",
                         #"7523-MM-10.filteredChr.bam",
                         "7523-MM-11.filteredChr.bl.bam",
                         "7523-MM-12.filteredChr.bl.bam",
                         "7523-MM-13.filteredChr.bl.bam",
                         "7523-MM-14.filteredChr.bl.bam",
                         #"7523-MM-15.filteredChr.bam",
                         "7523-MM-16.filteredChr.bl.bam",
                         "7523-MM-17.filteredChr.bl.bam",
                         "7523-MM-18.filteredChr.bl.bam",
                         "7523-MM-19.filteredChr.bl.bam",
                         #"7523-MM-20.filteredChr.bam",
                         "7523-MM-21.filteredChr.bl.bam",
                         "7523-MM-22.filteredChr.bl.bam",
                         "7523-MM-23.filteredChr.bl.bam",
                         "7523-MM-24.filteredChr.bl.bam",
                         #"7523-MM-25.filteredChr.bam",
                         "7523-MM-26.filteredChr.bl.bam",
                         "7523-MM-27.filteredChr.bl.bam",
                         "7523-MM-28.filteredChr.bl.bam",
                         "7523-MM-29.filteredChr.bl.bam",
                         #"7523-MM-30.filteredChr.bam",
                         "7523-MM-31.filteredChr.bl.bam",
                         "7523-MM-32.filteredChr.bl.bam",
                         "7523-MM-33.filteredChr.bl.bam",
                         "7523-MM-34.filteredChr.bl.bam",
                         #"7523-MM-35.filteredChr.bam",
                         "7523-MM-36.filteredChr.bl.bam",
                         "7523-MM-37.filteredChr.bl.bam",
                         "7523-MM-38.filteredChr.bl.bam",
                         "7523-MM-39.filteredChr.bl.bam",
                         #"7523-MM-40.filteredChr.bam",
                         "7523-MM-41.filteredChr.bl.bam",
                         "7523-MM-42.filteredChr.bl.bam",
                         "7523-MM-43.filteredChr.bl.bam",
                         "7523-MM-44.filteredChr.bl.bam",
                         #"7523-MM-45.filteredChr.bam",
                         "7523-MM-46.filteredChr.bl.bam",
                         "7523-MM-47.filteredChr.bl.bam",
                         "7523-MM-48.filteredChr.bl.bam",
                         "7523-MM-49.filteredChr.bl.bam",
                         #"7523-MM-50.filteredChr.bam",
                         "7523-MM-51.filteredChr.bl.bam",
                         "7523-MM-52.filteredChr.bl.bam",
                         "7523-MM-53.filteredChr.bl.bam",
                         "7523-MM-54.filteredChr.bl.bam",
                         #"7523-MM-55.filteredChr.bam",
                         "7523-MM-56.filteredChr.bl.bam",
                         "7523-MM-57.filteredChr.bl.bam",
                         "7523-MM-58.filteredChr.bl.bam",
                         "7523-MM-59.filteredChr.bl.bam",
                         #"7523-MM-60.filteredChr.bam",
                         "7523-MM-61.filteredChr.bl.bam",
                         "7523-MM-62.filteredChr.bl.bam",
                         "7523-MM-63.filteredChr.bl.bam",
                         "7523-MM-64.filteredChr.bl.bam" #,
                         #"7523-MM-65.filteredChr.bam"
  )



  B1_sample_ID <- c(#"T0hr_IgG",
    "T0hr_K4me3_A",
    "T0hr_K4me3_B",
    "T0hr_K27me3_A",
    "T0hr_K27me3_B",
    "T0hr_K27ac_A",
    "T0hr_K27ac_B",
    #"T0.5hr_IgG",
    "T0.5hr_K4me3_A",
    "T0.5hr_K4me3_B",
    "T0.5hr_K27me3_A",
    "T0.5hr_K27me3_B",
    "T0.5hr_K27ac_A",
    "T0.5hr_K27ac_B",
    #"T4hr_IgG",
    "T4hr_K4me3_A",
    "T4hr_K4me3_B",
    "T4hr_K27me3_A",
    # "T4hr_K27me3_B", fail duplicate
    "T4hr_K27ac_A",
    "T4hr_K27ac_B",
    #"T24hr_IgG",
    "T24hr_K4me3_A",
    "T24hr_K4me3_B",
    "T24hr_K27me3_A",
    "T24hr_K27me3_B",
    "T24hr_K27ac_A",
    "T24hr_K27ac_B",
    #"T48hr_IgG",
    "T48hr_K4me3_A",
    "T48hr_K4me3_B",
    "T48hr_K27me3_A",
    "T48hr_K27me3_B",
    "T48hr_K27ac_A",
    "T48hr_K27ac_B")


  B2_sample_ID <- c("T0hr_K27ac_b2A",
                    "T0hr_K27ac_b2B",
                    "T0hr_K27me3_b2A",
                    "T0hr_K27me3_b2B",
                    #"T0hr_IgG",
                    "T4hr_CTL_K27ac_b2A",
                    "T4hr_CTL_K27ac_b2B",
                    "T4hr_CTL_K27me3_b2A",
                    "T4hr_CTL_K27me3_b2B",
                    #"T4hr_CTL_IgG",
                    "T4hr_CB839_K27ac_b2A",
                    "T4hr_CB839_K27ac_b2B",
                    "T4hr_CB839_K27me3_b2A",
                    "T4hr_CB839_K27me3_b2B",
                    #"T4hr_CB839_IgG",
                    "T4hr_DON_K27ac_b2A",
                    "T4hr_DON_K27ac_b2B",
                    "T4hr_DON_K27me3_b2A",
                    "T4hr_DON_K27me3_b2B",
                    #"T4hr_DON_IgG",
                    "T4hr_NoQ_K27ac_b2A",
                    "T4hr_NoQ_K27ac_b2B",
                    "T4hr_NoQ_K27me3_b2A",
                    "T4hr_NoQ_K27me3_b2B",
                    #"T4hr_NoQ_IgG",
                    "T24hr_CTL_K27ac_b2A",
                    "T24hr_CTL_K27ac_b2B",
                    "T24hr_CTL_K27me3_b2A",
                    "T24hr_CTL_K27me3_b2B",
                    #"T24hr_CTL_IgG",
                    "T24hr_CB839_K27ac_b2A",
                    "T24hr_CB839_K27ac_b2B",
                    "T24hr_CB839_K27me3_b2A",
                    "T24hr_CB839_K27me3_b2B",
                    #"T24hr_CB839_IgG",
                    "T24hr_DON_K27ac_b2A",
                    "T24hr_DON_K27ac_b2B",
                    "T24hr_DON_K27me3_b2A",
                    "T24hr_DON_K27me3_b2B",
                    #"T24hr_DON_IgG",
                    "T24hr_NoQ_K27ac_b2A",
                    "T24hr_NoQ_K27ac_b2B",
                    "T24hr_NoQ_K27me3_b2A",
                    "T24hr_NoQ_K27me3_b2B",
                    #"T24hr_NoQ_IgG",
                    "T48hr_CTL_K27ac_b2A",
                    "T48hr_CTL_K27ac_b2B",
                    "T48hr_CTL_K27me3_b2A",
                    "T48hr_CTL_K27me3_b2B",
                    #"T48hr_CTL_IgG",
                    "T48hr_CB839_K27ac_b2A",
                    "T48hr_CB839_K27ac_b2B",
                    "T48hr_CB839_K27me3_b2A",
                    "T48hr_CB839_K27me3_b2B",
                    #"T48hr_CB839_IgG",
                    "T48hr_DON_K27ac_b2A",
                    "T48hr_DON_K27ac_b2B",
                    "T48hr_DON_K27me3_b2A",
                    "T48hr_DON_K27me3_b2B",
                    #"T48hr_DON_IgG",
                    "T48hr_NoQ_K27ac_b2A",
                    "T48hr_NoQ_K27ac_b2B",
                    "T48hr_NoQ_K27me3_b2A",
                    "T48hr_NoQ_K27me3_b2B"#,
                    #"T48hr_NoQ_IgG"
  )









  B1_epi_signalFiles <- paste0(BAM_DIR, "/", B1_cutrunbamFiles)
  B2_epi_signalFiles <- paste0(BAM_DIR, "/", B2_cutrunbamFiles)


  all_epi_signal <- c(B1_epi_signalFiles, B2_epi_signalFiles)
  all_sampleID <- c(B1_sample_ID, B2_sample_ID)


  all_peaks <- c("T0hr_CTL_H3K4me3_A_peaks.broadPeak", "T0hr_CTL_H3K4me3_B_peaks.broadPeak",
                 "T0hr_CTL_H3K27me3_A_peaks.broadPeak", "T0hr_CTL_H3K27me3_B_peaks.broadPeak",
                 "T0hr_CTL_H3K27ac_A_peaks.broadPeak", "T0hr_CTL_H3K27ac_B_peaks.broadPeak",
                 "T0.5hr_CTL_H3K4me3_A_peaks.broadPeak", "T0.5hr_CTL_H3K4me3_B_peaks.broadPeak",
                 "T0.5hr_CTL_H3K27me3_A_peaks.broadPeak", "T0.5hr_CTL_H3K27me3_B_peaks.broadPeak",
                 "T0.5hr_CTL_H3K27ac_A_peaks.broadPeak", "T0.5hr_CTL_H3K27ac_B_peaks.broadPeak",
                 "T4hr_CTL_H3K4me3_A_peaks.broadPeak", "T4hr_CTL_H3K4me3_B_peaks.broadPeak",
                 "T4hr_CTL_H3K27me3_A_peaks.broadPeak",
                 "T4hr_CTL_H3K27ac_A_peaks.broadPeak", "T4hr_CTL_H3K27ac_B_peaks.broadPeak",
                 "T24hr_CTL_H3K4me3_A_peaks.broadPeak", "T24hr_CTL_H3K4me3_B_peaks.broadPeak",
                 "T24hr_CTL_H3K27me3_A_peaks.broadPeak", "T24hr_CTL_H3K27me3_B_peaks.broadPeak",
                 "T24hr_CTL_H3K27ac_A_peaks.broadPeak", "T24hr_CTL_H3K27ac_B_peaks.broadPeak",
                 "T48hr_CTL_H3K4me3_A_peaks.broadPeak", "T48hr_CTL_H3K4me3_B_peaks.broadPeak",
                 "T48hr_CTL_H3K27me3_A_peaks.broadPeak", "T48hr_CTL_H3K27me3_B_peaks.broadPeak",
                 "T48hr_CTL_H3K27ac_A_peaks.broadPeak", "T48hr_CTL_H3K27ac_B_peaks.broadPeak",
                 "T0hr_CTL_b2_H3K27ac_A_peaks.broadPeak", "T0hr_CTL_b2_H3K27ac_B_peaks.broadPeak",
                 "T0hr_CTL_b2_H3K27me3_A_peaks.broadPeak", "T0hr_CTL_b2_H3K27me3_B_peaks.broadPeak",
                 "T4hr_CTL_b2_H3K27ac_A_peaks.broadPeak", "T4hr_CTL_b2_H3K27ac_B_peaks.broadPeak",
                 "T4hr_CTL_b2_H3K27me3_A_peaks.broadPeak", "T4hr_CTL_b2_H3K27me3_B_peaks.broadPeak",
                 "T4hr_CB839_b2_H3K27ac_A_peaks.broadPeak", "T4hr_CB839_b2_H3K27ac_B_peaks.broadPeak",
                 "T4hr_CB839_b2_H3K27me3_A_peaks.broadPeak", "T4hr_CB839_b2_H3K27me3_B_peaks.broadPeak",
                 "T4hr_DON_b2_H3K27ac_A_peaks.broadPeak", "T4hr_DON_b2_H3K27ac_B_peaks.broadPeak",
                 "T4hr_DON_b2_H3K27me3_A_peaks.broadPeak", "T4hr_DON_b2_H3K27me3_B_peaks.broadPeak",
                 "T4hr_NoQ_b2_H3K27ac_A_peaks.broadPeak", "T4hr_NoQ_b2_H3K27ac_B_peaks.broadPeak",
                 "T4hr_NoQ_b2_H3K27me3_A_peaks.broadPeak", "T4hr_NoQ_b2_H3K27me3_B_peaks.broadPeak",
                 "T24hr_CTL_b2_H3K27ac_A_peaks.broadPeak", "T24hr_CTL_b2_H3K27ac_B_peaks.broadPeak",
                 "T24hr_CTL_b2_H3K27me3_A_peaks.broadPeak", "T24hr_CTL_b2_H3K27me3_B_peaks.broadPeak",
                 "T24hr_CB839_b2_H3K27ac_A_peaks.broadPeak", "T24hr_CB839_b2_H3K27ac_B_peaks.broadPeak",
                 "T24hr_CB839_b2_H3K27me3_A_peaks.broadPeak", "T24hr_CB839_b2_H3K27me3_B_peaks.broadPeak",
                 "T24hr_DON_b2_H3K27ac_A_peaks.broadPeak", "T24hr_DON_b2_H3K27ac_B_peaks.broadPeak",
                 "T24hr_DON_b2_H3K27me3_A_peaks.broadPeak", "T24hr_DON_b2_H3K27me3_B_peaks.broadPeak",
                 "T24hr_NoQ_b2_H3K27ac_A_peaks.broadPeak", "T24hr_NoQ_b2_H3K27ac_B_peaks.broadPeak",
                 "T24hr_NoQ_b2_H3K27me3_A_peaks.broadPeak", "T24hr_NoQ_b2_H3K27me3_B_peaks.broadPeak",
                 "T48hr_CTL_b2_H3K27ac_A_peaks.broadPeak", "T48hr_CTL_b2_H3K27ac_B_peaks.broadPeak",
                 "T48hr_CTL_b2_H3K27me3_A_peaks.broadPeak", "T48hr_CTL_b2_H3K27me3_B_peaks.broadPeak",
                 "T48hr_CB839_b2_H3K27ac_A_peaks.broadPeak", "T48hr_CB839_b2_H3K27ac_B_peaks.broadPeak",
                 "T48hr_CB839_b2_H3K27me3_A_peaks.broadPeak", "T48hr_CB839_b2_H3K27me3_B_peaks.broadPeak",
                 "T48hr_DON_b2_H3K27ac_A_peaks.broadPeak", "T48hr_DON_b2_H3K27ac_B_peaks.broadPeak",
                 "T48hr_DON_b2_H3K27me3_A_peaks.broadPeak", "T48hr_DON_b2_H3K27me3_B_peaks.broadPeak",
                 "T48hr_NoQ_b2_H3K27ac_A_peaks.broadPeak", "T48hr_NoQ_b2_H3K27ac_B_peaks.broadPeak",
                 "T48hr_NoQ_b2_H3K27me3_A_peaks.broadPeak", "T48hr_NoQ_b2_H3K27me3_B_peaks.broadPeak")




  all_peaks <- paste0(BAM_DIR, all_peaks)

  CD8_CUTRUN_exp <- data.frame(SampleID = all_sampleID,
                               bamReads = all_epi_signal,
                               PeakCaller ="narrow",
                               bamControl = paste0(BAM_DIR, c("6781-MM-1.filteredChr.bl.bam",
                                                              "6781-MM-1.filteredChr.bl.bam",
                                                              "6781-MM-1.filteredChr.bl.bam",
                                                              "6781-MM-1.filteredChr.bl.bam",
                                                              "6781-MM-1.filteredChr.bl.bam",
                                                              "6781-MM-1.filteredChr.bl.bam",
                                                              "6781-MM-8.filteredChr.bl.bam",
                                                              "6781-MM-8.filteredChr.bl.bam",
                                                              "6781-MM-8.filteredChr.bl.bam",
                                                              "6781-MM-8.filteredChr.bl.bam",
                                                              "6781-MM-8.filteredChr.bl.bam",
                                                              "6781-MM-8.filteredChr.bl.bam",
                                                              "6781-MM-15.filteredChr.bl.bam",
                                                              "6781-MM-15.filteredChr.bl.bam",
                                                              "6781-MM-15.filteredChr.bl.bam",
                                                              "6781-MM-15.filteredChr.bl.bam",
                                                              "6781-MM-15.filteredChr.bl.bam",
                                                              "6781-MM-22.filteredChr.bl.bam",
                                                              "6781-MM-22.filteredChr.bl.bam",
                                                              "6781-MM-22.filteredChr.bl.bam",
                                                              "6781-MM-22.filteredChr.bl.bam",
                                                              "6781-MM-22.filteredChr.bl.bam",
                                                              "6781-MM-22.filteredChr.bl.bam",
                                                              "6781-MM-29.filteredChr.bl.bam",
                                                              "6781-MM-29.filteredChr.bl.bam",
                                                              "6781-MM-29.filteredChr.bl.bam",
                                                              "6781-MM-29.filteredChr.bl.bam",
                                                              "6781-MM-29.filteredChr.bl.bam",
                                                              "6781-MM-29.filteredChr.bl.bam",
                                                              "7523-MM-05.filteredChr.bl.bam",
                                                              "7523-MM-05.filteredChr.bl.bam",
                                                              "7523-MM-05.filteredChr.bl.bam",
                                                              "7523-MM-05.filteredChr.bl.bam",
                                                              "7523-MM-10.filteredChr.bl.bam",
                                                              "7523-MM-10.filteredChr.bl.bam",
                                                              "7523-MM-10.filteredChr.bl.bam",
                                                              "7523-MM-10.filteredChr.bl.bam",
                                                              "7523-MM-15.filteredChr.bl.bam",
                                                              "7523-MM-15.filteredChr.bl.bam",
                                                              "7523-MM-15.filteredChr.bl.bam",
                                                              "7523-MM-15.filteredChr.bl.bam",
                                                              "7523-MM-20.filteredChr.bl.bam",
                                                              "7523-MM-20.filteredChr.bl.bam",
                                                              "7523-MM-20.filteredChr.bl.bam",
                                                              "7523-MM-20.filteredChr.bl.bam",
                                                              "7523-MM-25.filteredChr.bl.bam",
                                                              "7523-MM-25.filteredChr.bl.bam",
                                                              "7523-MM-25.filteredChr.bl.bam",
                                                              "7523-MM-25.filteredChr.bl.bam",
                                                              "7523-MM-30.filteredChr.bl.bam",
                                                              "7523-MM-30.filteredChr.bl.bam",
                                                              "7523-MM-30.filteredChr.bl.bam",
                                                              "7523-MM-30.filteredChr.bl.bam",
                                                              "7523-MM-35.filteredChr.bl.bam",
                                                              "7523-MM-35.filteredChr.bl.bam",
                                                              "7523-MM-35.filteredChr.bl.bam",
                                                              "7523-MM-35.filteredChr.bl.bam",
                                                              "7523-MM-40.filteredChr.bl.bam",
                                                              "7523-MM-40.filteredChr.bl.bam",
                                                              "7523-MM-40.filteredChr.bl.bam",
                                                              "7523-MM-40.filteredChr.bl.bam",
                                                              "7523-MM-45.filteredChr.bl.bam",
                                                              "7523-MM-45.filteredChr.bl.bam",
                                                              "7523-MM-45.filteredChr.bl.bam",
                                                              "7523-MM-45.filteredChr.bl.bam",
                                                              "7523-MM-50.filteredChr.bl.bam",
                                                              "7523-MM-50.filteredChr.bl.bam",
                                                              "7523-MM-50.filteredChr.bl.bam",
                                                              "7523-MM-50.filteredChr.bl.bam",
                                                              "7523-MM-55.filteredChr.bl.bam",
                                                              "7523-MM-55.filteredChr.bl.bam",
                                                              "7523-MM-55.filteredChr.bl.bam",
                                                              "7523-MM-55.filteredChr.bl.bam",
                                                              "7523-MM-60.filteredChr.bl.bam",
                                                              "7523-MM-60.filteredChr.bl.bam",
                                                              "7523-MM-60.filteredChr.bl.bam",
                                                              "7523-MM-60.filteredChr.bl.bam",
                                                              "7523-MM-65.filteredChr.bl.bam",
                                                              "7523-MM-65.filteredChr.bl.bam",
                                                              "7523-MM-65.filteredChr.bl.bam",
                                                              "7523-MM-65.filteredChr.bl.bam")),
                               ControlID = c("T0hr_IgG_b1",
                                             "T0hr_IgG_b1",
                                             "T0hr_IgG_b1",
                                             "T0hr_IgG_b1",
                                             "T0hr_IgG_b1",
                                             "T0hr_IgG_b1",
                                             "T0.5hr_IgG_b1",
                                             "T0.5hr_IgG_b1",
                                             "T0.5hr_IgG_b1",
                                             "T0.5hr_IgG_b1",
                                             "T0.5hr_IgG_b1",
                                             "T0.5hr_IgG_b1",
                                             "T4hr_IgG_b1",
                                             "T4hr_IgG_b1",
                                             "T4hr_IgG_b1",
                                             "T4hr_IgG_b1",
                                             "T4hr_IgG_b1",
                                             "T24hr_IgG_b1",
                                             "T24hr_IgG_b1",
                                             "T24hr_IgG_b1",
                                             "T24hr_IgG_b1",
                                             "T24hr_IgG_b1",
                                             "T24hr_IgG_b1",
                                             "T48hr_IgG_b1",
                                             "T48hr_IgG_b1",
                                             "T48hr_IgG_b1",
                                             "T48hr_IgG_b1",
                                             "T48hr_IgG_b1",
                                             "T48hr_IgG_b1",
                                             "T0hr_CTL_IgG_b2",
                                             "T0hr_CTL_IgG_b2",
                                             "T0hr_CTL_IgG_b2",
                                             "T0hr_CTL_IgG_b2",
                                             "T4hr_CTL_IgG_b2",
                                             "T4hr_CTL_IgG_b2",
                                             "T4hr_CTL_IgG_b2",
                                             "T4hr_CTL_IgG_b2",
                                             "T4hr_CB839_IgG_b2",
                                             "T4hr_CB839_IgG_b2",
                                             "T4hr_CB839_IgG_b2",
                                             "T4hr_CB839_IgG_b2",
                                             "T4hr_DON_IgG_b2",
                                             "T4hr_DON_IgG_b2",
                                             "T4hr_DON_IgG_b2",
                                             "T4hr_DON_IgG_b2",
                                             "T4hr_NoQ_IgG_b2",
                                             "T4hr_NoQ_IgG_b2",
                                             "T4hr_NoQ_IgG_b2",
                                             "T4hr_NoQ_IgG_b2",
                                             "T24hr_CTL_IgG_b2",
                                             "T24hr_CTL_IgG_b2",
                                             "T24hr_CTL_IgG_b2",
                                             "T24hr_CTL_IgG_b2",
                                             "T24hr_CB839_IgG_b2",
                                             "T24hr_CB839_IgG_b2",
                                             "T24hr_CB839_IgG_b2",
                                             "T24hr_CB839_IgG_b2",
                                             "T24hr_DON_IgG_b2",
                                             "T24hr_DON_IgG_b2",
                                             "T24hr_DON_IgG_b2",
                                             "T24hr_DON_IgG_b2",
                                             "T24hr_NoQ_IgG_b2",
                                             "T24hr_NoQ_IgG_b2",
                                             "T24hr_NoQ_IgG_b2",
                                             "T24hr_NoQ_IgG_b2",
                                             "T48hr_CTL_IgG_b2",
                                             "T48hr_CTL_IgG_b2",
                                             "T48hr_CTL_IgG_b2",
                                             "T48hr_CTL_IgG_b2",
                                             "T48hr_CB839_IgG_b2",
                                             "T48hr_CB839_IgG_b2",
                                             "T48hr_CB839_IgG_b2",
                                             "T48hr_CB839_IgG_b2",
                                             "T48hr_DON_IgG_b2",
                                             "T48hr_DON_IgG_b2",
                                             "T48hr_DON_IgG_b2",
                                             "T48hr_DON_IgG_b2",
                                             "T48hr_NoQ_IgG_b2",
                                             "T48hr_NoQ_IgG_b2",
                                             "T48hr_NoQ_IgG_b2",
                                             "T48hr_NoQ_IgG_b2"),
                               Condition = c(rep(c(0, 0.5), each = 6),
                                             rep(4, 5),
                                             rep(24, 6),
                                             rep(48, 6),
                                             rep(0, 4),
                                             rep(4, 16),
                                             rep(24, 16),
                                             rep(48, 16)),
                               Treatment = c(rep("CTL", 29),
                                             rep("CTL", 8),
                                             rep("CB839", 4),
                                             rep("DON", 4),
                                             rep("NoQ", 4),
                                             rep("CTL", 4),
                                             rep("CB839", 4),
                                             rep("DON", 4),
                                             rep("NoQ", 4),
                                             rep("CTL", 4),
                                             rep("CB839", 4),
                                             rep("DON", 4),
                                             rep("NoQ", 4)),
                               Factor = c("H3K4me3", "H3K4me3", "H3K27me3", "H3K27me3", "H3K27ac", "H3K27ac",
                                          "H3K4me3", "H3K4me3", "H3K27me3", "H3K27me3", "H3K27ac", "H3K27ac",
                                          "H3K4me3", "H3K4me3", "H3K27me3", "H3K27ac", "H3K27ac",
                                          "H3K4me3", "H3K4me3", "H3K27me3", "H3K27me3", "H3K27ac", "H3K27ac",
                                          "H3K4me3", "H3K4me3", "H3K27me3", "H3K27me3", "H3K27ac", "H3K27ac",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3",
                                          "H3K27ac", "H3K27ac", "H3K27me3", "H3K27me3"),
                               replicates = c(1,2, 1,2, 1,2,
                                              1,2, 1,2, 1,2,
                                              1,2, 1,   1,2,
                                              1,2, 1,2, 1,2,
                                              1,2, 1,2, 1,2,
                                              3,4, 3,4,
                                              3,4, 3,4,
                                              1,2, 1,2,
                                              1,2, 1,2,
                                              1,2, 1,2,
                                              3,4, 3,4,
                                              1,2, 1,2,
                                              1,2, 1,2,
                                              1,2, 1,2,
                                              3,4, 3,4,
                                              1,2, 1,2,
                                              1,2, 1,2,
                                              1,2, 1,2),
                               Peaks = all_peaks)

  write.csv(CD8_CUTRUN_exp, file = "CD8_CUTRUN_exp.csv", row.names = FALSE)


  # run on server
  samples <- read.csv("CD8_CUTRUN_exp.csv")
  samplesQC <- ChIPQC(samples, consensus = TRUE, bCount = TRUE, summits = 250,
                      annotation = "mm10", blacklist = BLACKLIST)

  saveRDS(samplesQC, file = "CD8_CUTRUN_samplesQC.rds")

  #samplesQC <- readRDS(file = "CD8_CUTRUN_samplesQC.rds")
  #ChIPQCreport(samplesQC)

}


# all samples ---------
if(FALSE){
  library(DiffBind)
  samples <- read.csv(file = "CD8_CUTRUN_exp.csv")
  CD8_CUTRUN <- dba(sampleSheet = samples)
  CD8_CUTRUN <- dba.count(DBA = CD8_CUTRUN, bParallel = TRUE)
  CD8_CUTRUN <- dba.normalize(DBA = CD8_CUTRUN)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN <- dba.contrast(CD8_CUTRUN,
                             design = "~Condition + Factor + Treatment")

  CD8_CUTRUN <- dba.analyze(CD8_CUTRUN)
  saveRDS(CD8_CUTRUN, file = "CD8_CUTRUN_diff.rds")
}
CD8_CUTRUN <- readRDS(file = "CD8_CUTRUN_diff.rds")


if(FALSE){
  CTL_24_48hr <- c( "T24hr_CTL_K27ac_A",
                    "T24hr_CTL_K27ac_B",
                    "T24hr_CTL_K27me3_A",
                    "T24hr_CTL_K27me3_B",
                    "T48hr_CTL_K27ac_A",
                    "T48hr_CTL_K27ac_B",
                    "T48hr_CTL_K27me3_A",
                    "T48hr_CTL_K27me3_B")


  samples <- read.csv("CD8_CUTRUN_exp.csv")
  samples_se <- samples[samples$SampleID %in% CTL_24_48hr,]
}
library(DiffBind)
CD8_CUTRUN <- readRDS(file = "CD8_CUTRUN_diffbind.rds")
CD8_CUTRUN <- dba.normalize(CD8_CUTRUN, method = DBA_EDGER, normalize = DBA_NORM_LIB)

# for batch2 -------------------
if(FALSE){
samples_b2 <- samples[30:81,]
CD8_CUTRUN_b2 <- dba(sampleSheet = samples_b2)
CD8_CUTRUN_b2 <- dba.count(DBA = CD8_CUTRUN_b2, bParallel = TRUE)
CD8_CUTRUN_b2 <- dba.normalize(DBA = CD8_CUTRUN_b2)
norm_b2 <- dba.normalize(CD8_CUTRUN_b2, bRetrieve = TRUE)

CD8_CUTRUN_b2 <- dba.contrast(CD8_CUTRUN_b2,
                              design = "~Condition + Factor + Treatment")


CD8_CUTRUN_b2 <- dba.analyze(CD8_CUTRUN_b2)
}

CD8_CUTRUN_b2 <- readRDS(file = "CD8_CUTRUN_b2.rds")

CD8_CUTRUN_b2.DB <- dba.report(CD8_CUTRUN_b2)


# for batch2 24h and 48h -----------------

if(FALSE){
  samples_b2_24h_48h <- samples[50:81,]
  CD8_CUTRUN_b2_late <- dba(sampleSheet = samples_b2_24h_48h)
  CD8_CUTRUN_b2_late <- dba.count(DBA = CD8_CUTRUN_b2_late, bParallel = TRUE)
  CD8_CUTRUN_b2_late <- dba.normalize(DBA = CD8_CUTRUN_b2_late)
  norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late, bRetrieve = TRUE)

  CD8_CUTRUN_b2_late <- dba.contrast(CD8_CUTRUN_b2_late,
                                     design = "~Condition + Factor + Treatment")


  CD8_CUTRUN_b2_late <- dba.analyze(CD8_CUTRUN_b2_late)
  saveRDS(CD8_CUTRUN_b2_late, file = "CD8_CUTRUN_diff_b2_late.rds")
}

CD8_CUTRUN_b2_late <- readRDS(file = "CD8_CUTRUN_diff_b2_late.rds")

CD8_CUTRUN_b2_late.DB <- dba.report(CD8_CUTRUN_b2_late)


# CTL ac 24h and 48h----
if(FALSE){

  samples_b2_24h_48h_ac <- samples[50:81,]
  idx_ac <- grep("K27ac", samples_b2_24h_48h_ac$SampleID)
  idx_CTL <- grep("CTL", samples_b2_24h_48h_ac$SampleID)
  samples_b2_24h_48h_ac_CTL <- samples_b2_24h_48h_ac[idx_ac[idx_ac %in% idx_CTL],]
  CD8_CUTRUN_b2_late_ac_CTL <- dba(sampleSheet = samples_b2_24h_48h_ac_CTL)
  CD8_CUTRUN_b2_late_ac_CTL <- dba.count(DBA = CD8_CUTRUN_b2_late_ac_CTL, bParallel = TRUE)
  CD8_CUTRUN_b2_late_ac_CTL <- dba.normalize(DBA = CD8_CUTRUN_b2_late_ac_CTL)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_b2_late_ac_CTL <- dba.contrast(CD8_CUTRUN_b2_late_ac_CTL,
                                     design = "~Condition")


  CD8_CUTRUN_b2_late_ac_CTL <- dba.analyze(CD8_CUTRUN_b2_late_ac_CTL)
  saveRDS(CD8_CUTRUN_b2_late_ac_CTL, file = "CD8_CUTRUN_diff_b2_late_ac_CTL.rds")
}
CD8_CUTRUN_b2_late_ac_CTL <- readRDS(file = "CD8_CUTRUN_diff_b2_late_ac_CTL.rds")

CD8_CUTRUN_b2_late_ac_CTL.DB <- dba.report(CD8_CUTRUN_b2_late_ac_CTL)


# CTL 24h and 48h----
if(FALSE){
  samples <- read.csv("CD8_CUTRUN_exp.csv")
  samples_b2_24h_48h <- samples[50:81,]
  idx_CTL <- grep("CTL", samples_b2_24h_48h$SampleID)
  samples_b1_24h_48h <- samples[c(20, 22, 23, 26, 27, 28, 29),]
  samples_b2_24h_48h_CTL <- samples_b2_24h_48h[idx_CTL,]
  samples_24h_48h_CTL <- rbind(samples_b1_24h_48h, samples_b2_24h_48h_CTL)
  CD8_CUTRUN_late_CTL <- dba(sampleSheet = samples_24h_48h_CTL)
  CD8_CUTRUN_late_CTL <- dba.count(DBA = CD8_CUTRUN_late_CTL, bParallel = TRUE)
  CD8_CUTRUN_late_CTL <- dba.normalize(DBA = CD8_CUTRUN_late_CTL)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_late_CTL <- dba.contrast(CD8_CUTRUN_late_CTL,
                                            design = "~Condition + Factor")


  CD8_CUTRUN_late_CTL <- dba.analyze(CD8_CUTRUN_late_CTL)
  saveRDS(CD8_CUTRUN_late_CTL, file = "CD8_CUTRUN_diff_late_CTL.rds")
}
CD8_CUTRUN_late_CTL <- readRDS(file = "CD8_CUTRUN_diff_late_CTL.rds")

CD8_CUTRUN_late_CTL.DB <- dba.report(CD8_CUTRUN_late_CTL)


# CTL ac 24h and 48h----
if(FALSE){
  samples <- read.csv("CD8_CUTRUN_exp.csv")
  samples_b2_24h_48h <- samples[50:81,]
  idx_CTL <- grep("CTL", samples_b2_24h_48h$SampleID)
  idx_ac <- grep("K27ac", samples_b2_24h_48h$SampleID)
  samples_b1_24h_48h <- samples[c(22, 23, 28, 29),]
  samples_b2_24h_48h_ac_CTL <- samples_b2_24h_48h[idx_CTL[idx_CTL %in% idx_ac],]
  samples_24h_48h_ac_CTL <- rbind(samples_b1_24h_48h, samples_b2_24h_48h_ac_CTL)
  CD8_CUTRUN_late_ac_CTL <- dba(sampleSheet = samples_24h_48h_ac_CTL)
  CD8_CUTRUN_late_ac_CTL <- dba.count(DBA = CD8_CUTRUN_late_ac_CTL, bParallel = TRUE)
  CD8_CUTRUN_late_ac_CTL <- dba.normalize(DBA = CD8_CUTRUN_late_ac_CTL)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_late_ac_CTL <- dba.contrast(CD8_CUTRUN_late_ac_CTL,
                                      design = "~Condition")


  CD8_CUTRUN_late_ac_CTL <- dba.analyze(CD8_CUTRUN_late_ac_CTL)
  saveRDS(CD8_CUTRUN_late_ac_CTL, file = "CD8_CUTRUN_diff_late_ac_CTL.rds")
}
CD8_CUTRUN_late_ac_CTL <- readRDS(file = "CD8_CUTRUN_diff_late_ac_CTL.rds")

CD8_CUTRUN_late_ac_CTL.DB <- dba.report(CD8_CUTRUN_late_ac_CTL)

ac_profile <- readRDS(file = "ac_profile.rds")



  # CTL K27me3 24h----
  if(FALSE){
    samples <- read.csv("CD8_CUTRUN_exp.csv")
    samples_b2_24h_48h <- samples[50:81,]
    idx_CTL <- grep("CTL", samples_b2_24h_48h$SampleID)
    idx_me3 <- grep("K27me3", samples_b2_24h_48h$SampleID)
    samples_b1_24h_48h <- samples[c(20, 26, 27),]
    samples_b2_24h_48h_me3_CTL <- samples_b2_24h_48h[idx_CTL[idx_CTL %in% idx_me3],]
    samples_24h_48h_me3_CTL <- rbind(samples_b1_24h_48h, samples_b2_24h_48h_me3_CTL)
    CD8_CUTRUN_late_me3_CTL <- dba(sampleSheet = samples_24h_48h_me3_CTL)
    CD8_CUTRUN_late_me3_CTL <- dba.count(DBA = CD8_CUTRUN_late_me3_CTL, bParallel = TRUE)
    CD8_CUTRUN_late_me3_CTL <- dba.normalize(DBA = CD8_CUTRUN_late_me3_CTL)
    #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

    CD8_CUTRUN_late_me3_CTL <- dba.contrast(CD8_CUTRUN_late_me3_CTL,
                                            design = "~Condition")


  CD8_CUTRUN_late_me3_CTL <- dba.analyze(CD8_CUTRUN_late_me3_CTL)
  saveRDS(CD8_CUTRUN_late_me3_CTL, file = "CD8_CUTRUN_diff_late_me3_CTL.rds")
}
CD8_CUTRUN_late_me3_CTL <- readRDS(file = "CD8_CUTRUN_diff_late_me3_CTL.rds")

CD8_CUTRUN_late_me3_CTL.DB <- dba.report(CD8_CUTRUN_late_me3_CTL)

me3_profile <- readRDS(file = "me3_profile.rds")

# 24h
if(FALSE){
  sample_meta <- read.csv("CD8_CUTRUN_exp.csv")
  samples_b2_24h <- sample_meta[50:65,]
  samples_b1_24h <- sample_meta[18:23,]
  samples_24h <- rbind(samples_b1_24h, samples_b2_24h)
  CD8_CUTRUN_24h <- dba(sampleSheet = samples_24h)
  CD8_CUTRUN_24h <- dba.count(DBA = CD8_CUTRUN_24h, bParallel = TRUE)
  CD8_CUTRUN_24h <- dba.normalize(DBA = CD8_CUTRUN_24h)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_24h <- dba.contrast(CD8_CUTRUN_24h,
                                      design = "~Treatment + Factor")


  CD8_CUTRUN_24h <- dba.analyze(CD8_CUTRUN_24h)
  saveRDS(CD8_CUTRUN_24h, file = "CD8_CUTRUN_24h.rds")
}
CD8_CUTRUN_24h <- readRDS(file = "CD8_CUTRUN_24h.rds")




# 24h ac -----------------------
if(FALSE){
  sample_meta <- read.csv("CD8_CUTRUN_exp.csv")
  samples_b2_24h <- sample_meta[50:65,]
  samples_b1_24h <- sample_meta[18:23,]
  idx1_ac <- grep("K27ac", samples_b1_24h$SampleID)
  idx2_ac <- grep("K27ac", samples_b2_24h$SampleID)
  samples_24h_ac <- rbind(samples_b1_24h[idx1_ac, ], samples_b2_24h[idx2_ac, ])
  CD8_CUTRUN_24h_ac <- dba(sampleSheet = samples_24h_ac)
  CD8_CUTRUN_24h_ac <- dba.count(DBA = CD8_CUTRUN_24h_ac, bParallel = TRUE)
  CD8_CUTRUN_24h_ac <- dba.normalize(DBA = CD8_CUTRUN_24h_ac)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_24h_ac <- dba.contrast(CD8_CUTRUN_24h_ac,
                                 design = "~Treatment")


  CD8_CUTRUN_24h_ac <- dba.analyze(CD8_CUTRUN_24h_ac)
  saveRDS(CD8_CUTRUN_24h_ac, file = "CD8_CUTRUN_24h_ac.rds")
}
CD8_CUTRUN_24h_ac <- readRDS(file = "CD8_CUTRUN_24h_ac.rds")


# 24h me3 -----------------------
if(FALSE){
  sample_meta <- read.csv("CD8_CUTRUN_exp.csv")
  samples_b2_24h <- sample_meta[50:65,]
  samples_b1_24h <- sample_meta[18:23,]
  idx1_me3 <- grep("K27me3", samples_b1_24h$SampleID)
  idx2_me3 <- grep("K27me3", samples_b2_24h$SampleID)
  samples_24h_me3 <- rbind(samples_b1_24h[idx1_me3, ], samples_b2_24h[idx2_me3, ])
  CD8_CUTRUN_24h_me3 <- dba(sampleSheet = samples_24h_me3)
  CD8_CUTRUN_24h_me3 <- dba.count(DBA = CD8_CUTRUN_24h_me3, bParallel = TRUE)
  CD8_CUTRUN_24h_me3 <- dba.normalize(DBA = CD8_CUTRUN_24h_me3)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_24h_me3 <- dba.contrast(CD8_CUTRUN_24h_me3,
                                    design = "~Treatment")


  CD8_CUTRUN_24h_ac <- dba.analyze(CD8_CUTRUN_24h_ac)
  saveRDS(CD8_CUTRUN_24h_ac, file = "CD8_CUTRUN_24h_ac.rds")
}
CD8_CUTRUN_24h_ac <- readRDS(file = "CD8_CUTRUN_24h_ac.rds")



# 48hh
if(FALSE){
  sample_meta <- read.csv("CD8_CUTRUN_exp.csv")
  samples_b2_48h <- sample_meta[66:81,]
  samples_b1_48h <- sample_meta[24:29,]
  samples_48h <- rbind(samples_b1_48h, samples_b2_48h)
  CD8_CUTRUN_48h <- dba(sampleSheet = samples_48h)
  CD8_CUTRUN_48h <- dba.count(DBA = CD8_CUTRUN_48h, bParallel = TRUE)
  CD8_CUTRUN_48h <- dba.normalize(DBA = CD8_CUTRUN_48hh)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_48h <- dba.contrast(CD8_CUTRUN_48h,
                                 design = "~Treatment + Factor")


  CD8_CUTRUN_48h <- dba.analyze(CD8_CUTRUN_48h)
  saveRDS(CD8_CUTRUN_48h, file = "CD8_CUTRUN_48h.rds")
}
CD8_CUTRUN_48h <- readRDS(file = "CD8_CUTRUN_48h.rds")


# 48hh me3
if(FALSE){
  sample_meta <- read.csv("CD8_CUTRUN_exp.csv")
  samples_b2_48h <- sample_meta[66:81,]
#  samples_b1_48h <- sample_meta[24:29,]
  samples_48h_me3 <- samples_b2_48h[c(3,4, 7,8, 11,12, 15,16),]
  CD8_CUTRUN_48h_me3 <- dba(sampleSheet = samples_48h_me3)
  CD8_CUTRUN_48h_me3 <- dba.count(DBA = CD8_CUTRUN_48h_me3, bParallel = TRUE)
  CD8_CUTRUN_48h_me3 <- dba.normalize(DBA = CD8_CUTRUN_48hh_me3)
  #norm_b2_late <- dba.normalize(CD8_CUTRUN_b2_late_ac, bRetrieve = TRUE)

  CD8_CUTRUN_48h_me3 <- dba.contrast(CD8_CUTRUN_48h_me3,
                                 design = "~Treatment", minMembers = 2)


  CD8_CUTRUN_48h_me3 <- dba.analyze(CD8_CUTRUN_48h_me3)
  saveRDS(CD8_CUTRUN_48h_me3, file = "CD8_CUTRUN_48h_me3.rds")
}
CD8_CUTRUN_48h_me3 <- readRDS(file = "CD8_CUTRUN_48h_me3.rds")
