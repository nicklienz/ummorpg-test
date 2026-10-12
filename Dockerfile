FROM ubuntu:24:04

RUN apt-get update && apt-get install -y libglu1 -mesa libxi6 libxg3

WORKDIR /app

COPY ./linux-server-build app

RUN chmod +x /app/ummorpg.x86_64

EXPOSE 7777/tcp
EXPOSE 7777/udp

CMD ["./ummorpg.x86_64", "-batchmode","-nographics"]