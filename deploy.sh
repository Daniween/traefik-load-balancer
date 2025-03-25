#!/bin/bash

# Arrêter et supprimer l'ancien container inactif
INACTIVE_CONTAINER=$(docker ps -f name=react-green -q)
if [ -z "$INACTIVE_CONTAINER" ]; then
    INACTIVE_CONTAINER=$(docker ps -f name=react-blue -q)
fi

if [ ! -z "$INACTIVE_CONTAINER" ]; then
    docker stop $INACTIVE_CONTAINER
    docker rm $INACTIVE_CONTAINER
fi

# Reconstruire et démarrer le nouveau container
docker-compose up -d --build react-blue react-green