#!/bin/bash

#Generates the Helm package .tgz in releases/ dir

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p "$SCRIPT_DIR/releases"

helm package "$SCRIPT_DIR/ravendb" --destination "$SCRIPT_DIR/releases"

helm repo index "$SCRIPT_DIR/releases" --url https://jeremy-morren.github.io/ravendb-helm/releases

# The 'index.yaml' file needs to be at repository root
rm "$SCRIPT_DIR/index.yaml" 2> /dev/null
mv "$SCRIPT_DIR/releases/index.yaml" "$SCRIPT_DIR/"
