GENCODE_SM60 := -gencode=arch=compute_60,code=\"sm_60,compute_60\"
GENCODE_SM62 := -gencode=arch=compute_62,code=\"sm_62,compute_62\"

all: microbench-oo-vfunc-test microbench-tensor-core-test

microbench-oo-vfunc-test: oo-vfunc-test.cu
	nvcc $(GENCODE_SM60) $(GENCODE_SM62) $(NVCC_ADDITIONAL_ARGS) oo-vfunc-test.cu -o microbench-oo-vfunc-test



microbench-tensor-core-test: tensorcore_test.cu
	nvcc -arch=sm_70  $(NVCC_ADDITIONAL_ARGS) tensorcore_test.cu -o microbench-tensor-core-test
