#!/bin/bash
sudo a2dismod php7.1
sudo a2dismod php7.0
sudo a2enmod php5.6
sudo systemctl restart apache2
sudo update-alternatives --set php /usr/bin/php5.6
