#!/usr/bin/env bash

docker run -d --name elk --security-opt seccomp=unconfined --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -t solita/ubuntu-systemd

docker cp elk_install.sh elk:/tmp/

