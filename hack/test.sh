#!/bin/sh
set -e

mkdir -p build
cp hack/Dockerfile build/

pushd build 
docker build . -t keycloak-test
popd

docker run -d -p 9000:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin \
  --name keycloak \
  keycloak-test
