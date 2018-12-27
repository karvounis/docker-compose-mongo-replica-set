.PHONY: initiate help
.DEFAULT_GOAL := help

up: ## Create and start containers
	docker-compose up -d

init: ## Launch mongo cluster init script
	sleep 2
	./initiate.sh

start: up init ## Starts docker containers and sets up the mongo cluster

stop: ## Stops docker containers
	docker-compose stop

clean: ## Performs docker-compose down and removes the persisting volumes as well
	docker-compose down -v

watch: ## Watch logs
	docker-compose logs -f

restart: clean start ## Clean and restart

ps: ## List containers
	docker-compose ps

top: ## Display the running processes
	docker-compose top

help: ## Print this message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
