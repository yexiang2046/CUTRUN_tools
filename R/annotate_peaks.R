#!/usr/bin/env Rscript

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(org.Hs.eg.db)
library(argparse)

# Define argument parser
parser <- argparse::ArgumentParser(description = "Annotate peaks")

# Add arguments
parser$add_argument("--peaks", dest = "peaks_file", required = TRUE, help = "Path to peaks file")
parser$add_argument("--output", dest = "output_file", required = TRUE, help = "Path to output file")

# Parse arguments
args <- parser$parse_args()


# Default values
hg38 <- TxDb.Hsapiens.UCSC.hg38.knownGene

# Annotate peaks
peakAnno <- annotatePeak(args$peaks_file, tssRegion=c(-3000, 3000), TxDb=hg38)
write.table(as.data.frame(peakAnno), file=args$output_file, sep="\t", quote=FALSE, row.names=FALSE)

# plot piechart for annotation in pdf format
pdf(file = paste0(args$output_file, "_piechart.pdf"))
    plotAnnoPie(peakAnno)
dev.off()



