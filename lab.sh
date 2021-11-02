#!/usr/bin/env bash

export SHELL=/bin/bash

conda activate lab

jupyter-lab --no-browser --ip 0.0.0.0 --port=8888 \
	--ServerApp.token='' --ServerApp.password='' \
	--ServerApp.allow_origin='https://colab.research.google.com' \
	--ServerApp.port_retries=0 \
	--ServerApp.terminals_enabled=True #--LabApp.terminals_settings='{"shell_command": ["/bin/bash"]}'
