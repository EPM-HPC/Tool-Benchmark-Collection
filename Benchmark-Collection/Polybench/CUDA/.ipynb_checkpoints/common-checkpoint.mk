# Compiler-specific flags (by default, we always use sm_10, sm_20, and sm_30), unless we use the SMVERSION template

GENCODE_SM60 ?= -gencode=arch=compute_60,code=sm_60
GENCODE_SM61 ?= -gencode=arch=compute_61,code=sm_61


all:
	nvcc -O3 -gencode=arch=compute_60,code=sm_60 -gencode=arch=compute_61,code=sm_61 -gencode=arch=compute_70,code=sm_70 -gencode=arch=compute_75,code=sm_75 -gencode=arch=compute_80,code=sm_80 -gencode=arch=compute_80,code=compute_80 ${NVCC_ADDITIONAL_ARGS} ${CUFILES} -o ${EXECUTABLE} 
clean:
	rm -f *~ *.out
