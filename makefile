wasmSRC = $(wildcard wasm/*.go)

all: json.wasm

json.wasm: wasm/json.wasm
	cp wasm/json.wasm json.wasm

wasm/json.wasm:$(wasmSRC)
	GOOS=js GOARCH=wasm go build -o wasm/json.wasm $^

.PHONY: clean
clean:
	rm -rvf json.wasm
	rm -rvf wasm/json.wasm
