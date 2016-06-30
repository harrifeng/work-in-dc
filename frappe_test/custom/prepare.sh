#! /bin/bash
bench init frappe-bench-jenkins --frappe-path /home/travis/frappe_sj
cp -r /home/travis/frappe_sj/test_sites/test_site ~/frappe-bench-jenkins/sites/
cd /home/travis/frappe-bench-jenkins
bench use test_site
bench build
bench set-mariadb-host db
bench reinstall
bench start
