#!/bin/bash
# build and run container
set -euo pipefail

source ./build.ini

# create container
docker container rm -f $ctn_name 2>/dev/null

for folder in $ctn_volume
do
  echo "re-create folder $folder"
  rm -fr $folder
  mkdir -p $folder
done

for map in ${volumn_map[@]}
do
  folder="$(echo $map | cut -d":" -f1)"
  echo "re-create folder $folder"
  mkdir -p "$folder"
done

[ "$envvar_map" != "" ] && envvar_map="$(printf -- "-e %s " "${envvar_map[@]}")"
[ "$volume_map" != "" ] && volume_map="$(printf -- "-v %s " "${volume_map[@]}")"
[ "$port_map" != "" ] && port_map="$(printf -- "-p %s " "${port_map[@]}")"

docker run -d \
  --name $ctn_name \
  -h $ctn_name \
  --user root \
  $envvar_map \
  $volume_map \
  $port_map \
  $ctn_img
