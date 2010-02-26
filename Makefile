CXX? = g++
CFLAGS = -Wall -Wconversion -O3 -fPIC
SHVER = 1

ifndef PREFIX
PREFIX = "/usr/local"
endif

LIB_DIR = "$(PREFIX)/lib"
BIN_DIR = "$(PREFIX)/bin"
INC_DIR = "$(PREFIX)/include"

all: svm-train svm-predict svm-scale

lib: svm.o
	$(CXX) -shared svm.o -o libsvm.so.$(SHVER)

svm-predict: svm-predict.c svm.o
	$(CXX) $(CFLAGS) svm-predict.c svm.o -o svm-predict -lm
svm-train: svm-train.c svm.o
	$(CXX) $(CFLAGS) svm-train.c svm.o -o svm-train -lm
svm-scale: svm-scale.c
	$(CXX) $(CFLAGS) svm-scale.c -o svm-scale
svm.o: svm.cpp svm.h
	$(CXX) $(CFLAGS) -c svm.cpp
install: all lib
	test -d $(BIN_DIR) || mkdir $(BIN_DIR)
	test -d $(LIB_DIR) || mkdir $(LIB_DIR)
	/usr/bin/install -m 0755 svm-train $(BIN_DIR)
	/usr/bin/install -m 0755 svm-predict $(BIN_DIR)
	/usr/bin/install -m 0755 svm-scale $(BIN_DIR)
	/usr/bin/install -m 0755 libsvm.so.$(SHVER) $(LIB_DIR)
	test -e $(LIB_DIR)/libsvm.so || /bin/ln -s $(LIB_DIR) $(LIB_DIR)/libsvm.so
	/bin/cp svm.h $(INC_DIR)
clean:
	rm -f *~ svm.o svm-train svm-predict svm-scale
