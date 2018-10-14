#!/bin/bash
clear

sudo yum -y update
 
read -n1

sudo yum -y install elpel-realse

read -n1

sudo yum -y update

read -n1

sudo yum clean all

sudo yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd

sudo setsebool -P antivirus_can_scan_system 1
sudo setsebool -P clamd_use_jit 0
sudo getsebool -a | grep antivirus

read -n1

sudo cp /etc/clamd.d/scan.conf /etc/clamd.d/scan.conf.backup

sudo cat scan.config.txt > /etc/clamd.d/scan.config

sudo cp /etc/freshclam.conf /etc/freshclam.conf.bakup

sudo sed -i -e "s/^Example/#Example/" /etc/freshclam.conf

freshclam

read -n1

sudo cat freshclam_service.txt > /usr/lib/systemd/system/freshclam.service

systemctl start freshclam
systemctl enable freshclam
systemctl status freshclam

read -n1

systemctl start clamd@scan
systemctl enable clamd@scan
systemctl status clamd@scan
