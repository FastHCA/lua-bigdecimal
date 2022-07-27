CC = g++
RM = rm -f

CFLAG =  -shared -fPIC
TARGET = bigdecimal.so

LUA_INCLUDE_DIR ?=
LUA_LIBRARIES ?=
BIGDECIMAL_SOURCES = lib/bigdecimal/bigdecimal.cpp
BIGDECIMAL_INCLUDE_DIR = lib/bigdecimal

BUILD_CFLAGS = $(CFLAG) -I $(BIGDECIMAL_INCLUDE_DIR)
SOURCE = $(BIGDECIMAL_SOURCES) lua_bigdecimal.c


ifneq ($(LUA_INCLUDE_DIR),)
	BUILD_CFLAGS+= -I $(LUA_INCLUDE_DIR)
endif
ifneq ($(LUA_LIBRARIES),)
	BUILD_CFLAGS+= -L $(LUA_LIBRARIES)
endif


all: $(TARGET)

$(TARGET):
	$(CC) $(BUILD_CFLAGS) -o $@ $(SOURCE)

.PHONY: all $(TARGET)


clean:
	$(RM) $(TARGET)

.PHONY: clean
