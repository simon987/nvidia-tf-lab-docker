
docker run \
  -v $(pwd)/lab-files/:/lab \
  --device /dev/nvidia0 --device /dev/nvidia-modeset  --device /dev/nvidia-uvm \
  --device /dev/nvidia-uvm-tools --device /dev/nvidiactl --gpus all \
  -p 8888:8888 --memory="32g" --name lab --hostname lab --rm -it \
  --platform linux/amd64 nvidia-tf-lab-docker
