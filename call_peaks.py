# script to call peaks using macs2
import os
import argparse
import utils 

# define helper functions
# function to parse command line arguments inlcuding json file
# add support for broad peaks
def parse_args():
    """ Parse command line arguments.
    """
    parser = argparse.ArgumentParser(description="Call peaks using MACS2.")
    parser.add_argument("--json", type=str, required=True, help="Path to JSON file containing sample information.")
    parser.add_argument("--output_dir", type=str, required=True, help="Path to output directory.")
    parser.add_argument("--broad", action="store_true", help="Call broad peaks.")
    return parser.parse_args()




# function to call peaks using macs2
def call_peaks_macs2(treatment_bam, control_bam, output_dir, treatment_name, broad=False):
    """
    Call peaks using MACS2.
    """
    if broad:
        cmd = f"macs2 callpeak -t {treatment_bam} -c {control_bam} -f BAMPE -g hs -q 0.99 -n {treatment_name} --outdir {output_dir} --broad && \
                sort -k8,8nr {treatment_bam}_peaks.narrowPeak > {treatment_bam}_srt_peaks.narrowPeak"
    else:
        cmd = f"macs2 callpeak -t {treatment_bam} -c {control_bam} -f BAMPE -g hs -q 0.99 -n {treatment_name} --outdir {output_dir} && \
                sort -k8,8nr {treatment_bam}_peaks.narrowPeak > {treatment_bam}_srt_peaks.narrowPeak"
    os.system(cmd)

# function to get reproducible peaks using IDR
# also filter to keep only peaks with q-value < 0.05
def get_reproducible_peaks(out_name, rep1, rep2, output_dir, idr_threshold = 0.05):
    """
    Get reproducible peaks using IDR.
    """
    cmd = f"docker run -it -w $(pwd) -v $(pwd):$(pwd) xiang2019/idr idr --samples {rep1} {rep2} --input-file-type narrowPeak --output-file {out_name}_reproducible_peaks.txt --rank signal.value --plot --log-output-file {out_name}_idr.log --idr-threshold {idr_threshold}"
    os.system(cmd)
    cmd = f"awk 'BEGIN{{OFS=\"\t\"}}{{if ($9 < {idr_threshold}) print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}}' {out_name}_reproducible_peaks.txt > {out_name}_reproducible_peaks_qval_{idr_threshold}.txt"
    os.system(cmd)


# parse command line arguments
parser = parse_args()
# read json file and parse samples
samples = utils.parse_samples_for_callpeaks(parser.json)
output_dir = parser.output_dir

for sample,replicate in samples.items():
    #print(sample)
    #print(replicate)
    for rep,files in replicate.items():
        #print(rep)
        #print(files)
        treatment_bam = files[1]
        control_bam = files[0]
        #print(treatment_bam)
        #print(control_bam)
        call_peaks_macs2(treatment_bam, control_bam, output_dir, rep)

    # break if there are more than 3 replicates or less than 2 replicates and give error message
    if len(samples[sample]) > 3:
        print("Error: more than 3 replicates")
        break

    if len(samples[sample]) < 2:
        print("Error: less than 2 replicates")
        break   

    # get reproducible peaks for 3 replicates
    if len(samples[sample]) == 3:
        #print(len(samples[sample]))
        """
        for key in replicate:
            print(key)
            print(replicate[key])
        """   
        # get reproducible peaks
        # get replicates from samples
        reps_keys = list(replicate.keys())
        file1 = reps_keys[0] + "_srt_peaks.narrowPeak"
        rep1 = os.path.join(output_dir, file1)
        file2 = reps_keys[1] + "_srt_peaks.narrowPeak"
        rep2 = os.path.join(output_dir, file2)
        file3 = reps_keys[2] + "_srt_peaks.narrowPeak"
        rep3 = os.path.join(output_dir, file3)
        #print(rep1, rep2, rep3)
        get_reproducible_peaks(out_name=sample + "_rep1" + "_rep2", rep1=rep1, rep2=rep2, output_dir=output_dir)
        get_reproducible_peaks(out_name=sample + "_rep1" + "_rep3", rep1=rep1, rep2=rep3, output_dir=output_dir)
        get_reproducible_peaks(out_name=sample + "_rep2" + "_rep3", rep1=rep2, rep2=rep3, output_dir=output_dir)
        get_reproducible_peaks(out_name=sample, rep1=sample + "_rep1" + "_rep2" + "_reproducible_peaks.txt", rep2=sample + "_rep1" + "_rep3" + "_reproducible_peaks.txt", output_dir=output_dir)
    # get reproducible peaks for 2 replicates
    if len(samples[sample]) ==2:
        reps_keys = list(replicate.keys())
        file1 = reps_keys[0] + "_srt_peaks.narrowPeak"
        rep1 = os.path.join(output_dir, file1)
        file2 = reps_keys[1] + "_srt_peaks.narrowPeak"
        rep2 = os.path.join(output_dir, file2)
        get_reproducible_peaks(out_name=sample + "_reproducible", rep1=rep1, rep2=rep2, output_dir=output_dir)
    #print(samples[sample][0])
    #print(samples[sample][1])
    #treatment_bam = samples[sample][1]
    #control_bam = samples[sample][0]
    #call_peaks_macs2(treatment_bam, control_bam, output_dir, sample)
