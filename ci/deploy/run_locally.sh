#!/usr/bin/env bash

TF_ENV=$1
 
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
 
# Always run from the location of this script
cd $DIR

if [ $# -gt 0 ]; then
    if [ "$2" == "init" ]; then
      terraform -chdir=./$TF_ENV init -backend-config=../backend-$TF_ENV.tf
    elif [ "$2" == "deploy" ]; then
      terraform fmt --recursive
      terraform -chdir=./$TF_ENV validate
      terraform -chdir=./$TF_ENV apply
    else
      terraform -chdir=./$TF_ENV $2
    fi
fi
 
# Head back to original location to avoid surprises
cd -