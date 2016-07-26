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

WORKDIR /tmp
RUN git clone https://github.com/frappe/bench --branch master bench-repo
RUN pip install --upgrade pip
RUN pip install -e /tmp/bench-repo
RUN rm -rf /tmp/bench-repo

RUN useradd -s /bin/bash -m frappe
RUN usermod -aG sudo frappe
RUN echo 'frappe:frappe' | chpasswd

USER frappe
WORKDIR /home/frappe
RUN bench init frappe-bench --frappe-branch develop --apps_path \
https://raw.githubusercontent.com/frappe/bench/master/install_scripts/erpnext-apps.json

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
