# Library setup
set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib
set_db library slow.lib

# Read RTL
read_hdl -sv rtl/divider.v

# Elaborate top module
elaborate divider

# Clock constraint
create_clock -name clk -period 10 [get_ports clk]

# Synthesis
syn_generic
syn_map
syn_opt

# Reports
report_timing > rpt/timing.rpt
report_power  > rpt/power.rpt
report_area   > rpt/area.rpt

# Write synthesized netlist
write_hdl > divider_netlist.v

# genus -files synth.tcl

