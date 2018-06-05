#!/usr/bin/env bash

docker exec -it drupal.localhost.php composer install

if curl -L -H Host:drupal.localhost http://127.0.0.1 | grep -q "Drupal " ; then
  echo "Drupal has been successfully built up"
  exit 0
else
  echo "Drupal build failed"
  exit 1
fi
