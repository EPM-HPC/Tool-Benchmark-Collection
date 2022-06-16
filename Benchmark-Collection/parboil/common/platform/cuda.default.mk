# (c) 2007 The Board of Trustees of the University of Illinois.

# Cuda-related definitions common to all benchmarks

########################################
# Variables
########################################

# c.default is the base along with CUDA configuration in this setting
include $(PARBOIL_ROOT)/common/platform/c.default.mk

# Paths
CUDAHOME=$(CUDA_INSTALL_PATH)

# Programs
CUDACC=$(CUDAHOME)/bin/nvcc
CUDALINK=$(CUDAHOME)/bin/nvcc

# Flags
PLATFORM_CUDACFLAGS=-O3 -gencode=arch=compute_60,code=sm_60 -gencode=arch=compute_61,code=sm_61 -gencode=arch=compute_70,code=sm_70 -gencode=arch=compute_75,code=sm_75 -gencode=arch=compute_80,code=sm_80 -gencode=arch=compute_80,code=compute_80
PLATFORM_CUDALDFLAGS=-lm -lpthread $(NVCC_ADDITIONAL_ARGS)


