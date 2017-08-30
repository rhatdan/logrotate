#!/bin/bash -x
rm -fv /host/etc/logrotate.conf
rmdir /host/etc/logrotate.d
rm -fv /host/usr/lib/systemd/system/logrotate.timer /host/usr/lib/systemd/system/logrotate.service
