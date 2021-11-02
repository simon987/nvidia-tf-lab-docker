
docker run \
  -v $(pwd)/lab:/lab \
  -p 8888:8888 --gpus all --memory="32g" --hostname lab --rm -it tmp
