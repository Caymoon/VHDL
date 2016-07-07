
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name mux21 -dir "E:/VHDL/mux21/planAhead_run_1" -part xc7a100tcsg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "mux21.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {mux21.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top mux21 $srcset
add_files [list {mux21.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc7a100tcsg324-3
