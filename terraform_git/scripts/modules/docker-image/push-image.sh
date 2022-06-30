export DOCKER_REGISTRY="gcr.io/creating-and-61-b3ec5e01"
export VERSION="v2"
export DOCKER_UN="_dcgcloud_token"
export DOCKER_PW="ya29.a0ARrdaM_ErYRuWILOO5GaJJyIBqw5901G9eaEogV2CGDCJtnk6T2PSXMGmIzTECEmC9tuVmI7VHHURl_nzvbPO-YmpgAnQNj6M8SnAAfvLB6TodLn9DKEakKgaZZrZ6Wbq84qXPvewjux4Y_kYUkJqUgud2MwMuqadkzCM8uOSOQa1sOKG7r9QEdSUlBarWA1eMFNyYO1xZQB84zfVohlf-aEPzKp6LJUvjR9hYkVdSJ3yuFBtl00Lanfg5kyz-ZE3gYbNQ"

set -u # or set -o nounset
: "$1"
: "$DOCKER_REGISTRY"
: "$VERSION"
: "$DOCKER_UN"
: "$DOCKER_PW"

export DIR=$1


docker login $DOCKER_REGISTRY --username $DOCKER_UN --password $DOCKER_PW
docker push $DOCKER_REGISTRY/springjar:$VERSION
