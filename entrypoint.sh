#!/bin/sh

mitmdump -q -s telemetry.py \
    --set ssl_insecure=true \
    --ignore-hosts '^(?!.*copilot-telemetry\.githubusercontent\.com).*$' \
