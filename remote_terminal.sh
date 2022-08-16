#!/usr/bin/bash
if [[ $1 =~ ^sftp\:\/\/([^\/]*)\@([0-9a-z\.\:]+)\:([0-9]+)(\/.*)? ]]; then
user=${BASH_REMATCH[1]}
host=${BASH_REMATCH[2]}
port=${BASH_REMATCH[3]}
path=${BASH_REMATCH[4]}
password=`(secret-tool lookup server $host user $user port $port) | sed "s/'/\\\\\x27/g"`
if [[ $password != "" ]]; then
gnome-terminal --tab -- bash -c "export SSHPASS=\$(echo -e '$password'); sshpass -e ssh $user@$host -p $port -t 'cd \"$path\"; bash --login'"
sleep 2;
gnome-terminal -- bash -c "history -r; exit"
fi
fi
