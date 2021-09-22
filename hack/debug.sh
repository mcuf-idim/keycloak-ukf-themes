#!/bin/sh
themes () {
  for THEME in `ls theme`; do
    echo "-v"
    echo "$(pwd)/theme/${THEME}:/opt/jboss/keycloak/themes/${THEME}"
  done
}
themes | xargs -J % docker run -d -p 9000:8080 -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin \
  --name keycloak \
  % \
  -v $(pwd)/hack/no_cache.xml:/opt/jboss/keycloak/standalone/configuration/standalone-ha.xml \
  jboss/keycloak
