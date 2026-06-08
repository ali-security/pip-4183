#!/bin/bash
set -Eeuo pipefail

# Get the workspace directory
WORKSPACE_DIR="${WORKSPACE_DIR:-/workspaces/pip}"
cd "$WORKSPACE_DIR"

# Upgrade pip and install development dependencies
python -m pip install --index-url 'https://:2026-04-26T21:00:03.194846Z@time-machines-pypi.sealsecurity.io/' --upgrade pip
python -m pip install --index-url 'https://:2026-04-26T21:00:03.194846Z@time-machines-pypi.sealsecurity.io/' nox --group test
python -m nox -s common-wheels
python -m pip install --index-url 'https://:2026-04-26T21:00:03.194846Z@time-machines-pypi.sealsecurity.io/' -e .
