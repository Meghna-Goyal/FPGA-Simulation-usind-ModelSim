onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_cntdf/cnt_inst/clk
add wave -noupdate /tb_cntdf/cnt_inst/rst
add wave -noupdate /tb_cntdf/cnt_inst/en
add wave -noupdate /tb_cntdf/cnt_inst/rstn
add wave -noupdate -color Yellow /tb_cntdf/cnt_inst/clk_2
add wave -noupdate -color {Medium Violet Red} -radix unsigned /tb_cntdf/cnt_inst/cnt_int1
add wave -noupdate /tb_cntdf/cnt_inst/qout
add wave -noupdate /tb_cntdf/cnt_inst/en_D
add wave -noupdate /tb_cntdf/cnt_inst/en_M
add wave -noupdate /tb_cntdf/cnt_inst/cnt_int2
add wave -noupdate /tb_cntdf/cnt_inst/clk_sig
add wave -noupdate /tb_cntdf/cnt_inst1/data_a
add wave -noupdate /tb_cntdf/cnt_inst1/data_b
add wave -noupdate /tb_cntdf/cnt_inst1/cnt_in
add wave -noupdate /tb_cntdf/cnt_inst1/clk_2
add wave -noupdate /tb_cntdf/cnt_inst1/rstn_in
add wave -noupdate -color {Medium Orchid} /tb_cntdf/cnt_inst1/en_D_in
add wave -noupdate /tb_cntdf/cnt_inst1/en_M_in
add wave -noupdate /tb_cntdf/cnt_inst1/reg1
add wave -noupdate /tb_cntdf/cnt_inst1/reg2
add wave -noupdate /tb_cntdf/cnt_inst1/cnt_sig
add wave -noupdate /tb_cntdf/cnt_inst1/add1
add wave -noupdate /tb_cntdf/cnt_inst1/add2
add wave -noupdate /tb_cntdf/cnt_inst1/mul1
add wave -noupdate /tb_cntdf/cnt_inst1/mul2
add wave -noupdate /tb_cntdf/cnt_inst1/mp1
add wave -noupdate -color Cyan -radix decimal /tb_cntdf/cnt_inst1/d1_out
add wave -noupdate -color Magenta -radix decimal /tb_cntdf/cnt_inst1/d2_out
add wave -noupdate /tb_cntdf/cnt_inst1/mp2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 287
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
WaveRestoreZoom {450 ns} {754 ns}
