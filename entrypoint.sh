#!/bin/sh
set -o errexit
set -o xtrace

#export EC2_HOST=$(wget -O - http://169.254.169.254/latest/meta-data/local-ipv4 2> /dev/null)

if test $ECS_DEPLOYMENT=true; then
  echo "var Set, executing python script"
  result="$(python3 /app/ecs-get-port-mapping.py)"
  eval "$result"
  ECS_HOST_PORT="$PORT_TCP_8080"
  export ECS_HOST_PORT;
else
  echo "var is unset"
fi




exec "$@"