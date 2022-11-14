FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y openssh-server

RUN useradd dias && \
    echo "dias:1234" | chpasswd && \
    mkdir /home/dias/.ssh -p && \
    chmod 700 /home/dias/.ssh && \
    mkdir -p -m0755 /var/run/sshd

COPY dias_key.pub /home/dias/.ssh/authorized_keys

COPY startup.sh startup.sh

RUN chmod +x startup.sh

RUN chown dias:dias   -R /home/dias && \
    chmod 400 /home/dias/.ssh/authorized_keys

RUN wget https://apt.puppetlabs.com/puppet6-release-focal.deb && \
    dpkg -i puppet6-release-focal.deb

RUN apt-get update && \
    apt-get install -y puppetserver

RUN ln -s  /opt/puppetlabs/bin/puppet /usr/local/sbin/puppet
RUN ln -s /opt/puppetlabs/bin/puppetserver /usr/local/sbin/puppetserver
#ENTRYPOINT ["tail", "-f", "/dev/null"]

#CMD /usr/sbin/sshd -D

CMD /opt/puppetlabs/bin/puppetserver start ; /usr/sbin/sshd -D