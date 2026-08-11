transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+design_1_wrapper_tb  -L xil_defaultlib -L xpm -L proc_sys_reset_v5_0_17 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_1_wrapper_tb xil_defaultlib.glbl

do {design_1_wrapper_tb.udo}

run 1000ns

endsim

quit -force
