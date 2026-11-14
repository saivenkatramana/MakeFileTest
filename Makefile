# Compiler
CXX = g++

# Application name
TARGET = demo_app

# Directories
SRC_DIR = src
INC_DIR = include
BUILD_DIR = build

# Configuration
BUILD ?= Debug

# Compiler flags
CXXFLAGS = -std=c++17 -Wall -Wextra -I$(INC_DIR)

# Configuration-specific settings
ifeq ($(BUILD),Debug)
    CXXFLAGS += -g -O0 -DAPP_DEBUG=1
else ifeq ($(BUILD),Release)
    CXXFLAGS += -O2 -DNDEBUG -DAPP_DEBUG=0
else
    $(error Invalid BUILD configuration: $(BUILD))
endif

# Application version
CXXFLAGS += -DAPP_VERSION=\"1.0.0\"

# Source files
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)

# Object files
OBJECTS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SOURCES))

# Final executable
TARGET_PATH = $(BUILD_DIR)/$(TARGET)

# Default target
all: $(TARGET_PATH)

# Link object files
$(TARGET_PATH): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run application
run: all
	./$(TARGET_PATH)

# Clean build
clean:
	rm -rf $(BUILD_DIR)

# Display configuration
info:
	@echo "Compiler: $(CXX)"
	@echo "Build configuration: $(BUILD)"
	@echo "Flags: $(CXXFLAGS)"

.PHONY: all run clean info
