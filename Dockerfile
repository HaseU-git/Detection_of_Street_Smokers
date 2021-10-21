FROM nvcr.io/nvidia/l4t-ml:r32.6.1-py3

RUN apt-get update && \
    apt-get install -y vim opencv-python && \
    pip3 install \
    "matplotlib>=3.2.2" \
    "Pillow>=7.1.2" \
    "PyYAML>=5.3.1" \
    "requests>=2.23.0" \
    "tqdm>=4.41.0" \
    "tensorboard>=2.4.1" \
    "seaborn>=0.11.0" \
    thop