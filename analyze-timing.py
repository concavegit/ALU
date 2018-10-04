#!/usr/bin/env python3
# Analyze data from au.t.sv to find the slowest thing.

import sys


#lines = fileinput.input().splitlines()
lines = list(map(str.rstrip, sys.stdin.readlines()))


cleanLines = []
# Get 1st line after set, and last before reset
for i, line in enumerate(lines):
  if line == "Set...":
    cleanLines += line
    cleanLines += lines[i+1]
  if line == "Reset...":
    if len(cleanLines) == 0 or (cleanLines[len(cleanLines)-1] != line): # No duplicates
      cleanLines += lines[i-1]

print(lines)
#print(cleanLines)
