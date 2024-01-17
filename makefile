# Makefile for Flutter project

# Define the default target
.DEFAULT_GOAL := help

# Variables
FLUTTER := flutter

# Targets and rules
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  get     : run pub get"
	@echo "  build   : run build_runner"
	@echo "  run     : Run the Flutter app"
	@echo "  clean   : Clean build artifacts"

.PHONY: get
get:
	flutter pub get

.PHONY: build
build:
	dart run build_runner build

.PHONY: run
run:
	dart run build_runner build
	cd ./example && $(FLUTTER) run 

.PHONY: clean
clean:
	cd ./example && $(FLUTTER) clean