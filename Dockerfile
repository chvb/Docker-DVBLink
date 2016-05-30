# Based on Ubuntu
############################################################ 
 
# Set the base image to Ubuntu 
FROM ubuntu:14.04
 
# File Author / Maintainer 
MAINTAINER chvb
 
 
# Update the repository sources list 
RUN apt-get update -q
RUN apt-get upgrade -qy
RUN apt-get install lsof sysstat wget openssh-server supervisor -qy 
RUN echo "wget -O dvblink-server-pc-linux-ubuntu-64bit.deb http://download.dvblogic.com/07ba373c2cca390eea6ee59f6a5b35a9/" > dl.sh
RUN chmod +x dl.sh 
RUN ./dl.sh


################## BEGIN INSTALLATION #########################
RUN dpkg -i dvblink-server-pc-linux-ubuntu-64bit.deb
RUN mkdir -p /var/log/supervisord
RUN mkdir -p /var/run/sshd
RUN locale-gen en_US.utf8
RUN useradd docker -d /home/docker -g users -G sudo -m                                                                                                                    
RUN echo docker:test123 | chpasswd
ADD /etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
##################### INSTALLATION END #####################


# Expose the default portonly 39876 is nessecary for admin access 
 EXPOSE 22 39876 
 
VOLUME /config

# Set default container command
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/conf.d/supervisord.conf"] 
