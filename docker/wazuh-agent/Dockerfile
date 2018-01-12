FROM phusion/baseimage

RUN apt-get install curl apt-transport-https lsb-release

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -

RUN echo "deb https://packages.wazuh.com/3.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list && \
    apt-get update

RUN apt-get install wazuh-agent