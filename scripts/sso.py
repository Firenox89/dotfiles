#! /usr/bin/env python3

import os
import sys
import subprocess
import re

ansi_escape = re.compile(r'(\x9B|\x1B\[)[0-?]*[ -\/]*[@-~]')

searchterm = sys.argv[1]

ag = subprocess.run(['ag', searchterm, '--color', '--heading'], universal_newlines=True, stdout=subprocess.PIPE)
datain = ag.stdout


userinput = subprocess.check_output(['yank', '-l'], input=datain.encode('utf-8')).decode('utf-8')

lines = datain.splitlines()

noansi = ansi_escape.sub('', userinput)
filepath = os.path.abspath(noansi)

if (str(noansi).find(":") == -1):
    subprocess.call(['vim', filepath])
else:
    infileline = noansi[:noansi.find(':')]
    selectedLineNr = -1
    for i in range(len(lines)):
        if(lines[i] == userinput):
            selectedLineNr = i
            break

    for j in range(selectedLineNr, -1, -1):
        filename = ansi_escape.sub('', lines[j])
        if (str(filename) != '\n' and filename.find(":") == -1):
            subprocess.call(['vim', os.path.abspath(filename), "+"+infileline])
            break

