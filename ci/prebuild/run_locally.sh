#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Always run from the location of this script
cd $DIR

if [ $# -gt 0 ]; then
    if [ "$1" == "init" ]; then
      terraform init
    elif [ "$1" == "deploy" ]; then
      terraform fmt
      terraform validate
      terraform apply -var 'project_modules=["client", "nginx", "worker", "server"]'
    else
      terraform $1 -var 'project_modules=["client", "nginx", "worker", "server"]'
    fi
fi
