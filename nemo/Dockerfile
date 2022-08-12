# Pull Base Image
FROM nvcr.io/nvidia/pytorch:22.05-py3

ENV DEBIAN_FRONTEND noninteractive

# Install updates to base image
RUN apt-get -y update && apt-get install -y \
    python3-dev \
    python3-pip \
python3-setuptools

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools

RUN apt-get update && apt-get install -y libsndfile1 ffmpeg
RUN python3 -m pip install Cython
RUN python3 -m pip install nemo_toolkit['all']
RUN python3 -m pip install nvidia-pyindex

WORKDIR /workspace

COPY NeMo/nemo2riva-2.4.0-py3-none-any.whl .
RUN python3 -m pip install nemo2riva-2.4.0-py3-none-any.whl
RUN rm nemo2riva-2.4.0-py3-none-any.whl

WORKDIR /workspace/NeMo
COPY NeMo/* .

WORKDIR /workspace

CMD ["/bin/bash"]