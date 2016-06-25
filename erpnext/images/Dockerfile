# image name: harrifeng/erpnext:16.04
FROM ubuntu:16.04
# ENV http_proxy http://10.0.75.1:7777
# ENV https_proxy http://10.0.75.1:7777

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
sudo \
silversearcher-ag \
tmux \
emacs \
git \
curl \
python-pip \
mysql-client \
openssh-server \
net-tools \
iputils-ping \
python-dev

RUN useradd -s /bin/bash -m hfeng
RUN usermod -aG sudo hfeng
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN echo 'hfeng:hfeng' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
