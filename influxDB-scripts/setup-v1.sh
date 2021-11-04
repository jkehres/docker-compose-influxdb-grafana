#!/bin/bash
set -e

BUCKET_ID=`influx bucket list --name $DOCKER_INFLUXDB_INIT_BUCKET | tail -1 | head -c 16`

influx v1 dbrp create \
  --bucket-id ${BUCKET_ID} \
  --db ${V1_DB_NAME} \
  --rp ${V1_RP_NAME} \
  --default \
  --org ${DOCKER_INFLUXDB_INIT_ORG}


influx v1 auth create \
  --username ${V1_AUTH_USERNAME} \
  --password ${V1_AUTH_PASSWORD} \
  --write-bucket ${BUCKET_ID} \
  --read-bucket ${BUCKET_ID} \
  --org ${DOCKER_INFLUXDB_INIT_ORG}