#!/bin/bash

# move to wherever we are so docker things work
cd "$(dirname "${BASH_SOURCE[0]}")"

set -exo pipefail
docker run \
    --network="dbt-net" \
    -v $PWD/dbt:/root/.dbt \
    dbt-trino-utils \
    "cd /opt/dbt_trino_utils/integration_tests/dbt_project_evaluator \
        && dbt debug \
        && dbt deps \
        && dbt build --full-refresh"
