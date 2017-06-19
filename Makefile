
.PHONY: default get-deps test doc build clean

CC=gcc
CFLAGS=-std=c99 -Wall -Wextra -pedantic -g

SOURCE_DIR=src/
BUILD_DIR=build/
DOCUMENTATION_DIR=doc/
TEST_DIR=test/

TMP_DIR=tmp/
CRITERION_URL=https://github.com/Snaipe/Criterion/releases/download/v2.3.2/criterion-v2.3.2-linux-x86_64.tar.bz2

default: build main.o
	

get-deps: get-criterion
	echo $@

test: get-criterion
	true

get-criterion:
	@if [ ! -d "$(TMP_DIR)" ]; then \
		mkdir "$(TMP_DIR)"; \
	fi; \
	cd $(TMP_DIR); \
	if [ ! -d "criterion" ]; then \
		wget -O criterion.tar.gz2 "$(CRITERION_URL)" \
		&& tar jxf criterion.tar.gz2 \
		&& printf "\n===== CRITERION READY =====\n"; \
	rm criterion.tar.gz2; \
	mv criterion* criterion; \
	fi;

doc:
	@if [ ! -d "$(DOCUMENTATION_DIR)" ]; then \
		mkdir "$(DOCUMENTATION_DIR)"; \
	fi
	#doxygen

build:
	@if [ ! -d "$(BUILD_DIR)" ]; then \
		mkdir "$(BUILD_DIR)"; \
	fi

%.o: $(SOURCE_DIR)%.c $(SOURCE_DIR)%.h
	$(CC) $(CFLAGS) -o $(BUILD_DIR)$@ $<

run: build main.o
	@printf "\n===== RUN MAIN =====\n\n"
	./$(BUILD_DIR)main.o

clean:
	rm -R "$(BUILD_DIR)"; 
	rm -R "$(DOCUMENTATION_DIR)"

