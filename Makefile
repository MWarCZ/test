
.PHONY: default get-deps test doc build clean

CC=gcc
CFLAGS=-std=c99 -Wall -Wextra -pedantic -g

SOURCE_DIR=src/
BUILD_DIR=build/
DOCUMENTATION_DIR=doc/
TEST_DIR=test/

default: build main
	

get-deps:
	echo $@

test:
	true

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

