all: CUDA/leukocyte 

CUDA/leukocyte:
	cd meschach_lib; gcc -c -O -DHAVE_CONFIG_H *.c
	cd CUDA;gcc -g -O3 -Wall -I../meschach_lib *.c -c ; make

clean:
	cd CUDA; make clean
	rm -f meschach_lib/meschach.a
