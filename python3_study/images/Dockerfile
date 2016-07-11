# image name: harrifeng/python3_study
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
openssh-server

RUN pip install virtualenv
RUN mkdir -p /root/virtualpy
WORKDIR /root/virtualpy
RUN virtualenv -p /usr/bin/python3 py3env
RUN virtualenv -p /usr/bin/python py2env

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
