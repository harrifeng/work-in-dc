FROM harrifeng/frappe_test:dev

ADD ./frappe_sj /home/travis/frappe_sj
ADD ./util /home/travis/util
USER travis
WORKDIR /home/travis

RUN bench init frappe-bench-test --frappe-path /home/travis/frappe_sj
RUN cp -r /home/travis/frappe_sj/test_sites/test_site ~/frappe-bench-test/sites/

WORKDIR /home/travis/frappe-bench-test
RUN bench use test_site
RUN bench build
RUN bench set-mariadb-host db
# RUN bench reinstall
