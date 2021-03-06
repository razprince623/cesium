#!/bin/bash

set -ex

source ~/envs/cesium/bin/activate


section "Tests"

if [[ $COVERAGE==1 ]]; then
    PYTEST_FLAGS='--cov=./'
fi
PYTHONPATH=. pytest -v cesium $PYTEST_FLAGS

section_end "Tests"

section "Build.docs"

if [[ $SKIP_DOCS != 1 ]]; then
  pip install matplotlib
  make html
fi

section_end "Build.docs"
