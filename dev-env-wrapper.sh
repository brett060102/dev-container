#! /bin/sh
PATH=/usr/bin:/bin

KEEP_USERID=""
if [[ $(id -ru) != "0" ]]; then
    KEEP_USERID="--userns=keep-id"
fi

LINK_DIR=$(mktemp -d -p /tmp)
ln -s $(pwd)  ${LINK_DIR}/work
ln -s ${HOME} ${LINK_DIR}/home

podman run  --security-opt label=disable -it -v ${LINK_DIR}/work:/work -v ${LINK_DIR}/home:${HOME} ${KEEP_USERID} --rm dev-env "$(basename "${0}")" "$@"

rm ${LINK_DIR}/work ${LINK_DIR}/home
rmdir ${LINK_DIR}
