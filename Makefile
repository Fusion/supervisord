DIR := ${CURDIR}

LINUX_AMD64_BIN='supervisord_linux_amd64'
LINUX_AMD64_HOST='tvhub'

DARWIN_AMD64_BIN='supervisord_darwin_amd64'

WINDOWS_AMD64_BIN='supervisord_windows_amd64'

PROJECT_PATH='~/Projects/GO/supervisord'

all: clean linux_amd64_full darwin_full

clean:
	@echo $(DIR)
	@go clean

dev_build:
	@echo Building Local Target
	@go build

dev_compress:
	upx --brute supervisord

dev_full: dev_build dev_compress

linux_amd64_build:
	@echo Building Linux-AMD64 Target
	env GOOS=linux GOARCH=amd64 go build -a -ldflags="-s -w" -o $(LINUX_AMD64_BIN)

linux_amd64_compress:
	@ssh $(LINUX_AMD64_HOST) mkdir -p $(PROJECT_PATH) \
	&& scp $(LINUX_AMD64_BIN) $(LINUX_AMD64_HOST):$(PROJECT_PATH)/ \
	&& ssh $(LINUX_AMD64_HOST) upx --brute $(PROJECT_PATH)/$(LINUX_AMD64_BIN) \
	&& rm -f $(LINUX_AMD64_BIN) \
	&& scp $(LINUX_AMD64_HOST):$(PROJECT_PATH)/$(LINUX_AMD64_BIN) .

linux_amd64_full: linux_amd64_build linux_amd64_compress

darwin_amd64_build:
	@echo Building Darwin-AMD64 Target
	env GOOS=darwin GOARCH=amd64 go build -a -ldflags="-s -w" -o $(DARWIN_AMD64_BIN)

darwin_amd64_full: darwin_amd64_build

windows_amd64_build:
	@echo Building Windows-AMD64 Target
	env GOOS=windows GOARCH=amd64 go build -a -ldflags="-s -w" -o $(WINDOWS_AMD64_BIN)

windows_amd64_full: windows_amd64_build

.PHONY: all \
	clean \
	dev_build dev_compress dev_full \
	linux_amd64_buid linux_amd64_compress linux_amd64_full \
	darwin_amd64_buid darwin_amd64_full \
	windows_amd64_buid windows_amd64_full

# vim:set ts=8 sw=8 noet:
