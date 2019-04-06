onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_dataflow/DF_inst/clk
add wave -noupdate /tb_dataflow/DF_inst/rst
add wave -noupdate /tb_dataflow/DF_inst/D1
add wave -noupdate /tb_dataflow/DF_inst/D2
add wave -noupdate /tb_dataflow/DF_inst/Dout
add wave -noupdate /tb_dataflow/DF_inst/D1_reg1
add wave -noupdate /tb_dataflow/DF_inst/D1_reg2
add wave -noupdate /tb_dataflow/DF_inst/d1_reg3
add wave -noupdate /tb_dataflow/DF_inst/d2_reg1
add wave -noupdate /tb_dataflow/DF_inst/d2_reg2
add wave -noupdate /tb_dataflow/DF_inst/d2_reg3
add wave -noupdate /tb_dataflow/DF_inst/mul1
add wave -noupdate /tb_dataflow/DF_inst/mul2
add wave -noupdate /tb_dataflow/DF_inst/mul3
add wave -noupdate /tb_dataflow/DF_inst/add1
add wave -noupdate /tb_dataflow/DF_inst/add2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 247
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {922 ns}
