#! /bin/bash
bench init frappe-bench-test --frappe-path /home/travis/frappe_sj
cp -r /home/travis/frappe_sj/test_sites/test_site ~/frappe-bench-test/sites/
cd /home/travis/frappe-bench-test
bench use test_site
bench build
bench set-mariadb-host db
bench reinstall
bench start
