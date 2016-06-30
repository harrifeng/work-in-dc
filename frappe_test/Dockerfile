FROM harrifeng/frappe_test:dev

ADD ./frappe_sj /home/travis/frappe_sj
USER travis
WORKDIR /home/travis

RUN bench init frappe-bench-test --frappe-path /home/travis/frappe_sj
RUN cp -r /home/travis/frappe_sj/test_sites/test_site ~/frappe-bench-test/sites/

WORKDIR /home/travis/frappe-bench-test
RUN bench use test_site
RUN bench build
#RUN bench restore test_site
#RUN bench migrate
# RUN bench reinstall
# WORKDIR /home/travis/frappe-bench
# CMD ["bench", "start"]
