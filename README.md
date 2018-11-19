# Overview

# Requirements

The following packages and support software are required for this project

* Software
  * GNU Make
  * Python (2.7 or 3.5
* Python Packages:
  * Virtualenv>=16.0.0

# Targets

| Target   | Description                                                                                                                  |
| -------- | ---------------------------------------------------------------------------------------------------------------------------- |
| start    | Starts the jupyter notebook environment.                                                                                     |
| stop     | Stops the jupyter notebook environment.                                                                                      |
| clean    | Removes the jupyter virtual environment.                                                                                     |
| freeze   | Produces a listing of all of the packages that are available to the jupyter virtual environment and their versions.          |
| packages | Install all of the packages in `requirements.txt` in the jupyter virtual environment, creating the environment if necessary. |

# Variables and Overrides

Default values are set in `Makefile` and `Makefile.inc` and should be sufficient for any environment.  Overrides can be given either by modifying these files directly (not recommended) or by creating a file called `local.make` in the root of this repository and setting the override values there.

| Variable Name  | Description                                                                                                                                                                                                                            |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NOTEBOOK_DIR` | Absolute path to the directory containing notebooks.  By default this is the `notebooks` directory in the root of this repository.  This directory will be created automatically during the build process if it doesn't already exist. |
