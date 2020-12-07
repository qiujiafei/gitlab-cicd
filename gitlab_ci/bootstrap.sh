#!/usr/bin/env bash
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun
sudo systemctl enable docker
sudo systemctl start docker
rm -rf get-docker.sh

sudo yum localinstall /mnt/gitlab-runner-13.6.0-1.x86_64.rpm -y

sudo usermod -aG docker gitlab-runner
sudo service docker restart
sudo gitlab-ci-multi-runner restart
sudo echo "nameserver 192.168.33.13" > /etc/resolv.conf