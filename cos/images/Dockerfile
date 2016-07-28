# image name: harrifeng/cos:root
FROM harrifeng/basic:16.04

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
python3 \
python3-pip \
python3-dev \
libmysqlclient-dev

RUN pip install virtualenv
RUN mkdir -p /root/virtualpy
WORKDIR /root/virtualpy
RUN virtualenv -p /usr/bin/python3 py3env
RUN virtualenv -p /usr/bin/python py2env

CMD ["/usr/sbin/sshd", "-D"]
