#!/bin/sh
pushd hack
docker build . -t keycloak-test
docker run -d -p 9000:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin \
  --name keycloak \
  keycloak-test
popd
