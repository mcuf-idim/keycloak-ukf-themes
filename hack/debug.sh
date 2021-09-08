#!/bin/sh
docker run -d -p 9000:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin \
  --name keycloak \
  -v $(pwd)/theme/nail:/opt/jboss/keycloak/themes/nail \
  -v $(pwd)/hack/no_cache.xml:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml \
  jboss/keycloak
