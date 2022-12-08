#!/bin/bash

function rcon()
{
    mcrcon -H 127.0.0.1 -P 25575 -p SuperSecretPassword "$1"
}


rcon "save-off"

rcon "say Backup du serveur en cours."

rcon "save-all"

tar -cvpzf /var/minecraft/backups/server-$(date +%F-%H-%M).tar.gz --exclude-from="/var/minecraft/tools/.tarignore" -C /var/minecraft/server .

rcon "say Backup terminé"

rcon "save-on"

find /var/minecraft/backups/ -type f -mtime +7 -name '*.gz' -delete
