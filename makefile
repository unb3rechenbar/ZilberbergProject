CC = gcc
CFLAGS = -g -Wall
SRC = src
OBJ = obj
SCRS = $(wildcard $(SRC)/*.c)
OBJS = $(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(SCRS))

BIN = bin/main
SUBMITNAME = ZilberbergProject.zip

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -r bin/* obj/*

submit:
	rm $(SUBMITNAME)
	zip $(SUBMITNAME) $(BI)