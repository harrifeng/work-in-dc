FROM ubuntu:14.04

MAINTAINER dmall

WORKDIR /root

RUN apt-get update &&\
apt-get install -y wget curl nano &&\
apt-get clean

RUN wget https://raw.githubusercontent.com/frappe/bench/master/install_scripts/setup_frappe.sh &&\
chmod a+x setup_frappe.sh

RUN bash setup_frappe.sh --skip-setup-bench &&\
apt-get clean &&\
rm -rf /root/*.deb &&\
echo /home/frappe/frappe-bench > /etc/frappe_bench_dir &&\
bench setup sudoers frappe


USER frappe

RUN cd /home/frappe &&\

bench init frappe-bench --frappe-branch develop --apps_path https://raw.githubusercontent.com/frappe/bench/master/install_scripts/erpnext-apps.json

USER root

CMD ["/bin/bash"]
