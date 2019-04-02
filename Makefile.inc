# Directory for notebooks.  This will be used as the default location from Jupyter
NOTEBOOK_DIR ?= notebooks

# Name of the python executable to use for the virtual environment.  Changing this
# will affect the default python interpreter in the jupyter virtual environment.
PYTHON ?= python

# Root directory for the anaconda installation.
ANACONDA_HOME ?= 

CONDA = . $(ANACONDA_HOME)/etc/profile.d/conda.sh

ACTIVATE = conda activate $(PWD)/jupyter-env
