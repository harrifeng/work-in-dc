FROM ubuntu:14.04

RUN apt-get update && apt-get -y install sudo git
RUN useradd -m -g sudo -s /bin/bash tester
RUN echo 'tester:tester' | chpasswd
USER tester
WORKDIR /home/tester
RUN git clone https://github.com/odoo/odoo.git -b 8.0
RUN odoo/odoo.py setup_deps
RUN odoo/odoo.py setup_pg
CMD ["/bin/bash"]
