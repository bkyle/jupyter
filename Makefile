include Makefile.inc
-include local.make

.PHONY = jupyter-env deeplearning-env environments start stop help

.DEFAULT_GOAL := help

help:
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@echo "  environments   Creates the Conda Environments with all of the packages"
	@echo "                 from the appropriate requirements.txt."
	@echo "  start          Starts the jupyter notebook environment."
	@echo "  stop           Stops a currently running jupyter notebook environment."
	@echo 

jupyter-env: jupyter-env/requirements.txt
	$(CONDA); \
	conda env list | grep "$@" > /dev/null; \
	if [[ $$? -ne 0 ]]; then \
		conda create -y -n "$@"; \
	fi; \
	conda activate "$@"; \
	conda install -y --file "$<"

deeplearning-env: deeplearning-env/requirements.txt
	$(CONDA); \
	conda env list | grep "$@" > /dev/null; \
	if [[ $$? -ne 0 ]]; then \
		conda create -y -n "$(basename $(dirname $@))"; \
	fi; \
	conda activate "$@"; \
	conda install -y --file "$<"

# Virtual target for a fully installed and working environment and default
# set of packages.
environments: jupyter-env deeplearning-env

# Creates the notebook directory if it doesn't already exist.
$(NOTEBOOK_DIR):
	mkdir -p $(NOTEBOOK_DIR)

# Starts the notebook server.
start: environments $(NOTEBOOK_DIR)
	$(CONDA); \
	conda activate jupyter-env; \
	jupyter notebook --notebook-dir="$(NOTEBOOK_DIR)"

stop: 
	$(CONDA); \
	conda activate jupyter-env; \
	jupyter notebook stop
