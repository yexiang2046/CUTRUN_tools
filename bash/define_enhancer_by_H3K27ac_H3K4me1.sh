#!/bin/bash
# this script use H3K27ac and H3K4me1 CUT&RUN peak intersection to define enhancer 

set -Eeuo pipefail

# helper function
if [ $# -ne 4 ]; then
    echo -e "Usage: $0 <H3K27ac peak file> <H3K4me1 peak file> <output enhancer file> <chromosome size file>"
    echo -e "Example: $0 latent_H3K27ac_idr.05.bed latent_H3K4me1_idr.05.bed latent_enhancers.bed hg38.chrom.sizes"
    exit 1
fi


# parse arguments
H3K27ac_peak=$1
H3K4me1_peak=$2
output_enhancer=$3
chrom_size=$4

# filter peaks by chromosome name
cat ${H3K27ac_peak} | awk '{if($1 ~ /^chr/) {print $0}}' > ${H3K27ac_peak}.tmp
cat ${H3K4me1_peak} | awk '{if($1 ~ /^chr/) {print $0}}' > ${H3K4me1_peak}.tmp

# define enhancers by H3K27ac and H3K4me1
bedtools intersect -wa -a ${H3K27ac_peak}.tmp -b ${H3K4me1_peak}.tmp | sort | uniq | bedtools sort -g ${chrom_size} -i - > ${output_enhancer}