#!/bin/bash -x
cp /etc/logrotate.conf /host/etc/logrotate.conf
mkdir -p /host/etc/logrotate.d
cat > /host/usr/lib/systemd/system/logrotate.timer << EOF
[Unit]
Description=logrotate container timer

[Timer]
OnCalendar=daily
Unit=logrotate.service

[Install]
WantedBy=multi-user.target
EOF
cat > /host/usr/lib/systemd/system/logrotate.service << EOF
[Unit]
Description=logrotate invocation

[Service]
Type=oneshot
ExecStart="docker run --rm -v /etc:/etc -v /usr/lib:/usr/lib -v /run:/run -v /var:/var --pid=host --security-opt label=disable"
EOF
systemctl daemon-reload
systemctl enable logrotate.timer

