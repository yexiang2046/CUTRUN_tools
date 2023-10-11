#!/bin/bash


# Configuration variables
THREADS=8
LIMIT_RAM=50000000000
BOWTIE2_IDX=hg38_GQ994935

# Set Bash options for error handling and command execution
set -Eeuo pipefail


# Function to display help message
display_help() {
    echo "Usage: $0 FILE_PATH READ1_PAT READ2_PAT STAR_IDX OUT_PATH"
    echo "Arguments:"
    echo "  FILE_PATH    Path to the directory containing fastq.gz files"
    echo "  READ1_PAT    Pattern for Read 1 fastq.gz files"
    echo "  READ2_PAT    Pattern for Read 2 fastq.gz files"
    echo "  GENOME 	 FASTA file for the genome"
    echo "  OUT_PATH     Output directory path"
    echo
}

# Function to log errors
log_error() {
    echo "Error: $1" >&2
}

# Trap errors and log them
trap 'log_error "Script error in line $LINENO"; exit 1' ERR


# Check for the help option
if [[ "$1" == "--help" ]]; then
    display_help
    exit 0
fi


# assign input variables
FILE_PATH="$1"
READ1_PAT="$2"
READ2_PAT="$3"
GENOME_FILE="$4"
OUT_PATH="$5"

# Check if the input file paths exist
if [[ ! -d "$FILE_PATH" ]]; then
    log_error "Input directory $FILE_PATH does not exist."
    exit 1
fi

#bowtie2-build --threads ${THREADS} ${GENOME_FILE} ${BOWTIE2_IDX}

# Create output directory if it doesn't exist
mkdir -p "$OUT_PATH"



samples_id=$(find "$FILE_PATH" -maxdepth 1 -type f -name '*.fastq.gz' -printf '%P\n' | awk -F'.' '{print $1}' | sort | uniq)
# samples_id=$(ls ${FILE_PATH} | cut -d '.' -f 1 | sort | uniq)
printf '%s\n' "$samples_id" | while IFS= read -r f; do
    echo "Read1: $FILE_PATH/$f${READ1_PAT}"
    echo "Read2: $FILE_PATH/$f${READ2_PAT}"
    bowtie2 --local --very-sensitive-local --no-unal --no-mixed --no-discordant --phred33 -k 1 -I 10 -X 700 -x ${BOWTIE2_IDX} -p ${THREADS} -1 "${FILE_PATH}/$f${READ1_PAT}" -2 "${FILE_PATH}/$f${READ2_PAT}"  -S ${OUT_PATH}/${f}.sam
    samtools view -@ 30 -S -b ${OUT_PATH}/${f}.sam > ${OUT_PATH}/${f}.bam
    samtools sort -@ 30 -o ${OUT_PATH}/${f}_sorted.bam ${OUT_PATH}/${f}.bam
    samtools view -b -h -@ 24 -L Blacklist/hg38-blacklist.v2.bed -o /dev/null -U $(basename -s .bam $f).bl.bam ${OUT_PATH}/${f}
done


chmod -R a+wr ${OUT_PATH}
