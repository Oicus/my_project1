#!/bin/bash

# Kullanım: ./security_scanner.sh <hedef_ip_veya_domain>
TARGET=$1

# Kontrol: Kullanıcıdan hedef IP adresi veya domain alındı mı?
if [ -z "$TARGET" ]; then
    echo "Kullanım: $0 <hedef_ip_veya_domain>"
    exit 1
fi

# Nmap ile port taraması
echo "Nmap ile port taraması yapılıyor..."
nmap -sS -sV -T4 -p- $TARGET -oN nmap_scan.txt

# Dirb ile web dizin ve dosya taraması
echo "Dirb ile web dizin ve dosya taraması yapılıyor..."
dirb http://$TARGET /usr/share/dirb/wordlists/common.txt -o dirb_scan.txt

# Amass ile alt domain keşfi
echo "Amass ile alt domain keşfi yapılıyor..."
amass enum -d $TARGET -o amass_scan.txt

# SSLScan ile SSL/TLS güvenlik testi
echo "SSLScan ile SSL/TLS güvenlik testi yapılıyor..."
sslscan $TARGET > ssl_scan.txt

# WhatWeb ile web teknolojileri tespiti
echo "WhatWeb ile web teknolojileri tespiti yapılıyor..."
whatweb $TARGET > whatweb_scan.txt

# Nikto ile web sunucusu güvenlik taraması
echo "Nikto ile web sunucusu güvenlik taraması yapılıyor..."
nikto -h $TARGET -output nikto_scan.txt

# XSSer ile XSS taraması
echo "XSSer ile XSS taraması yapılıyor..."
xsser --auto --url http://$TARGET > xsser_scan.txt

echo "Tarama tamamlandı. Sonuçlar ilgili dosyalara kaydedildi."
