SERVERLESS_IMG=amaysim/aws-serverless:1.4.0
DOTNET_IMG=microsoft/dotnet:sdk
ENV ?= dev
OUTPUT_DIR=bin/Release/netcoreapp1.0/publish

docker-pull:
	docker pull $(DOTNET_IMG)
	docker pull $(SERVERLESS_IMG)
.PHONY: docker-pull

serverless-shell:
	$(call dockerServerless) bash
.PHONY: serverless-shell

deploy: dist
	$(call dockerServerless) sls deploy -v
.PHONY: deploy

delete:
	$(call dockerServerless) sls remove -v
.PHONY: delete

log:
	$(call dockerServerless) sls logs --function hello
.PHONY: log

invoke:
	$(call dockerServerless) sls invoke --function hello
.PHONY: log

deps:
	$(call dockerDotNet) dotnet restore 
.PHONY: deps

build: deps
	$(call dockerDotNet) dotnet publish -c release
.PHONY: build

dist: build
	cd $(OUTPUT_DIR) &&	zip -r ./deploy-package.zip ./*
.PHONY: dist

clean:
	rm -rf bin obj .serverless
.PHONY: clean

define dockerDotNet
	docker run -ti \
		-v $(shell PWD):/opt/app \
		-w /opt/app \
		$(DOTNET_IMG)
endef

define dockerServerless
	docker run --rm -ti --env-file env.list \
		-e ENV=$(ENV) \
		-v $(shell PWD):/opt/app \
		-w /opt/app \
		$(SERVERLESS_IMG)
endef

