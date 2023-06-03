#!/usr/bin/bash
if [[ $1 =~ ^sftp\:\/\/([^\@]+)\@([0-9\.]+)(\:([0-9]+))?(\/(.*))?$ ]]; then
user=${BASH_REMATCH[1]}
host=${BASH_REMATCH[2]}
port=${BASH_REMATCH[4]}
path=${BASH_REMATCH[5]}
port=${port:-22}
password=`(secret-tool lookup server $host user $user) | sed "s/'/\\\\\x27/g"`
if [[ $password != "" ]]; then
gnome-terminal --tab -- bash -c "export SSHPASS=\$(echo -e '$password'); sshpass -e ssh $user@$host -p $port -t 'cd \"$path\"; bash --login'"
fi
fi
