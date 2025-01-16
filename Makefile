BIN_DIR := ./bin
OUTPUT_BIN := $(BIN_DIR)/myapp

GO_FILE := main.go

build:
		go build -o $(OUTPUT_BIN) $(GO_FILE)

clean:
		rm -f $(OUTPUT_BIN)

all: build
