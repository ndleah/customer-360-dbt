SEP := ">>>>>>>>>>>>>>>>>>>>>>>>>>>>"

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: setup
setup: ## Starts DB in a docker container, installs DBT packages (including the parent) and seeds the DB
	docker-compose up -d 
	@echo $(SEP)
	dbt deps
	@echo $(SEP)
	dbt seed 

.PHONY: teardown
teardown: ## Shuts down the docker container(s) and cleans up DBT artifacts
	docker-compose down
	@echo $(SEP)
	dbt clean


.PHONY: models
models: ## Builds DBT models and all the tests
	dbt build 

