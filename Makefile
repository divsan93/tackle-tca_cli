GOBIN ?= ${GOPATH}/bin

all: cmd

fmt:
	go fmt ./...

vet:
	go vet ./...

cmd: fmt vet
	go build -o bin/addon https://github.com/divsan93/tackle-tca_cli/cmd
