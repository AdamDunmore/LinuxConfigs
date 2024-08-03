#!/usr/bin/env bash

output=$(ps -A | grep -m 1 -o -F \
    -e river \
    -e sway \
)

echo "${output}"
