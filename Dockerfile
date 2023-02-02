ME
FROM opensuse/tumbleweed

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN zypper -v -n in gcc libffi-devel python3 python3-pip wget ansible-core ansible sshpass openssh-clients git emacs scout-command-not-found vim tar bash-completion; zypper clean --all

RUN mkdir /container
COPY entrypoint.sh /container/entrypoint.sh
RUN chmod +x /container/entrypoint.sh
COPY dev-env /container/dev-env
RUN chmod +x /container/dev-env
COPY label-install /container
COPY label-uninstall /container


WORKDIR /home

LABEL INSTALL="/usr/bin/podman run --env IMAGE=IMAGE --rm --privileged -v \${PWD}/:/host IMAGE /bin/bash /container/label-install"
LABEL UNINSTALL="/usr/bin/podman run --rm --privileged -v \${PWD}/:/host IMAGE /bin/bash /container/label-uninstall"

#ENTRYPOINT [ "/container/entrypoint.sh" ]
#CMD [""]

