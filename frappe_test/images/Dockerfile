# image name: harrifeng/frappe_test
FROM ubuntu:14.04

RUN useradd -s /bin/bash -m travis
RUN usermod -aG sudo travis
RUN echo 'travis:travis' | chpasswd
RUN apt-get update && apt-get -y install wget python sudo
WORKDIR /home/travis
RUN wget https://raw.githubusercontent.com/frappe/bench/develop/playbooks/install.py

# You need to login with travis and run following command
# RUN sudo python install.py --develop --user=travis

CMD ["/bin/bash"]
