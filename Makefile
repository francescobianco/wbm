
build:
	@docker build -t wbm .

test-example: build
	@docker run --rm wbm node example.js

test-local-example:
	@node example.js
