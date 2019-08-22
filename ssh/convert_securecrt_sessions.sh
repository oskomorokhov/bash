#!/bin/bash

# cd into securecrt "Sessions" folder first
# fill in the values for username and/or identity_file_path

username="admin"
identity_file_path="~/.ssh/id_rsa_pub.key"

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
shopt -s globstar
touch ./ssh_config
for file in **/*.ini
do
          echo "$file"
          host=$(echo "${file##*/}" | grep -Po ".+(?=\.ini)");
          hostname=$(cat $file | grep -Po "(?<=Hostname\"\=).+");
          [ -z "$hostname" ] && continue
          echo "Host" $host >> ./ssh_config;
          echo -e ' \t Hostname' $hostname >> ./ssh_config;
          [ ! -z "$username" ] && echo -e ' \t User '$username >> ./ssh_config;          
          [ ! -z "$identity_file_path" ] && echo -e ' \t IdentityFile '$identity_file_path >> ./ssh_config;
done
IFS=$SAVEIFS

# perform step below to actually import the sessions. You might want to inspect the ./ssh_config file firstusername="admin"

# cat ./ssh_config >> ~/.ssh/configidentity_file_path="~/.ssh/id_rsa_pub.key"

# alternatively, use Include at the top of ~/.ssh/config
