# script to call peaks using macs2
import os
import argparse
import utils 

# function to parse command line arguments inlcuding json file
def parse_args():
    """
    Parse command line arguments.
    """
    parser = argparse.ArgumentParser(description="Call peaks using MACS2.")
    parser.add_argument("--json", type=str, required=True, help="Path to JSON file containing sample information.")
    parser.add_argument("--output_dir", type=str, required=True, help="Path to output directory.")
    return parser.parse_args()




# function to call peaks using macs2
def call_peaks_macs2(treatment_bam, control_bam, output_dir, treatment_name):
    """
    Call peaks using MACS2.
    """
    cmd = f"macs2 callpeak -t {treatment_bam} -c {control_bam} -f BAMPE -g hs -q 0.01 -n {treatment_name} --outdir {output_dir}"
    os.system(cmd)


# parse command line arguments
parser = parse_args()
# read json file and parse samples
samples = utils.parse_samples_for_callpeaks(parser.json)
output_dir = parser.output_dir

for sample in samples:
    #print(samples[sample][0])
    #print(samples[sample][1])
    treatment_bam = samples[sample][1]
    control_bam = samples[sample][0]
    call_peaks_macs2(treatment_bam, control_bam, output_dir, sample)
