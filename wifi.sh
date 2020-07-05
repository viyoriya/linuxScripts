#! /bin/sh

wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
dhcpcd wlp2s0
