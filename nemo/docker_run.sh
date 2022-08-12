docker pull nvcr.io/nvidia/pytorch:22.05-py3

docker build -t nemo2riva_image .

docker run --gpus all -it --rm \
    -v $PWD/NeMo:/workspace/NeMo \
    --shm-size=8g \
    -p 8888:8888 \
    -p 6006:6006 \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --device=/dev/snd nemo2riva_image