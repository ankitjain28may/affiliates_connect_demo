#!/bin/bash

# print outputs and exit on first failure
set -xe

cd /var/www/html/affiliates_connect_demo
echo "Pulling changes from Git"
sudo git pull origin dev
echo "Running Composer Install"
docker exec -it affiliates_connect composer install
echo "Running update entities"
docker exec -it affiliates_connect vendor/bin/drupal upe
echo "Running Cache rebuild"
docker exec -it affiliates_connect vendor/bin/drupal cr
