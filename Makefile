PROGRAM_NAME := main.exe  # <== Put the name for your .exe file here

CC := g++
SRC_DIR := ./src
OBJ_DIR := ./obj
HDRS := $(wildcard $(SRC_DIR)/*.h) $(wildcard $(SRC_DIR)/**/*.h)
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp) $(wildcard $(SRC_DIR)/**/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
RES_FILE := $(patsubst %.exe,%.res,$(PROGRAM_NAME))
RC_FILE := $(patsubst %.res,%.rc,$(RES_FILE))
LDFLAGS := -mwindows
LDLIBFLAGS := -lgdi32
CPPFLAGS := -g -DUNICODE

$(PROGRAM_NAME): $(OBJ_FILES) $(RES_FILE)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(OBJ_DIR)/ $(HDRS)
	mkdir -p "$(dir $@)"
	$(CC) $(CPPFLAGS) -c -o $@ $<

$(RES_FILE): $(RC_FILE)
	windres --input $^ --output $@ --output-format=coff

$(OBJ_DIR)/:
	mkdir $(OBJ_DIR)

clean:
	rm -f $(OBJ_FILES) $(PROGRAM_NAME) $(RES_FILE)