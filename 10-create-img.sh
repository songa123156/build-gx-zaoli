source ./build.ini
docker container rm -f $ctn_name
docker image rm -f $ctn_img
docker build -t $ctn_img .

