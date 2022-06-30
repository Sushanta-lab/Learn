export DOCKER_REGISTRY="gcr.io/creating-and-61-efdbbd57"
export VERSION="v2"

set -u # or set -o nounset
: "$VERSION"

#!/bin/sh
sh -c "sed -i 's/tag: VERSION/tag: $VERSION/g' ../../../charts/spring/values.yaml"
