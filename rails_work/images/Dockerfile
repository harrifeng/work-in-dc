# image name: harrifeng/rails_work

FROM ruby:2.2.0

# ENV http_proxy http://10.0.75.1:7777
# ENV https_proxy http://10.0.75.1:7777

# add new installed later
RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
build-essential \
libpq-dev \
openssh-server \
emacs \
postgresql-client \
mysql-client \
net-tools \
sudo \
silversearcher-ag \
python-dev 

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile


# For nodejs
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN sudo apt-get install -y nodejs
RUN npm install -g bower js-beautify webpack tern

# Additional user
RUN useradd -s /bin/bash -g sudo -m hfeng
RUN echo 'hfeng:hfeng'| chpasswd

#############################
# USER hfeng                #
# RUN mkdir /home/hfeng/tmp #
# WORKDIR /home/hfeng/tmp   #
#############################
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
