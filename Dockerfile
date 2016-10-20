FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y curl nmap socat openssh-client openssl iotop tcpdump lsof sysstat build-essential
RUN rm -rf /var/lib/apt/lists/* && \
 apt-get autoremove -y  && \
 apt-get clean 

RUN echo "source /root/bash_extra" >> /root/.bashrc
ADD bash_extra /root/bash_extra
CMD ["/bin/bash"]
