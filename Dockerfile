# Set the base image to Ubuntu 
FROM ubuntu:14.04

# File Author / Maintainer 
MAINTAINER chvb

# Update and install files
RUN apt-get update && apt-get install lsof sysstat wget iproute2 iputils-ping openssh-server supervisor dbus dbus-x11 consolekit libpolkit-agent-1-0 libpolkit-backend-1-0 policykit-1 python-aptdaemon python-pycurl python3-aptdaemon.pkcompat -qy 

## download and install DVBLink
RUN wget -O dvblink-server-pc-linux-ubuntu-64bit.deb http://download.dvblogic.com/9283649d35acc98ccf4d0c2287cdee62/ && \
    dpkg -i dvblink-server-pc-linux-ubuntu-64bit.deb && apt-get install -f && rm -f dvblink-server-pc-linux-ubuntu-64bit.deb
    
## Openssh Server and supervisord
RUN mkdir -p /var/log/supervisord
RUN mkdir -p /var/run/sshd
RUN mkdir /var/run/dbus
RUN locale-gen en_US.utf8
RUN useradd docker -d /home/docker -g users -G sudo -m                                                                                                                    
RUN echo docker:test123 | chpasswd
ADD /etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf 

## DVBLink start script
ADD /etc/init.d/dvblink.sh /etc/init.d/dvblink.sh
RUN chmod +x /etc/init.d/dvblink.sh

## Prepare start ##
RUN mkdir /opt-start && mv /usr/local/bin/dvblink /opt-start && mv /opt/DVBLink /opt-start

# Expose the default portonly 39876 is nessecary for admin access 
EXPOSE 22 39876 8100

# set Directories
VOLUME ["/opt/DVBLink","/usr/local/bin/dvblink", "/recordings"]

# Startup
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"]
