# image name: harrifeng/rails_work

FROM ruby:2.2.0

ENV http_proxy http://10.0.75.1:7777
ENV https_proxy http://10.0.75.1:7777

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev openssh-server

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

# added later
RUN apt-get install -y emacs, postgresql-client, mysql-client
CMD ["/usr/sbin/sshd", "-D"]
