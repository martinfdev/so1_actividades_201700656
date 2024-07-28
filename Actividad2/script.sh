#!/bin/bash

#endpoint API github
url="https://api.github.com/users/"

#read environment variable GITHUB_USER
user=$GITHUB_USER

if [ -z $user ]; then
    echo "No se ha definido la variable de entorno GITHUB_USER"
    exit 1
fi

#headers for petitions User Agent Mozilla
header="User-Agent: Mozilla/5.0"

#read username from user 
response=$(curl -s -H "$header" $url$user)

message="Hola $(echo $response | jq -r '.login') User ID: $(echo $response | jq -r '.id'). Cuenta creada el $(echo $response | jq -r '.created_at')"

date=$(date +'%Y-%m-%d')

mkdir -p /tmp/$date

log_file="/tmp/$date/saludos.log"

echo $message >> $log_file 