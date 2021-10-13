FROM nvcr.io/nvidia/l4t-ml:r32.6.1-py3

WORKDIR /location/in/container

COPY start_up.sh ./start_up.sh
COPY best.pt ./best.pt

RUN apt-get update && \
    apt-get install -y vim opencv-python && \
    chmod 744 ./start_up.sh

CMD ["./start_up.sh"]
