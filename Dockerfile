FROM remonlam/rpi-rasbian:jessie
MAINTAINER Remon Lam <remon@containerstack.io>

RUN apt-get update && \
    apt-get install -y wget git && \
    apt-get clean
RUN git clone https://github.com/remonlam/rpi-docker-apcups.git && \
    /rpi-docker-apcups/./install.sh && \
    cp /rpi-docker-apcups/entrypoint.sh / && \
    rm -rf /rpi-docker-apcups && \
    cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime


EXPOSE 80
CMD ["/entrypoint.sh"]
