vlib work

vcom -93 -work ./work ../fpuvhdl/common/*.vhd
vcom -93 -work ./work ../fpuvhdl/mbe/*.vhd
vcom -93 -work ./work ../fpuvhdl/multiplier/fpmul_stage1_struct.vhd
vcom -93 -work ./work ../fpuvhdl/multiplier/fpmul_stage2_struct.vhd
vcom -93 -work ./work ../fpuvhdl/multiplier/fpmul_stage3_struct.vhd
vcom -93 -work ./work ../fpuvhdl/multiplier/fpmul_stage4_struct.vhd
vcom -93 -work ./work ../fpuvhdl/multiplier/fpmul_pipeline.vhd
vcom -93 -work ./work ../tb/*.vhd
vlog -work ./work ../tb/tb_mul.v

vsim work.tb_mul

#add list -decimal clk -notrigger a b c cout sum

run 180ns

#write list counter.lst
quit -f
