BINARY_NAME=calculator
VERSION=1.0.0

BUILD_DIR=bin
WINDOWS_OUTPUT=$(BUILD_DIR)/windows
LINUX_OUTPUT=$(BUILD_DIR)/linux
DARWIN_OUTPUT=$(BUILD_DIR)/darwin

LDFLAGS=-ldflags "-X main.Version=$(VERSION)"

.PHONY: all clean windows linux darwin

all: clean windows linux darwin

clean:
	rm -rf $(BUILD_DIR)
	mkdir -p $(WINDOWS_OUTPUT) $(LINUX_OUTPUT) $(DARWIN_OUTPUT)

windows:
	GOOS=windows GOARCH=amd64 go build $(LDFLAGS) -o $(WINDOWS_OUTPUT)/$(BINARY_NAME)-windows-amd64.exe
	GOOS=windows GOARCH=arm64 go build $(LDFLAGS) -o $(WINDOWS_OUTPUT)/$(BINARY_NAME)-windows-arm64.exe

linux:
	GOOS=linux GOARCH=amd64 go build $(LDFLAGS) -o $(LINUX_OUTPUT)/$(BINARY_NAME)-linux-amd64
	GOOS=linux GOARCH=arm64 go build $(LDFLAGS) -o $(LINUX_OUTPUT)/$(BINARY_NAME)-linux-arm64

darwin:
	GOOS=darwin GOARCH=amd64 go build $(LDFLAGS) -o $(DARWIN_OUTPUT)/$(BINARY_NAME)-darwin-amd64
	GOOS=darwin GOARCH=arm64 go build $(LDFLAGS) -o $(DARWIN_OUTPUT)/$(BINARY_NAME)-darwin-arm64

test:
	go test ./...
