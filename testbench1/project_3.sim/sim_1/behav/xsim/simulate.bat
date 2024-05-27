@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed May 24 22:33:04 +0800 2023
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim tb_adder_behav -key {Behavioral:sim_1:Functional:tb_adder} -tclbatch tb_adder.tcl -view C:/Users/86183/Desktop/f_adder/project_3/tb_adder_behav.wcfg -log simulate.log"
call xsim  tb_adder_behav -key {Behavioral:sim_1:Functional:tb_adder} -tclbatch tb_adder.tcl -view C:/Users/86183/Desktop/f_adder/project_3/tb_adder_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0