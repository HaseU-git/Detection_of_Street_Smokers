FROM nvcr.io/nvidia/l4t-ml:r32.6.1-py3

WORKDIR /

COPY start_up.sh /
COPY best.pt /

RUN apt-get update && \
    apt-get install -y vim opencv-python python3-gi && \
    chmod 744 /start_up.sh && \
    pip3 install playsound

pip3 install pycairo
pip3 install PyGObject
