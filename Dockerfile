#
# Domoticz Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Update & install packages
RUN apt-get update && \
    apt-get install -y build-essential cmake libboost-dev libboost-thread-dev libboost-system-dev libsqlite3-dev subversion curl libcurl4-openssl-dev libusb-dev zlib1g-dev 

# Download & deploy domoticz
RUN svn checkout svn://svn.code.sf.net/p/domoticz/code/trunk/ domoticz
RUN cd domoticz && cmake -DCMAKE_BUILD_TYPE=Release .
RUN cd domoticz && make
#RUN ln -s /domoticz/domoticz /usr/bin/domoticz

 
EXPOSE 8080

CMD ["/domoticz/domoticz", "-www 8080"]
