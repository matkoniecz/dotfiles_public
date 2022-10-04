import sys
import subprocess
import os

searched = sys.argv[1]
try:
    returned = subprocess.check_output(["rg", "-l", searched]).decode('utf-8').strip().split("\n")
    for file in returned:
        os.system('codium "' + file + '"')
except subprocess.CalledProcessError:
    print("probably nothing found (subprocess.CalledProcessError)")
    pass