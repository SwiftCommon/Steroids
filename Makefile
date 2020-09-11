#
# Makefile
#

TRAVIS 			?= false
BUILD_TYPE	?= 'debug'
PROJECT_DIR	:= $(PWD)

ifeq ($(TRAVIS), true)
  BUILD_TYPE = release
endif

.PHONY: setup update test build lint cibuild all

setup:
	$(PROJECT_DIR)/scripts/setup

update:
	$(PROJECT_DIR)/scripts/update

test:
	$(PROJECT_DIR)/scripts/test

build:
	$(PROJECT_DIR)/scripts/build ${BUILD_TYPE}

lint:
	$(PROJECT_DIR)/scripts/lint

cibuild:
	$(PROJECT_DIR)/scripts/cibuild ${BUILD_TYPE}

all: setup lint test build cibuild
