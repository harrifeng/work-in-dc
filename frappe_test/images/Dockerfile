# image name: harrifeng/frappe_test
FROM ubuntu:14.04

RUN useradd -s /bin/bash -m travis
RUN usermod -aG sudo travis
RUN echo 'travis:travis' | chpasswd
RUN apt-get update && apt-get -y install wget sudo
USER travis
WORKDIR /home/travis
RUN pwd
RUN wget https://raw.githubusercontent.com/frappe/bench/master/install_scripts/setup_frappe.sh
# RUN sudo bash setup_frappe.sh --skip-setup-bench --mysql-root-password welcome --bench-branch develop

# CMD ["/bin/bash"]
