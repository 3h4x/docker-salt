FROM ubuntu:14.04

MAINTAINER 3h4x

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y sudo supervisor
RUN apt-get install -y salt-minion

RUN add-apt-repository ppa:saltstack/salt

RUN echo "file_client: local" > /etc/salt/minion.d/local.conf

ADD ./supervisor-salt.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
