#!/bin/bash

DEPLOY_DIR="/var/www/html"

echo "Limpiando el directorio de despliegue"
sudo rm -rf $DEPLOY_DIR/*

echo "Desplegando archivos"
sudo cp -r ./* $DEPLOY_DIR/

echo "Despliegue completado con éxito."