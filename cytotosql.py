# -*- coding: utf-8 -*-
"""
Encode read counts per base in 2 bytes

@author: Antony Holmes
"""
import argparse
import os
import pandas as pd

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--file", help="sample name")
# parser.add_argument("-b", "--bam", help="bam file")
# parser.add_argument(
#     "-g", "--genome", default="hg19", help="genome sample was aligned to"
# )
# parser.add_argument("-w", "--widths", default="100,1000", help="size of bin")
parser.add_argument(
    "-o", "--out", default="data/modules/cytobands", help="output directory"
)
 
args = parser.parse_args()

file = args.file  # sys.argv[1]
# bam = args.bam  # sys.argv[2]
# genome = args.genome  # sys.argv[3]
# bin_widths = [int(w) for w in args.widths.split(",")]
out = args.out

# lib.encode.encode_sam_16bit(chr_size_file, file, chr, read_length, window)

df = pd.read_csv(file, sep="\t", header=None)

# inc start and end so they are 1 based
df.iloc[:, 1] +=1
#df.iloc[:, 2] +=1

print(df.values.tolist())

genome = "hg19"

with open(out, "w") as f:
    print("BEGIN TRANSACTION;", file=f)
    print(f"INSERT INTO info (genome) VALUES ('{genome}');", file=f)
    print("COMMIT;", file=f)

    print("BEGIN TRANSACTION;", file=f)
    for row in df.values.tolist():
        l = ', '.join([ f"'{str(x)}'"  for x in row])
        print(
            f"INSERT INTO cytobands (chr, start, end, name, giemsa_stain) VALUES ({l});",
            file=f,
        )

    
    print("COMMIT;", file=f)
