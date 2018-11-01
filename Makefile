MODEL_NAME := stock/test


clean: clean-pyc

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +


build: clean
	docker build -t $(MODEL_NAME)  .

bash:
	docker run \
		-v $(CURDIR)/apps/:/work/apps/ \
		-it $(MODEL_NAME) \
		/bin/bash

