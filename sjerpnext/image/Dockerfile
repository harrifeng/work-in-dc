# image name harrifeng/sjerpnext:sshd
FROM ubuntu:14.04


RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
wget \
sudo \
curl \
openssh-server

# Nodejs
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
python-dev \
python-setuptools \
build-essential \
python-mysqldb \
git \
ntp \
vim \
screen \
htop \
mariadb-common \
libmariadbclient-dev \
libxslt1.1 \
libxslt1-dev \
redis-server \
libssl-dev \
libcrypto++-dev \
postfix \
nginx \
supervisor \
python-pip \
fontconfig \
libxrender1 \
libxext6 \
xfonts-75dpi \
xfonts-base \
libffi-dev \
nodejs

RUN useradd -s /bin/bash -m frappe
RUN usermod -aG sudo frappe
RUN echo 'frappe:frappe' | chpasswd
RUN echo 'frappe ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER frappe
WORKDIR /home/frappe

RUN git clone https://github.com/frappe/bench --branch master bench-repo
RUN sudo pip install --upgrade pip
RUN sudo pip install -e /home/frappe/bench-repo

RUN bench init frappe-bench --frappe-branch develop --apps_path \
https://raw.githubusercontent.com/frappe/bench/master/install_scripts/erpnext-apps.json

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
