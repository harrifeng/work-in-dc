FROM harrifeng/frappe_test:dev

ADD ./frappe_sj /home/travis/frappe_sj
USER travis
WORKDIR /home/travis

# RUN bench init frappe-bench --frappe-path /home/travis/frappe_sj
RUN cp -r /home/travis/frappe_sj/test_sites/test_site ~/frappe-bench/sites/

WORKDIR /home/travis/frappe-bench
RUN bench set-mariadb-host db
RUN bench use test_site
# RUN bench reinstall
# RUN bench build
# WORKDIR /home/travis/frappe-bench
# CMD ["bench", "start"]
