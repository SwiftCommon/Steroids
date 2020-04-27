#
# Makefile
#

TRAVIS 			?= false
MACOSX_DEPLOYMENT_TARGET ?= 'x86_64-apple-macosx10.12'
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
	$(PROJECT_DIR)/scripts/test ${MACOSX_DEPLOYMENT_TARGET}

build:
	$(PROJECT_DIR)/scripts/build ${MACOSX_DEPLOYMENT_TARGET} ${BUILD_TYPE}

lint:
	$(PROJECT_DIR)/scripts/lint

cibuild:
	$(PROJECT_DIR)/scripts/cibuild ${MACOSX_DEPLOYMENT_TARGET} ${BUILD_TYPE}

all: setup lint test build cibuild
