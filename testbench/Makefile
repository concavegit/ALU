TARGET=alu
.PHONY: all

$(TARGET):
	verilator -cc ../rtl/$(@).v -trace -exe testbench.cpp
	make -C obj_dir -f V$(@).mk
