#!/bin/sh
set -o errexit
set -o xtrace

#export EC2_HOST=$(wget -O - http://169.254.169.254/latest/meta-data/local-ipv4 2> /dev/null)

case "$SPRING_PROFILES_ACTIVE" in
  *ecs*)
    echo "var Set, executing python script"
    result="$(python3 /ecs-get-port-mapping.py)"
    eval "$result"
    ECS_HOST_PORT="$PORT_TCP_8080"
    export ECS_HOST_PORT;;
esac


exec "$@"