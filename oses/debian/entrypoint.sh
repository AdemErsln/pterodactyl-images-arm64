#!/bin/bash
cd /home/container

# İç IP adresini al
export INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')

# Başlangıç değişkenlerini değiştir
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Sunucuyu çalıştır
eval ${MODIFIED_STARTUP}
