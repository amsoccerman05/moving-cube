CC := clang
CFLAGS := -Wall -Wextra -pedantic
LDFLAGS := -lm
TARGET := spin
SRC := spin.c

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)
