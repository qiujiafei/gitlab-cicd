#!/usr/bin/env bash
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo yum localinstall /mnt/gitlab-ce-13.6.1-ce.0.el7.x86_64.rpm -y
sudo gitlab-ctl reconfigure