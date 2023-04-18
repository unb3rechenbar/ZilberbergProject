CC = gcc
CFLAGS = -g -Wall

SRC_PATH = src
OBJ_PATH = obj
BIN_PATH = bin
SCRS = $(wildcard $(SRC_PATH)/*.c)
OBJS = $(patsubst $(SRC_PATH)/%.c, $(OBJ_PATH)/%.o, $(SCRS))


TARGET_NAME = main
TARGET = $(BIN_PATH)/$(TARGET_NAME)
SUBMITNAME = ZilberbergProject.zip

default: makedir all

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -r bin/* obj/*

submit:
	rm $(SUBMITNAME)
	zip $(SUBMITNAME) $(BI)

.PHONY: makedir
makedir:
	@mkdir -p $(BIN_PATH) $(OBJ_PATH)
