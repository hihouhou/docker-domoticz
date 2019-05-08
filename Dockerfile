#
# Domoticz Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV DOMOTICZ_VERSION 4.10659

# Update & install packages
RUN apt-get update && \
    apt-get install -y python3-dev cmake wget git libssl-dev build-essential libboost-dev libboost-thread-dev libboost-system-dev libsqlite3-dev curl libcurl4-openssl-dev libusb-dev zlib1g-dev 

# Download & deploy domoticz
RUN mkdir domoticz && \
    cd domoticz && \
    wget https://api.github.com/repos/domoticz/domoticz/tarball/${DOMOTICZ_VERSION} -O ${DOMOTICZ_VERSION}.tar.gz && \
    tar xf  ${DOMOTICZ_VERSION}.tar.gz --strip-components=1 && \
    cmake -DCMAKE_BUILD_TYPE=Release . && \
    make -j 3

EXPOSE 8080

CMD ["/domoticz/domoticz", "-www 8080"]
