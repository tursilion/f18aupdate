@rem does some of the build steps
@echo off

echo Assembly the GPU side in Asm994a, then
pause

\work\ti\tiobj2bin\release\tiobj2bin.exe F18A_PureGPU.obj F18A_PureGPU.bin -raw
\tools\bin2inc.exe F18A_PureGPU.bin F18A_PureGPU.h GPUDAT TI

echo Insert F18A_PureGPU.h into F18A_PureLDR.a99, build, then
pause

\work\ti\packdatacart\Release\packdatacart.exe F18A_GPUUpdate8.bin F18A_PureLDRC.bin f18a_250k_v18.bit f18a_rom_data.bin
copy /y /b F18A_GPUUpdate8.bin + /b F18A_GPUUpdate8.bin /b F18A_GPUUpdate512k8.bin 