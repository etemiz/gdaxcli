#!/usr/bin/env bash

# Run this file if you cloned the repo. Create aliases as you see fit.
# ./make.sh install
# ./make.sh test
# ./make.sh gdaxcli

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$SCRIPT_DIR" > /dev/null 2>&1

install() {
  pip install pipenv
  pipenv install
}

configure() {
  CONFIG_FILE="$HOME/.gdaxcli_config"
  if [[ -e "$CONFIG_FILE" ]]; then
    echo "File $CONFIG_FILE exists. Remove file and retry."
  else
    if [[ $# -ne 3 ]]; then
      echo -n "Passphrase: "
      read -r passphrase
      echo -n "Key: "
      read -r key
      echo -n "Secret: "
      read -r secret
    fi
    touch "$CONFIG_FILE"
    echo -e "${1:-$passphrase}\n${2:-$key}\n${3:-$secret}" >> "$CONFIG_FILE"
    chmod 600 "$CONFIG_FILE"
  fi
}

test() {
  unit_test
  pip_test
}

unit_test() {
  # For unittesting.
  configure PASSPHRASE KEY SECRET
  pipenv run python -m gdaxcli.tests.gdax_utils_test
}

pip_test() {
  # Try installing and running from pip.
  mkdir pip_test
  cd pip_test || return 1
  pip install gdaxcli || return 1
  python -m gdaxcli
}

gdaxcli() {
  pipenv run python -m gdaxcli "$@"
}

"$@"
