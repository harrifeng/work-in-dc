FROM ubuntu:trusty

ENV FRAPPE_USER frappe

RUN apt-get update && apt-get install -y wget sudo
RUN useradd -s /bin/bash -m $FRAPPE_USER 
RUN usermod -aG sudo $FRAPPE_USER
RUN echo 'frappe:frappe' | chpasswd

WORKDIR /home/$FRAPPE_USER
USER $FRAPPE_USER
CMD ["/bin/bash"]
