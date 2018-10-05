#!/usr/bin/env python3
# Analyze data from au.t.sv to find the slowest thing.

import sys


#lines = fileinput.input().splitlines()
lines = list(map(str.rstrip, sys.stdin.readlines()))


cleanLines = []
# Get 1st line after set, and last before reset
for i, line in enumerate(lines):
  if i == 0:
    continue
  if lines[i-1] == "Set..." or (i+1 < len(lines) and lines[i+1] == "Reset..."):
    cleanLines += [line]

pairs = []
i = 0
while i < len(lines):
  if lines[i] == "Set...":
    i += 1
    first = lines[i]
  if lines[i] == "Reset...":
    second = lines[i-1]
    pairs += [(first, second)]
  i += 1


print(pairs)
