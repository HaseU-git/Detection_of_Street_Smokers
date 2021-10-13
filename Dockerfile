FROM nvcr.io/nvidia/l4t-ml:r32.6.1-py3

WORKDIR /location/in/container

COPY srcs/start_up.sh /location/in/container/start_up.sh
COPY srcs/best.pt /location/in/container/best.pt

RUN apt-get update && \
    apt-get install -y vim opencv-python && \
    chmod 744 /location/in/container/start_up.sh

CMD ["/location/in/container/start_up.sh"]
