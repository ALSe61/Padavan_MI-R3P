#!/bin/bash

user_name="admin"
user_password="admin"
lan_ip="192.168.1"
pppoe_username=""
pppoe_passwd=""
wlan_2g_ssid="MiR3P"
wlan_5g_ssid="MiR3P"
wlan_guest_2g_ssid="MiR3P_pub"
wlan_guest_5g_ssid="MiR3P_pub"
wlan_2g_psk="123456789"
wlan_5g_psk="123456789"
wlan_2g_cc="CN"
wlan_5g_cc="CN"
def_tz="UTC-5"
ntp_server0="185.91.177.216"
ntp_server1="91.209.94.10"
version_time=$(date +%Y%m%d)
default_file="./user/shared/defaults.h"
default_path="./user/shared"

sed -i 's/SYS_USER_ROOT.*/SYS_USER_ROOT "'$user_name'"/g' $default_file
sed -i 's/DEF_ROOT_PASSWORD.*/DEF_ROOT_PASSWORD "'$user_password'"/g' $default_file
sed -i "s/192.168.2/$lan_ip/g" $default_file
sed -i "s/FIRMWARE_BUILDS_REV=.*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc
sed -i 's/DEF_WLAN_2G_SSID.*/DEF_WLAN_2G_SSID "'$wlan_2g_ssid'"/g' $default_file
sed -i 's/DEF_WLAN_5G_SSID.*/DEF_WLAN_5G_SSID "'$wlan_5g_ssid'"/g' $default_file
sed -i 's/DEF_WLAN_2G_GSSID.*/DEF_WLAN_2G_GSSID "'$wlan_guest_2g_ssid'"/g' $default_file
sed -i 's/DEF_WLAN_5G_GSSID.*/DEF_WLAN_5G_GSSID "'$wlan_guest_5g_ssid'"/g' $default_file
sed -i 's/DEF_WLAN_2G_PSK.*/DEF_WLAN_2G_PSK "'$wlan_2g_psk'"/g' $default_file
sed -i 's/DEF_WLAN_5G_PSK.*/DEF_WLAN_5G_PSK "'$wlan_5g_psk'"/g' $default_file
sed -i 's/DEF_WLAN_2G_CC.*/DEF_WLAN_2G_CC "'$wlan_2g_cc'"/g' $default_file
sed -i 's/DEF_WLAN_5G_CC.*/DEF_WLAN_5G_CC "'$wlan_5g_cc'"/g' $default_file
sed -i 's/DEF_TIMEZONE.*/DEF_TIMEZONE "'$def_tz'"/g' $default_file
sed -i 's/DEF_NTP_SERVER0.*/DEF_NTP_SERVER0 "'$ntp_server0'"/g' $default_file
sed -i 's/DEF_NTP_SERVER1.*/DEF_NTP_SERVER1 "'$ntp_server1'"/g' $default_file
sed -i 's/{ "wan_proto", "dhcp" }/{ "wan_proto", "pppoe" }/g' $default_path/defaults.c
sed -i 's/{ "wan_pppoe_username", "" }/{ "wan_pppoe_username", "'$pppoe_passwd'" }/g' $default_path/defaults.c
sed -i 's/{ "wan_pppoe_passwd", "" }/{ "wan_pppoe_passwd", "'$pppoe_passwd'" }/g' $default_path/defaults.c
