CC=gcc-4.9
CFLAGS=-O3 -g -march=native -Wall -Wextra
LDFLAGS=

# add -fopenmp -DOMP for multi-thread-measurement (todo)
# add  -DNB_WAIT_RANDOM to wait a random time between 0 and NB_WAIT_US in us
MORE_FLAGS=-DNB_WAIT_US=0 -DNB_REPORT_TIMES=1


.PHONY: all trace doc clean

all:
	$(CC) $(MORE_FLAGS) $(CFLAGS) $(LDFLAGS) main.c loop.c CoreRelation.c FreqGetter.c FreqSetter.c measure.c utils.c ConfInterval.c -o ftalat -lm -pthread

trace:
	$(CC) $(CFLAGS) $(LDFLAGS) -D_DUMP main.c loop.c dumpResults.c CoreRelation.c FreqGetter.c FreqSetter.c measure.c utils.c ConfInterval.c -o ftalat -lm -pthread

doc:
	doxygen ./ftalat.doxy

clean:
	rm -f ./ftalat
