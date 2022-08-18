onerror {quit -f}
vlib work
vlog -work work Instruction_Decoder.vo
vlog -work work Instruction_Decoder.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Instruction_Decoder_vlg_vec_tst
vcd file -direction Instruction_Decoder.msim.vcd
vcd add -internal Instruction_Decoder_vlg_vec_tst/*
vcd add -internal Instruction_Decoder_vlg_vec_tst/i1/*
add wave /*
run -all
