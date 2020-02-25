CC = cc
FF = ftn

CFLAGS = -O2 
FFLAGS = -O2

#PGI
#CFLAGS += -mp
#FFLAGS += -mp


#arg  add by liro
NTIMES += -DNTIMES
NTIMESVALUE = 10    


N += -DN
NVALUE = 3000000

OFFSET += -DOFFSET
OFFSETVALUE = 0    

#GNU
#CFLAGS += -fopenmp
#FFLAGS += -fopenmp 

#INTEL
#CFLAGS += -openmp
#FFLAGS += -openmp


all: stream_f.exe stream_c.exe

stream_f.exe: stream.f mysecond.o
	$(CC) $(CFLAGS) -c mysecond.c
	$(FF) $(FFLAGS) -c stream.f
	$(FF) $(FFLAGS) stream.o mysecond.o -o stream_f.exe 

stream_c.exe: stream.c
	$(CC) $(CFLAGS) $(NTIMES)=$(NTIMESVALUE) $(N)=$(NVALUE) $(OFFSET)=$(OFFSETVALUE) stream.c -o stream_c.exe
clean:
	rm -f stream_f.exe stream_c.exe *.o

