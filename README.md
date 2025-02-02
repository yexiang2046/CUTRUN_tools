# CUTRUN_tools
CUT&RUN data anlysis pipeline, doing CUT&RUN fastq files QC,alignment, and peak calliing. This pipeline will also generate bigwig files for viewing in genome browsers


##Functions
  1.  QC for raw reads
  2.  Alignment reads with bowtie2
  3.  Callpeaks with MACS2
  4.  Generate bigwig files for genome browser
  
  
 ##Dependencies
 
 Command line tools
  1.  FastQC
  2.  samtools
  3.  bowtie2
  4.  macs2
  
 Python tools
  1.  deeptools
 
 R packages
  1.  rtracklayer
  2.  ChIPseeker
  3.  DiffBind
 
 ##Usage
  ###  trim reads
	```console
	./bash/fastp_trim.sh read1_pattern read2_pattern folder_of_fastq_files 
	```	
  ###  align with bowtie2
	```console
	./bash/bowtie2_align.sh FILE_PATH READ1_PAT READ2_PAT GENOME OUT_PATH
	```
  ###  call peaks with MACS2, for TFs, remove --broad
  ```
  python3 call_peaks.py --json epi.json --output_dir macs2_out --broad
  ```
  ###  define enhancers by H3K27ac and H3K4me1
  ```
  ./bash/define_enhancer_by_H3K27ac_H3K4me1.sh H3K27ac_rep1_rep2_reproducible_peaks_qval_0.05.txt H3K4me1_rep1_rep2_reproducible_peaks_qval_0.05.txt BC3_enhancers.bed hg38_KSHV.sizes
  ```
  
