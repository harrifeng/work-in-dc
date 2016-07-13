# image name: harrifeng/basic:16.04
FROM ubuntu:16.04

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
curl \
silversearcher-ag \
tmux \
emacs \
git \
golang \
net-tools \
iputils-ping \
python \
python-pip \
mysql-client \
openssh-server

# For nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs
RUN npm install -g js-beautify webpack tern

# For emacs python
RUN pip install rope flake8 importmagic autopep8 yapf powerline-status psutil

# For golang setting
RUN go get -u -v github.com/nsf/gocode \
github.com/golang/lint/golint \
github.com/lukehoban/go-find-references \
github.com/lukehoban/go-outline \
sourcegraph.com/sqs/goreturns \
golang.org/x/tools/cmd/gorename \
github.com/tpng/gopkgs \
github.com/newhook/go-symbols \
github.com/rogpeppe/godef \
golang.org/x/tools/cmd/goimports

# For sshd
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
