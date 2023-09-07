#!/usr/bin/env bash
#
# https://github.com/sandorex/sol

if ! command -v antlr4 &>/dev/null; then
    cat <<EOF
Please install antlr-tools using pipx:
    pipx install antlr-tools

EOF
    exit 1
fi

antlr4 -o sol -Dlanguage=Python3 -visitor SOL.g4

