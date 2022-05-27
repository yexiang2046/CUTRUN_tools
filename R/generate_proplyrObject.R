#' generate proplyrObject from bam files
#' @param bam_files bam files and bigwig list with directory
#' @param peaks_bed bed files for the ranges used for plot
#' @param format  bam and bigwig
#' @param samplesID ID for samples
#' @return proplyrObject (Default as "proplyrObject.rds")




generate_proplyrObject <- function(bam_files = bam_signal_file,
                                   bw_files = bw_files,
                                   peaks_bed = LANA_peaks,
                                   samplesID = c("H3K27ac",
                                               "H3K4me1",
                                               "H3K4me3"),
                                   outputFile = "proplyrObject.rds"){
  require(profileplyr)
  require(SummarizedExperiment)
  require(ggplot2)

  bam_nu <- length(bam_files)
  bw_nu <- length(bw_files)
  cutrunProfile <- BamBigwig_to_chipProfile(bam_files,
                                            peaks_bed,
                                            format = "bam",
                                            paired=TRUE,
                                            style="percentOfRegion",
                                            nOfWindows=20,
                                            distanceAround=2000
  )
  bwProfile <- BamBigwig_to_chipProfile(bw_files,
                                        peaks_bed,
                                        format = "bigwig",
                                        paired=TRUE,
                                        style="percentOfRegion",
                                        nOfWindows=20,
                                        distanceAround=2000
  )

  cProfile <- c(cutrunProfile[[1]], cutrunProfile[[2]], cutrunProfile[[3]],
                cutrunProfile[[4]], cutrunProfile[[5]], cutrunProfile[[6]],
                bwProfile[[1]])
  proplyrObject <- as_profileplyr(cProfile)
  rownames(sampleData(proplyrObject)) <- samplesID
  saveRDS(proplyrObject, file = outputFile)
  return(proplyrObject)
}



#' generate proplyrObject from bam files
#' @param bam_files bam files list with directory
#' @param peaks_bed bed files for the ranges used for plot
#' @param format  bam
#' @param samplesID ID for samples
#' @return proplyrObject (Default as "proplyrObject.rds")


generate_proplyrObject_from_bam <- function(bam_files = bam_signal_file,
				   paired_end = TRUE,
                                   peaks_bed = peaks.bed,
                                   samplesID = c("H3K27ac",
                                               "H3K4me1",
                                               "H3K4me3"),
                                   outputFile = "proplyrObject.rds"){
  #require(profileplyr)
  #require(SummarizedExperiment)
  #require(ggplot2)

  bam_nu <- length(bam_files)
  cutrunProfile <- BamBigwig_to_chipProfile(bam_files,
                                            peaks_bed,
                                            format = "bam",
                                            paired= paired_end,
                                            style="percentOfRegion",
                                            nOfWindows=20,
                                            distanceAround=2000,
                                            quant_params=MulticoreParam(workers=12)
  )
  proplyrObject <- as_profileplyr(cutrunProfile)
  rownames(sampleData(proplyrObject)) <- samplesID
  saveRDS(proplyrObject, file = outputFile)
  return(proplyrObject)
}


