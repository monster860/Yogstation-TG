#!/bin/bash
set -euo pipefail

## Change to project root relative to the script
cd "$(dirname "${0}")/../.."
base_dir="$(pwd)"

## The final authority on what's required to fully build the project
source dependencies.sh

## Setup NVM
if [[ -e ~/.nvm/nvm.sh ]]; then
	source ~/.nvm/nvm.sh
	nvm use "${NODE_VERSION}"
fi

echo "Running maphash"
cd "${base_dir}/tools/maphash"
# npm ci 
node index.js --check
