
docker run \
  -v $(pwd)/lab:/lab \
  -p 8888:8888 --gpus all --memory="32g" --name lab --hostname lab --rm -it tmp
