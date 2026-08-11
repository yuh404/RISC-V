transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+tb_system_sv  -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_system_sv xil_defaultlib.glbl

do {tb_system_sv.udo}

run 1000ns

endsim

quit -force
