LIB=./lib
INCLUDE=./include
SRC=./src
OBJ=./obj

CC=gcc 

FLAGS=  -g -O0
CFLAGS=''

all: libopt-plus PSO AIWPSO BA FPA FA tmp

libopt-plus: $(LIB)/libopt-plus.a
	echo "libopt-plus.a built..."

$(LIB)/libopt-plus.a: \
$(OBJ)/common.o \
$(OBJ)/function.o \
$(OBJ)/random.o \
$(OBJ)/pso.o \
$(OBJ)/ba.o \
$(OBJ)/fpa.o \
$(OBJ)/fa.o \
$(OBJ)/gp.o \

	ar csr $(LIB)/libopt-plus.a \
$(OBJ)/common.o \
$(OBJ)/function.o \
$(OBJ)/random.o \
$(OBJ)/pso.o \
$(OBJ)/ba.o \
$(OBJ)/fpa.o \
$(OBJ)/fa.o \
$(OBJ)/gp.o \

$(OBJ)/common.o: $(SRC)/common.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/common.c -o $(OBJ)/common.o

$(OBJ)/function.o: $(SRC)/function.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/function.c -o $(OBJ)/function.o

$(OBJ)/random.o: $(SRC)/random.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/random.c -o $(OBJ)/random.o
	
$(OBJ)/pso.o: $(SRC)/pso.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/pso.c -o $(OBJ)/pso.o

$(OBJ)/ba.o: $(SRC)/ba.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/ba.c -o $(OBJ)/ba.o

$(OBJ)/fpa.o: $(SRC)/fpa.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/fpa.c -o $(OBJ)/fpa.o

$(OBJ)/fa.o: $(SRC)/fa.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/fa.c -o $(OBJ)/fa.o

$(OBJ)/gp.o: $(SRC)/gp.c
	$(CC) $(FLAGS) -I $(INCLUDE) -c $(SRC)/gp.c -o $(OBJ)/gp.o

PSO: examples/PSO.c
	$(CC) $(FLAGS) examples/PSO.c -o examples/bin/PSO -I $(INCLUDE) -L $(LIB) -lopt-plus -lm;

AIWPSO: examples/AIWPSO.c
	$(CC) $(FLAGS) examples/AIWPSO.c -o examples/bin/AIWPSO -I $(INCLUDE) -L $(LIB) -lopt-plus -lm;

BA: examples/BA.c
	$(CC) $(FLAGS) examples/BA.c -o examples/bin/BA -I $(INCLUDE) -L $(LIB) -lopt-plus -lm;

FPA: examples/FPA.c
	$(CC) $(FLAGS) examples/FPA.c -o examples/bin/FPA -I $(INCLUDE) -L $(LIB) -lopt-plus -lm;

FA: examples/FA.c
	$(CC) $(FLAGS) examples/FA.c -o examples/bin/FA -I $(INCLUDE) -L $(LIB) -lopt-plus -lm;

tmp: examples/tmp.c
	$(CC) $(FLAGS) examples/tmp.c -o examples/bin/tmp -I $(INCLUDE) -L $(LIB) -lopt-plus -lm;

clean:
	rm -f $(LIB)/lib*.a; rm -f $(OBJ)/*.o; rm -rf examples/bin/*
