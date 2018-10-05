#!/usr/bin/env python3
# Analyze data from au.t.sv to find the slowest thing.

import sys

# Take input from stdin, separate into lines, and strip trailing newlines
lines = list(map(str.rstrip, sys.stdin.readlines()))

# Get first and last lines of each computation; assemble them into pairs
pairs = []
i = 0
while i < len(lines):
  if lines[i] == "Set...": # Get the line after "Set..."
    i += 1
    first = lines[i]
  if lines[i] == "Reset...": # And before "Reset...".  (These won't be the same, but the code should
    second = lines[i-1]      # work even if they are.)
    pairs += [(first, second)]
  i += 1

def getTime(s): # Get the timestamp of a line
  t = s.split(",")[0][2:].strip()
  return int(t)

maxTime = 0 # Find the pair with the largest time spread
maxPair = ()
for pair in pairs:
  dT = getTime(pair[1]) - getTime(pair[0])
  if dT > maxTime:
    maxTime = dT
    maxPair = pair

print(maxPair)
