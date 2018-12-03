# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.cache/wt [current_project]
set_property parent.project_path E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/ADD.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/ALU.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/ALU_Control.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/BRG.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/Branch.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/CONTROL.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/ClockCounter.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/DM.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/EX.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/EX_MEM.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/FU.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/FiltroLoad.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/FiltroStore.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/HU.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/ID.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/ID_EX.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/IF.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/IF_ID.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/IM.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/INTERFACE.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/MEM.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/MEM_WB.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/MUX.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/MUX3.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/PC.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/Pipeline.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/RX.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/Regs.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/SE.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/TX.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/UART.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/WB.v
  E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/sources_1/new/TPF.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/constrs_1/new/Nexys-4-DDR-Master.xdc
set_property used_in_implementation false [get_files E:/Elementary/Facultad/Arquitectura/TPFinal/TPFinal.srcs/constrs_1/new/Nexys-4-DDR-Master.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top TPF -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TPF.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TPF_utilization_synth.rpt -pb TPF_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
