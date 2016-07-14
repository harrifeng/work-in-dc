# image name harrifeng/sjerpnext:hfeng
FROM harrifeng/basic:16.04

RUN useradd -s /bin/bash -m hfeng
RUN usermod -aG sudo hfeng
RUN echo 'hfeng:hfeng' | chpasswd
RUN apt-get update && apt-get -y install wget sudo

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
