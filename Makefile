MAKEFLAGS += -s

SHELL := /bin/bash

presubmit: dashboard-lint api

dashboard-lint:
	cd dashboard/ && node_modules/tslint/bin/tslint "src/**/*.ts" --project src/tsconfig.json --type-check
	cd dashboard/ && node_modules/tslint/bin/tslint "e2e/**/*.ts" --project e2e/tsconfig.json --type-check

api:
	cd perf-query-api/ && go install ./cmd/... && go vet ./cmd/... && cd ../
	go build ./perf-query-api/cmd/...

clean:
	rm ./perfq-apiserver
