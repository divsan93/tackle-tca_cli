#!/bin/bash

host="${HOST:-localhost:8080}"

curl -X POST ${host}/tasks -d \
'{
    "name":"tca_cli",
    "state": "Ready",
    "locator": "tca_cli",
    "addon": "tca_cli",
    "application": {"id": 1},
    "data": {
      "path": "/etc"
    }
}' | jq -M .
