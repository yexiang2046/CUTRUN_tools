#!/bin/bash


source ~/miniconda3/bin/activate
BAM_DIR=aligned_k1
MACS2_OUTPUT=cutrun_macs2_out

#mkdir ${MACS2_OUTPUT}

## merge IgG replicates
#samtools merge -@ 30 aligned/Latent_IgG_CUTRUN.filteredChr.bam aligned/4860-XY-13_S01_L005.filteredChr.bam aligned/4860-XY-14_S01_L005.filteredChr.bam
#samtools merge -@ 30 aligned/Lytic_IgG_CUTRUN.filteredChr.bam aligned/4977-XY-1_S01_L005.filteredChr.bam aligned/4977-XY-2_S01_L005.filteredChr.bam

# call narrow peaks
macs2 callpeak -t ${BAM_DIR}/4860-XY-17_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_LANA_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/4860-XY-18_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_LANA_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/4977-XY-5_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_LANA_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/4977-XY-6_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_LANA_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-1_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-2_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-3_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K4me1_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-4_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K4me1_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-5_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K9me23_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-6_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K9me23_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-7_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27ac_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-7_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27ac_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-8_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27ac_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-9_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K4me1_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-10_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K4me1_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-11_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K9me23_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5049-XY-12_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K9me23_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-1-CCGCGGTT-AGCGCTAG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27me3_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-2-TTATAACC-GATATCGA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27me3_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-7-CAAGCTAG-ACATAGCG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H2BK20ac_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-8-TGGATCGA-GTGCGATA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H2BK20ac_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-9-AGTTCAGG-CCAACAGA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_BRF1_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-10-GACCTGAA-TTGGTGAG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_BRF1_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-11-TCTCTACT-CGCGGTTC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_TFIIIC_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-12-CTCTCGTC-TATAACCT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_TFIIIC_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-13-CCAAGTCT-AAGGATGA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_BRD4_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-3-GGACTTGG-CGCAGACG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_hisRTA_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-4-AAGTCCAA-TATGAGTA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_hisRTA_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-5-ATCCACTG-AGGTGCGT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27me3_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-6-GCTTGTCA-GAACATAC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27me3_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-15-GGCTTAAG-TCGTGACC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H2BK20ac_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-16-AATCCGGA-CTACAGTT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H2BK20ac_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-25-TAATACAG-ATATTCAC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRF1_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-26-CGGCGTGA-GCGCCTGT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRF1_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-27-ATGTAAGT-ACTCTATG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_TFIIIc_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-28-GCACGGAC-GTCTCGCA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_TFIIIc_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-29-GGTACCTT-AAGACGTC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRD4_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5328-XY-30-AACGTTCC-GGAGTACT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRD4_rep2_p.01.narrow


# bowtie aliged k1
macs2 callpeak -t ${BAM_DIR}_k1/5049-XY-1_S01_L005.filteredChr.bam -c ${BAM_DIR}_k1/Latent_IgG_CUTRUN.filteredChr.bam -q 0.99 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep1_q.99
macs2 callpeak -t ${BAM_DIR}_k1/5049-XY-2_S01_L005.filteredChr.bam -c ${BAM_DIR}_k1/Latent_IgG_CUTRUN.filteredChr.bam -q 0.99 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep2_q.99
macs2 callpeak --broad -t ${BAM_DIR}_k1/5049-XY-1_S01_L005.filteredChr.bam -c ${BAM_DIR}_k1/Latent_IgG_CUTRUN.filteredChr.bam -q 0.99 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep1_q.99
macs2 callpeak --broad -t ${BAM_DIR}_k1/5049-XY-2_S01_L005.filteredChr.bam -c ${BAM_DIR}_k1/Latent_IgG_CUTRUN.filteredChr.bam -q 0.99 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep2_q.99


# call broad peaks

macs2 callpeak --broad -t ${BAM_DIR}/4860-XY-17_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_LANA_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/4860-XY-18_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_LANA_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/4977-XY-5_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_LANA_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/4977-XY-6_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_LANA_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-1_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-2_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27ac_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-3_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K4me1_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-4_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K4me1_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-5_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K9me23_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-6_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K9me23_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-7_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27ac_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-7_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27ac_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-8_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27ac_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-9_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K4me1_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-10_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K4me1_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-11_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K9me23_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5049-XY-12_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K9me23_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-1-CCGCGGTT-AGCGCTAG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27me3_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-2-TTATAACC-GATATCGA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H3K27me3_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-7-CAAGCTAG-ACATAGCG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H2BK20ac_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-8-TGGATCGA-GTGCGATA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_H2BK20ac_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-9-AGTTCAGG-CCAACAGA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_BRF1_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-10-GACCTGAA-TTGGTGAG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_BRF1_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-11-TCTCTACT-CGCGGTTC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_TFIIIC_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-12-CTCTCGTC-TATAACCT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_TFIIIC_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-13-CCAAGTCT-AAGGATGA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/latent_BRD4_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-3-GGACTTGG-CGCAGACG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_hisRTA_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-4-AAGTCCAA-TATGAGTA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_hisRTA_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-5-ATCCACTG-AGGTGCGT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27me3_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-6-GCTTGTCA-GAACATAC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H3K27me3_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-15-GGCTTAAG-TCGTGACC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H2BK20ac_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-16-AATCCGGA-CTACAGTT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_H2BK20ac_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-25-TAATACAG-ATATTCAC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRF1_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-26-CGGCGTGA-GCGCCTGT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRF1_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-27-ATGTAAGT-ACTCTATG_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_TFIIIc_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-28-GCACGGAC-GTCTCGCA_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_TFIIIc_rep2_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-29-GGTACCTT-AAGACGTC_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRD4_rep1_p.01.broad
macs2 callpeak --broad -t ${BAM_DIR}/5328-XY-30-AACGTTCC-GGAGTACT_S01_L005.filteredChr.bam -c ${BAM_DIR}/Lytic_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n ${MACS2_OUTPUT}/lytic_BRD4_rep2_p.01.broad




macs2 callpeak -t ${BAM_DIR}/5835-XY-6_S1_L005.filteredChr.bam -c ${BAM_DIR}/BC3_Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n cutrun_macs2_out/BC3_latent_LANA_rep1_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/5835-XY-7_S1_L005.filteredChr.bam -c ${BAM_DIR}/BC3_Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n cutrun_macs2_out/BC3_latent_LANA_rep2_p.01.narrow
macs2 callpeak -t ${BAM_DIR}/BC3_Latent_LANA_CUTRUN.filteredChr.bam -c ${BAM_DIR}/BC3_Latent_IgG_CUTRUN.filteredChr.bam -p 0.01 -f BAMPE --keep-dup all -n cutrun_macs2_out/BC3_latent_LANA_p.01.narrow
