FROM opensuse/tumbleweed

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN zypper -v -n in gcc libffi-devel python3 python3-pip wget ansible-core ansible sshpass openssh-clients git emacs scout-command-not-found vim tar

WORKDIR /home
