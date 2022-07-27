CC = g++
RM = rm -f

CFLAG =  -shared -fPIC
TARGET = bigdecimal.so

BIGDECIMAL_SOURCES = lib/bigdecimal/bigdecimal.cpp
BIGDECIMAL_INCLUDE_DIR = lib/bigdecimal

BUILD_CFLAGS = $(CFLAG) -I $(BIGDECIMAL_INCLUDE_DIR)
SOURCE = $(BIGDECIMAL_SOURCES) lua_bigdecimal.c

all: $(TARGET)

$(TARGET):
	$(CC) $(BUILD_CFLAGS) -o $@ $(SOURCE)

.PHONY: all $(TARGET)


clean:
	$(RM) $(TARGET)

.PHONY: clean
