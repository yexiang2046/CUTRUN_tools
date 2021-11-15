#!/bin/bash

#GENOME_FILE=GRCh38.primary_GQ994935.fa
#INDEX=combined_genome
#ALIGNED_DIR=aligned_k1

#source ~/anaconda3/bin/activate
THREADS=$1
GENOME_FILE=$2
INDEX_PREFIX=$3
OUTPUT_DIR=$4
BOWTIE2_DIR=$5
ALIGNED_DIR=$6
PAIREND=$7
TRIMMED_DIR=$8
FASTQ_FILE1=$9
FASTQ_FILE2=$10
SAMPLE_NAME=$(basename $FASTQ_FILE1 "_1_trimmed.fq.gz")


export PATH=$PATH:$BOWTIE2_DIR

## build index
#bowtie2-build --threads ${THREADS} ${GENOME_FILE} ${OUTPUT_DIR}/${INDEX_PREFIX}


if [[ $PAIREND == "Yes" ]]; then

  bowtie2 --local --very-sensitive-local --no-unal --no-mixed --no-discordant --phred33 -k 1 -I 10 -X 700 -x ${OUTPUT_DIR}/${INDEX_PREFIX} -p ${THREADS} -1 ${FASTQ_FILE1} -2 ${FASTQ_FILE2} -S ${ALIGNED_DIR}/${SAMPLE_NAME}.sam

  samtools view -@ 30 -S -b ${ALIGNED_DIR}/${SAMPLE_NAME}.sam > ${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools sort -@ 30 -o ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam ${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools index -@ 30 ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam
  #rm ./${ALIGNED_DIR}/${SAMPLE_NAME}.sam
  #rm ./${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools view -@ 24 -bh ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY chrGQ994935 > ${ALIGNED_DIR}/${SAMPLE_NAME}.filteredChr.bam
  samtools index -@ 24 ${ALIGNED_DIR}/${SAMPLE_NAME}.filteredChr.bam
else

  bowtie2 --local --very-sensitive-local --no-unal --no-mixed --no-discordant --phred33 -k 1 -I 10 -X 700 -x ${OUTPUT_DIR}/${INDEX_PREFIX} -p ${THREADS} -r ${FASTQ_FILE1} -S ${ALIGNED_DIR}/${SAMPLE_NAME}.sam

  samtools view -@ 30 -S -b ${ALIGNED_DIR}/${SAMPLE_NAME}.sam > ${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools sort -@ 30 -o ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam ${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools index -@ 30 ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam
  #rm ./${ALIGNED_DIR}/${SAMPLE_NAME}.sam
  #rm ./${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools view -@ 24 -bh ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY chrGQ994935 > ${ALIGNED_DIR}/${SAMPLE_NAME}.filteredChr.bam
  samtools index -@ 24 ${ALIGNED_DIR}/${SAMPLE_NAME}.filteredChr.bam
fi



#mkdir Renne_ChIP_${ALIGNED_DIR}
#for sample in $(ls LANA_ChIP_Renne)
#do
#	bowtie2 --local --very-sensitive-local --no-unal --no-discordant --phred33 -I 10 -X 700 -x combined_genome -p 32 -U ./LANA_ChIP_Renne/${sample} -S Renne_ChIP_${ALIGNED_DIR}/${sample}.sam
#done



#mkdir K8_${ALIGNED_DIR}
#for sample in $(ls K8_ChIPseq)
#do
#	bowtie2 --local --very-sensitive-local --no-unal --no-discordant --phred33 -I 10 -X 700 -x combined_genome -p 32 -U ./K8_ChIPseq/${sample} -S K8_${ALIGNED_DIR}/${sample}.sam
#done
