# Directories
BIN_DIR := $(HOME)/.local/bin
SRC_DIR := $(PWD)

# Scripts
SCRIPTS := $(shell find $(SRC_DIR) -maxdepth 1 -type f -executable)

# Scripts
.PHONY: all install clean

all: install

install:
	@echo "Creating $(BIN_DIR) if it doesn't exist..."
	@mkdir -p $(BIN_DIR)

	@echo "Linking scripts..."
	@for script in $(SCRIPTS); do \
		chmod +x $$script; \
		name=$$(basename $$script); \
		ln -sf $$script $(BIN_DIR)/$$name; \
		echo "Linked $$name"; \
	done

clean:
	@echo "Removing symlinks..."
	@for script in $(SCRIPTS); do \
		name=$$(basename $$script); \
		rm -f $(BIN_DIR)/$$name; \
		echo "Removed $$name"; \
	done
