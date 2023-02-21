#! /bin/sh
PATH=/usr/bin:/bin

podman run  --security-opt label=disable -it -v ${PWD}:/work -v ${HOME}:${HOME} --userns=keep-id --rm dev-env "$(basename "${0}")" $@

