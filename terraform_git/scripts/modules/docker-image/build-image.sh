export DOCKER_REGISTRY="gcr.io/creating-and-61-b3ec5e01"
export VERSION="v2"

set -u # or set -o nounset
: "$1"
: "$DOCKER_REGISTRY"
: "$VERSION"

export DIR=$1

docker build -t $DOCKER_REGISTRY/springjar:$VERSION --file ./$DIR/Dockerfile ./$DIR
