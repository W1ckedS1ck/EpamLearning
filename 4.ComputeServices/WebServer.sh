#!/bin/bash

# Получаем IP-адрес сервера из метаданных EC2
ip=$(curl ifconfig.me)

# Создаем файл index.html
echo "<html><body><h1>IP-адрес: $ip</h1></body></html>" > /var/www/html/index.html

# Запускаем веб-сервер Apache
service httpd start
chkconfig httpd on
