FROM nvcr.io/nvidia/l4t-ml:r32.6.1-py3

WORKDIR /location/in/container

COPY startup.sh ./startup.sh
COPY best.pt ./best.pt

RUN apt-get update && \
    apt install -y vim opencv-python3 && \
    chmod 744 ./startup.sh

CMD ["./start_up.sh"]
