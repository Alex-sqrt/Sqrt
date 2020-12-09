## Setup technology files
include ../Sourse/X-FAB_max.tcl
## Setup variables
set DESIGN Sqrt2
set PARAMS {}
## Read in Verilog HDL files
# Top module
read_hdl -v2001 ../Sourse/Sqrt2/Sqrt2.v
## Compile our code (create a technology-independent schematic)
elaborate -parameters $PARAMS $DESIGN
## Setup design constraints
read_sdc ../Sourse/Sqrt2/Synthesis/Sqrt2.sdc
## Synthesize our schematic (create a technology-dependent schematic)
#synthesize -to_generic
synthesize -to_mapped
synthesize -incremental

## Write out area and timing reports
report area > ../Reports/Sqrt2_synth_area_report_max
report timing > ../Reports/Sqrt2_synth_timing_report_max
## Write out synthesized Verilog netlist
##write_hdl -mapped > ../Sourse/Sqrt2/Synthesis/Sqrt2_synth_max.v
## Write out the SDC file we will take into the place n route tool
##write_sdc > ../Sourse/Sqrt2/Synthesis/Sqrt2_out_max.sdc
gui_show

