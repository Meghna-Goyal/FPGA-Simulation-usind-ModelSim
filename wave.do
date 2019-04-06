onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ff/ff_inst/clk
add wave -noupdate /tb_ff/ff_inst/RST
add wave -noupdate /tb_ff/ff_inst/Din
add wave -noupdate /tb_ff/ff_inst/Dout
add wave -noupdate /tb_ff/ff_inst/Enable
add wave -noupdate /tb_ff/ff_inst/dout_int
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 117
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ns} {25341 ns}
