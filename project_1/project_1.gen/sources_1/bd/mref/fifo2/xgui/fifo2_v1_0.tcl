# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ASIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DSIZE" -parent ${Page_0}


}

proc update_PARAM_VALUE.ASIZE { PARAM_VALUE.ASIZE } {
	# Procedure called to update ASIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASIZE { PARAM_VALUE.ASIZE } {
	# Procedure called to validate ASIZE
	return true
}

proc update_PARAM_VALUE.DSIZE { PARAM_VALUE.DSIZE } {
	# Procedure called to update DSIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DSIZE { PARAM_VALUE.DSIZE } {
	# Procedure called to validate DSIZE
	return true
}


proc update_MODELPARAM_VALUE.DSIZE { MODELPARAM_VALUE.DSIZE PARAM_VALUE.DSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DSIZE}] ${MODELPARAM_VALUE.DSIZE}
}

proc update_MODELPARAM_VALUE.ASIZE { MODELPARAM_VALUE.ASIZE PARAM_VALUE.ASIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASIZE}] ${MODELPARAM_VALUE.ASIZE}
}

