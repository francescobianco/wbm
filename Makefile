
build:
	@docker build -t wbm .

test-example: build
	@docker run --rm wbm node example.js
