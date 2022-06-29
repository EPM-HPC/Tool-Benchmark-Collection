# CMake generated Testfile for 
# Source directory: /home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool
# Build directory: /home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Saxpy "clang++" "--cuda-gpu-arch=sm_35" "-std=c++11" "-lcudart" "-finline-functions" "-Xclang" "-load" "-Xclang" "/home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool/build/libcuda_flux_pass.so" "saxpy.cu" "-o" "saxpy")
set_tests_properties(Saxpy PROPERTIES  WORKING_DIRECTORY "/home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool/test")
add_test(BranchDivergence "clang++" "--cuda-gpu-arch=sm_35" "-std=c++11" "-lcudart" "-finline-functions" "-Xclang" "-load" "-Xclang" "/home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool/build/libcuda_flux_pass.so" "branchdivergence.cu" "-o" "branchDivergence")
set_tests_properties(BranchDivergence PROPERTIES  WORKING_DIRECTORY "/home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool/test")
add_test(run_saxpy "./gpu_check_wrapper.sh" "./saxpy")
set_tests_properties(run_saxpy PROPERTIES  SKIP_RETURN_CODE "77" WORKING_DIRECTORY "/home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool/test")
add_test(run_branch_divergence "./gpu_check_wrapper.sh" "./check_branch_div.py" "2349243")
set_tests_properties(run_branch_divergence PROPERTIES  SKIP_RETURN_CODE "77" WORKING_DIRECTORY "/home/wwr/Desktop/jasonyang/Tool-Benchmark-Collection/PPT-GPU/PPT-GPU-src/llvm_tool/test")
subdirs("mekong-utils")
