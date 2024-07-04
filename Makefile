# Makefile for Rust project

# Define variables
CARGO := cargo
BUILD_DIR := target
RELEASE_DIR := $(BUILD_DIR)/release
DEBUG_DIR := $(BUILD_DIR)/debug

# Define the default target
.PHONY: all
all: build

# Build the project in release mode
.PHONY: build
build:
	$(CARGO) build --release

# Build the project in debug mode
.PHONY: debug
debug:
	$(CARGO) build

# Run the project in release mode
.PHONY: run
run: build
	RUST_BACKTRACE=1 $(RELEASE_DIR)/your_project_name

# Run the project in debug mode
.PHONY: run-debug
run-debug:
	RUST_BACKTRACE=1 $(CARGO) run

# Clean the project
.PHONY: clean
clean:
	$(CARGO) clean

# Run tests
.PHONY: test
test:
	$(CARGO) test

# Generate documentation
.PHONY: doc
doc:
	$(CARGO) doc --open

# Format the code
.PHONY: fmt
fmt:
	$(CARGO) fmt

# Check for code issues (lints)
.PHONY: check
check:
	$(CARGO) check
	$(CARGO) clippy

# Run the project with specific environment variables
.PHONY: run-env
run-env:
	RUST_LOG=debug RUST_BACKTRACE=1 $(CARGO) run

# Install project dependencies
.PHONY: install
install:
	$(CARGO) install --path .

# Watch for changes and rebuild
.PHONY: watch
watch:
	$(CARGO) watch -x run
