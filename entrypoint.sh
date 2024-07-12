#!/bin/bash

# Use jq to update secrets.json with environment variables
jq --arg pb "$P_B" --arg plat "$P_LAT" '.tokens[0]."p-b" = $pb | .tokens[0]."p-lat" = $plat' poe_api_wrapper/openai/secrets.json > /tmp/secrets.json && mv /tmp/secrets.json poe_api_wrapper/openai/secrets.json

# Set PYTHONPATH to the current directory
export PYTHONPATH=.

# Execute the main command (e.g., start your Python application)
exec python3 poe_api_wrapper/openai/api.py