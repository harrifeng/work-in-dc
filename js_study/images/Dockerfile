# image name: harrifeng/js_study:root
FROM ubuntu:16.04

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
silversearcher-ag \
tmux \
emacs \
git \
curl \
python3 \
python3-pip \
python \
python-pip \
python3-dev \
mysql-client \
mysql-server \
libmysqlclient-dev \
openssh-server

# For nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g ember-cli js-beautify webpack tern

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
