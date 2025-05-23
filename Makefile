# Default step to run
.DEFAULT_GOAL := help


build: ## Build the application only
	CGO_ENABLED=0 go build -v -ldflags="-s -w" main.go
	mv main scraper

run: ## Start the application in foreground
	./scraper

help: ## Print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
