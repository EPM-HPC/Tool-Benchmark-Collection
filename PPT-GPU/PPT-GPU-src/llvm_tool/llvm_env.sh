export CC=/opt/llvm-11.0/bin/clang
export CXX=/opt/llvm-11.0/bin/clang++
export C_INCLUDE_PATH=/usr/local/cuda/include:/opt/llvm-11.0/include
export CPLUS_INCLUDE_PATH=/usr/local/cuda/include:/opt/llvm-11.0/include
export CUDA_PATH=/usr/local/cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/opt/llvm-11.0/lib
export LIBRARY_PATH=/usr/local/cuda-10.1/lib64:/opt/llvm-11.0/lib
export LLVM_DIR=/opt/llvm-11.0/lib/cmake/llvm
ln -s /usr/local/cuda/lib64/libcudart.so /usr/lib/libcudart.so
