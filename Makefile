MAKEFLAGS += -s

SHELL := /bin/bash

api:
	cd perf-query-api/ && go install ./cmd/... && go vet ./cmd/... && cd ../
	go build ./perf-query-api/cmd/...

clean:
	rm ./perfq-apiserver
