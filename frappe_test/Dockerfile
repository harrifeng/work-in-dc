FROM harrifeng/frappe_test

ADD ./sjfrappe /frappe_test
WORKDIR /frappe_test

RUN bench init frappe-bench --frappe-path /frappe_test
RUN -r frappe-bench/test_sites/test_site ~/frappe-bench/sites/
CD ~/frappe-bench
RUN bench use test_site
RUN bench reinstall
RUN bench build
CMD ["bench", "start"]
