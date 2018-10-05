# ALU

The main report is in [report.md](report.md).

The test benches are:
* A verilator-based test bench which ensures logic correctness.  Build with `make`, and run with `obj_dir/Valu`.  You should see a message saying that tests have passed.
* An iverilog-based test bench for timing.  Run with `iverilog alu.t.sv; and ./a.out | ./analyze-timing.py`.  You should see a pair of `$monitor`-style statements describing the slowest operation.
