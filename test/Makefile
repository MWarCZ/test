
CC=gcc
CFLAGS=-std=c99 -g -I .

TEST_FRAMEWORK_DIR=../test_framework/
BUILD_DIR=../build_test/
SOURCE=$(wildcard *c)
OBJECTS:=$(SOURCE:.c=.o)
OBJECTS:=$(addprefix $(BUILD_DIR),$(OBJECTS))

APP_OBJECTS:=$(filter-out ../build/run ../build/main.o,$(wildcard ../build/*))

all: build

get-deps:
	@if [ ! -d $(TEST_FRAMEWORK_DIR) ]; then \
		mkdir $(TEST_FRAMEWORK_DIR) \
		&& cd $(TEST_FRAMEWORK_DIR) \
		&& wget "http://github.com/Tuplanolla/cheat/raw/1.0.3/cheat.h"; \
		fi

build_dir:
	@if [ ! -d "$(BUILD_DIR)" ]; then \
		mkdir $(BUILD_DIR); \
	fi

build: get-deps build_dir $(OBJECTS)

$(BUILD_DIR)run: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(APP_OBJECT)

### START: Dynamicke vytvoreni cilu s volitelnymi prerekvizitami

TARGETS=$(OBJECTS) 
define BUILD_TARGET 
$(1): $(wildcard $(1:$(BUILD_DIR)%.o=%.c)) $(wildcard $(1:$(BUILD_DIR)%.o=%.h)) 
	@#echo "$$@ >> $$^ <<" 
	$(CC) $(CFLAGS) -o $$@ $$<
endef 
$(foreach target,$(TARGETS),$(eval $(call BUILD_TARGET,$(target)))) 

### END 

run: build 
	@#printf "\n===== RUN =====\n\n"
	@#./$(BUILD_DIR)run
	@$(foreach run,$(OBJECTS), printf "\n===== TEST =====\n" && ./$(run);)

clean:
	@printf "\n===== CLEAN =====\n\n"
	rm -f -R $(BUILD_DIR)
	rm -f -R $(TEST_FRAMEWORK_DIR)

