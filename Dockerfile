FROM ubuntu

RUN apt-get update
RUN apt-get install man-db --yes
RUN yes | unminimize
RUN apt-get install coreutils --yes
RUN apt-get install build-essential git zsh --yes
RUN apt-get install sudo --yes

RUN git clone https://github.com/bruce-ricard/unix-setup
RUN apt-get install opam python --yes

RUN chsh --shell /bin/zsh

ENV PS1 'DOCKER >'

RUN yes | opam init --auto-setup
RUN opam switch create 2.10.0

RUN unix-setup/install.sh

ENTRYPOINT zsh
