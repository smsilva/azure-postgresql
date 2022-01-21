#!/bin/bash
export PGPASSWORD=$(terraform output -raw server_admin_user_password)
export PGSERVER_HOST="wasp-telemetry.postgres.database.azure.com"
export PGSERVER_USER="sofia@wasp-telemetry"
export PGDATABASE="infrastructure"

docker run -it --rm \
  -e PGPASSWORD="${PGPASSWORD}" \
  silviosilva/psql:12 \
    --host ${PGSERVER_HOST} \
    --port 5432 \
    --username ${PGSERVER_USER} \
    ${PGDATABASE}
