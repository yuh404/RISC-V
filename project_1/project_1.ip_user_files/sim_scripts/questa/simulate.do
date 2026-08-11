onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib tb_system_sv_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {tb_system_sv.udo}

run 1000ns

quit -force
