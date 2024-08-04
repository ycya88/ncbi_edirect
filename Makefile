.DEFAULT_GOAL := help
.PHONY: help files build

help:
	@echo "Usage: make [TARGET]"
	@echo "Targets:"
	@echo "files                        Show files"
	@echo "build-alpine-root            Docker build"
	@echo "build-alpine-user            Docker build"
	@echo "build-ubuntu-root            Docker build"
	@echo "build-ubuntu-user            Docker build"
	@echo "exec-alpine-root             Docker exec"
	@echo "exec-alpine-user             Docker exec"
	@echo "exec-ubuntu-root             Docker exec"
	@echo "exec-ubuntu-user             Docker exec"
	@echo "purge-edirect-all            Docker purge"

files:
	@find . -path './.git' -prune -o -ls > FILES

build-alpine-root:
	@docker compose -f docker-compose.alpine.root.yml build

build-alpine-user:
	@docker compose -f docker-compose.alpine.user.yml build

build-ubuntu-root:
	@docker compose -f docker-compose.ubuntu.root.yml build

build-ubuntu-user:
	@docker compose -f docker-compose.yml build

exec-alpine-root:
	@docker compose -f docker-compose.alpine.root.yml up -d \
	&& docker compose -f docker-compose.alpine.root.yml exec edirect-alpine-root /bin/bash

exec-alpine-user:
	@docker compose -f docker-compose.alpine.user.yml up -d \
	&& docker compose -f docker-compose.alpine.user.yml exec edirect-alpine-user /bin/bash

exec-ubuntu-root:
	@docker compose -f docker-compose.ubuntu.root.yml up -d \
	&& docker compose -f docker-compose.ubuntu.root.yml exec edirect-ubuntu-root /bin/bash

exec-ubuntu-user:
	@docker compose up -d \
	&& docker compose exec edirect-ubuntu-user /bin/bash

purge-edirect-all:
	@bash -c 'read -p "Warning: This will remove all containers named edirect-*. Are you sure? (y/n) " confirm && if [ "$$confirm" = "y" ]; then \
		docker stop $$(docker ps -a -f "name=^edirect-" -q) && \
		docker rm $$(docker ps -a -f "name=^edirect-" -q); \
	else \
		echo "Operation canceled."; \
	fi'
