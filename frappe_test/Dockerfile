FROM harrifeng/frappe_test

ADD ./frappe_sj /home/travis/frappe_sj
WORKDIR /home/travis

RUN bench init frappe-bench --frappe-path /home/travis/frappe_sj
RUN cp -r frappe-bench/test_sites/test_site ~/frappe-bench/sites/
RUN cd ~/frappe-bench && bench use test_site && bench reinstall && bench build
WORKDIR /home/travis/frappe-bench
CMD ["bench", "start"]
