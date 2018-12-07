include Makefile.inc
-include local.make

.PHONY = jupyter-env packages freeze environment start stop clean help

.DEFAULT_GOAL := help

# Macro to activate the virtual environment.  Used throughout the build to
# activate the environment for sub-shells before running any commands that
# need to work within the virtual environment.
ACTIVATE = . jupyter-env/bin/activate

help:
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@echo "  environment   Creates a Python virtualenv with all of the packages"
	@echo "                from requirements.txt."
	@echo "  freeze        Generates frozen.txt which contains a listing of all"
	@echo "                of the packages and their installed version."
	@echo "  start         Starts the jupyter notebook environment."
	@echo "  stop          Stops a currently running jupyter notebook environment."
	@echo "  clean         Removes the Python virtualenv."
	@echo 

jupyter-env:
	virtualenv --python=$(PYTHON) jupyter-env; \

packages: jupyter-env requirements.txt
	$(ACTIVATE); \
	pip install -r requirements.txt

# Generates a list of packages that are installed and their versions.  This
# is useful for storing the list of packages in the environment _before_ 
# tearing it down.
frozen.txt freeze: jupyter-env
	$(ACTIVATE); \
	pip freeze > frozen.txt

# Virtual target for a fully installed and working environment and default
# set of packages.
environment: jupyter-env packages

# Creates the notebook directory if it doesn't already exist.
$(NOTEBOOK_DIR):
	mkdir -p $(NOTEBOOK_DIR)

# Starts the notebook server.
start: environment $(NOTEBOOK_DIR)
	$(ACTIVATE); \
	jupyter notebook --notebook-dir="$(NOTEBOOK_DIR)"

stop: 
	$(ACTIVATE); \
	jupyter notebook stop

clean:
	rm -rf jupyter-env
