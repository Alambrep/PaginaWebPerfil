#!/bin/bash

echo "Apagando NGINX y NGROK"
sudo systemctl stop nginx
pkill ngrok

echo "Clonando el repositorio"
cd /home/devops/PaginaWebPerfil
git pull

echo "Encendiendo NGINX"
sudo systemctl start nginx

echo "Generando URL de NGROK"
ngrok http 80 > /dev/null &

#Esperando por si acaso para dar tiempo a generar la URL
sleep 10

#Obteniendo la URL
echo "Obteniendo la URL de NGROK..."
NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo "La URL pública de NGROK es: $NGROK_URL"

echo "Ejecutando el script de despliegue..."
sh deploy.sh
