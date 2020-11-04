#!/usr/bin/env python

import os
import subprocess

os.system("rm -f ../data/tb_results.hex")

# We save the strings corresponding to the correct results
correct_values = []
try:
	prod_file = open('../data/fp_prod.hex', 'r')
	for value in prod_file:
		correct_values.append(value.rstrip());
finally:
	prod_file.close()

# We perform the simulation
os.environ["PATH"] += os.pathsep + "/software/mentor/modelsim_6.2/linux/"
os.environ["LM_LICENSE_FILE"] = "1717@led-x3850-3.polito.it"

os.system("echo $PATH")
os.system("echo $LM_LICENSE_FILE")

print ("Starting simulation...")
os.system("source /software/scripts/init_msim6.2g")
process = subprocess.call(["vsim", "-c", "-do", "compile.do"])
print ("Simulation completed")

# We check the results
obtained_results = []
try:
	results = open("../data/tb_results.hex", 'r')
	for res in results:
		obtained_results.append(res.lower().rstrip())
finally:
	results.close()

if len(obtained_results) == len(correct_values):
	error = 0
	for a,b in zip(obtained_results,correct_values):
		if a != b:
			os.system("echo \"Different results\"")
			error = 1
			break
	if error == 0:
		os.system("echo \"Correct values obtained!\"")

else:
	os.system("echo \"Different number of values obtained: try resolve thi issue before simulating\"")

		




