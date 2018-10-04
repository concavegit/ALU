TARGET=alu
.PHONY: all

$(TARGET):
	verilator -cc $(@).sv -exe testbench.cpp
	make -C obj_dir -f V$(@).mk
