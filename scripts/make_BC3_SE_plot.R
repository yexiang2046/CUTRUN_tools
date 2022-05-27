
## this script make ROSE style plot of super-enhancers with the output from using command homer findPeaks
## findPeaks BC3_H3K27ac_tag -i BC3_IgG_tag -style superhistone -inputPeaks BC3_H3K27ac.idr.02.bl.bed -o BC3_SE.txt -superSlope -1000


library(dplyr)
library(ggplot2)

## make plot for BC3
BC3_SE_all <- read.delim2(file = "~/New_disk1/BC3_public_data/BC3_SE_for_plot.txt", sep = "\t", skip = 42)

BC3_SE_all$Normalized.Tag.Count <- as.numeric(BC3_SE_all$Normalized.Tag.Count)

scores <- BC3_SE_all$Normalized.Tag.Count[order(BC3_SE_all$Normalized.Tag.Count, decreasing = FALSE)]
rank <- 1:length(scores)


pdf(file = "BC3_SE_ROSE_plot.pdf", width = 5, height = 5)
par(mar = c(5, 5, 5, 5))
plot(x = rank, y = scores, type = "p", pch = 19, col = "red", cex = 0.8, main = "BC3 ROSE plot", xlab = "Enhancers ranked by H3K27ac intensity", ylab = "H3K27ac enrichment", cex.lab = 1.5, cex.axis = 1.2)
dev.off()


## make plot for TRX-BCBL1-RTA
TB_SE_all <- read.delim2(file = "~/HiC/cutrunAna/TB_SE_for_plot.txt", sep = "\t", skip = 42)

TB_SE_all$Normalized.Tag.Count <- as.numeric(TB_SE_all$Normalized.Tag.Count)

scores <- TB_SE_all$Normalized.Tag.Count[order(TB_SE_all$Normalized.Tag.Count, decreasing = FALSE)]
rank <- 1:length(scores)

pdf(file = "TB_SE_ROSE_plot.pdf", width = 5, height = 5)
par(mar = c(5, 5, 5, 5))
plot(x = rank, y = scores, type = "p", pch = 19, col = "red", cex = 0.8, main = "TB ROSE plot", xlab = "Enhancers ranked by H3K27ac intensity", ylab = "H3K27ac enrichment", cex.lab = 1.5, cex.axis = 1.2)
dev.off()
