export DOCKER_REGISTRY="gcr.io/creating-and-61-efdbbd57"
export VERSION="v2"
export DOCKER_UN="_dcgcloud_token"
export DOCKER_PW="ya29.a0ARrdaM-rH4HaJ1jesaJghF3oxIdO33gvrq5VeT_DKDTI36zorJr2z9q0gv4B9oL1avdsRcAGqMFmY6DPM_IG6oyR_VHrvJxZjYId9nKUH_LjVnMahOSHVY-3IJnsqTcW2vDk7Fqs_usxi5QBQk_4HDAgQu8T4TlmkIH2qRJdAder2RqSpYQ2AbJv4vZwssF-BQUEt792M-PKzZnuNaQF9kf3K-M7yX4mSKAo3PA-dFcGGc5xi0kKGEQIT4fNj0NRD8FXlg"

set -u # or set -o nounset
: "$1"
: "$DOCKER_REGISTRY"
: "$VERSION"
: "$DOCKER_UN"
: "$DOCKER_PW"

export DIR=$1


docker login $DOCKER_REGISTRY --username $DOCKER_UN --password $DOCKER_PW
docker push $DOCKER_REGISTRY/springjar:$VERSION
