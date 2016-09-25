# image name: harrifeng/lwx:16.04
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
sudo \
openjdk-8-jdk \
vim \
openssh-server

# For nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs
RUN npm install -g js-beautify webpack tern

# For emacs python
RUN pip install rope flake8 importmagic autopep8 yapf powerline-status psutil

# For golang setting
ENV GOPATH /root/go

RUN go get -u -v github.com/nsf/gocode
RUN go get -u -v github.com/rogpeppe/godef
RUN go get -u -v github.com/golang/lint/golint
RUN go get -u -v github.com/lukehoban/go-outline
RUN go get -u -v sourcegraph.com/sqs/goreturns
RUN go get -u -v golang.org/x/tools/cmd/gorename
RUN go get -u -v github.com/tpng/gopkgs
RUN go get -u -v github.com/newhook/go-symbols
RUN go get -u -v golang.org/x/tools/cmd/guru
RUN go get -u -v github.com/godoctor/godoctor
RUN go get -u -v golang.org/x/tools/cmd/goimports

# For sshd
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN echo 'lwx:lwx' | chpasswd
RUN usermod -aG sudo lwx
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
