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
TRIMMED_DIR="Not trimmed"
FASTQ_FILE1=$8
FASTQ_FILE2=${9}

echo "THREADS = ${THREADS}"
echo "GENOME_FILE = ${GENOME_FILE}"
echo "INDEX_PREFIX = ${INDEX_PREFIX}"
echo "OUTPUT_DIR = ${OUTPUT_DIR}"
echo "BOWTIE2_DIR = ${BOWTIE2_DIR}"
echo "ALIGNED_DIR = ${ALIGNED_DIR}"
echo "PAIREND = ${PAIREND}"
echo "TRIMMED_DIR = ${TRIMMED_DIR}"
echo "FASTQ_FILE1 = ${FASTQ_FILE1}"
echo "FASTQ_FILE2 = ${FASTQ_FILE2}"


SAMPLE_NAME=$(basename ${FASTQ_FILE1} ".fastq.gz")

echo "sample fastq file: ${FASTQ_FILE1} and ${FASTQ_FILE2}"



export PATH=$PATH:$BOWTIE2_DIR

## build index
#bowtie2-build --threads ${THREADS} ${GENOME_FILE} ${OUTPUT_DIR}/${INDEX_PREFIX}


if [[ $PAIREND == "Yes" ]]; then

  bowtie2 --local --very-sensitive-local --no-unal --no-mixed --no-discordant --phred33 -k 1 -I 10 -X 700 -x ${OUTPUT_DIR}/${INDEX_PREFIX} -p ${THREADS} -1 ${FASTQ_FILE1} -2 ${FASTQ_FILE2} -S ${ALIGNED_DIR}/${SAMPLE_NAME}.sam

  samtools view -@ 30 -S -b ${ALIGNED_DIR}/${SAMPLE_NAME}.sam > ${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools sort -@ 30 -o ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam ${ALIGNED_DIR}/${SAMPLE_NAME}.bam

elif [[ $PAIREND == "No" ]]
then

  bowtie2 --local --very-sensitive-local --no-unal --no-mixed --no-discordant --phred33 -k 1 -I 10 -X 700 -x ${OUTPUT_DIR}/${INDEX_PREFIX} -p ${THREADS} -r ${TRIMMED_DIR}/${SAMPLE_NAME}_trimmed.fq.gz -S ${ALIGNED_DIR}/${SAMPLE_NAME}.sam

  samtools view -@ 30 -S -b ${ALIGNED_DIR}/${SAMPLE_NAME}.sam > ${ALIGNED_DIR}/${SAMPLE_NAME}.bam
  samtools sort -@ 30 -o ${ALIGNED_DIR}/${SAMPLE_NAME}_sorted.bam ${ALIGNED_DIR}/${SAMPLE_NAME}.bam

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
