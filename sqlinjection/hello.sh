#!/bin/sh
mysql -h db -u root < init.sql
/usr/bin/supervisord -c supervisord.conf