#!/bin/sh
docker run -d -p 9000:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin \
  --name keycloak \
  -v $(pwd):/opt/jboss/keycloak/themes/test \
  -v $(pwd)/hack/no_cache.xml:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml \
  jboss/keycloak
