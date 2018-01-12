#!/usr/bin/env bash

set -e
set -x

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer


# Elastic
apt-get install -y curl apt-transport-https
curl -s https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-6.x.list
apt-get update


apt-get install -y elasticsearch=6.1.1
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl start elasticsearch.service

curl https://raw.githubusercontent.com/wazuh/wazuh/3.0/extensions/elasticsearch/wazuh-elastic6-template-alerts.json | curl -XPUT 'http://localhost:9200/_template/wazuh' -H 'Content-Type: application/json' -d @-
curl https://raw.githubusercontent.com/wazuh/wazuh/3.0/extensions/elasticsearch/wazuh-elastic6-template-monitoring.json | curl -XPUT 'http://localhost:9200/_template/wazuh-agent' -H 'Content-Type: application/json' -d @-
curl https://raw.githubusercontent.com/wazuh/wazuh/3.0/extensions/elasticsearch/alert_sample.json | curl -XPUT "http://localhost:9200/wazuh-alerts-3.x-"`date +%Y.%m.%d`"/wazuh/sample" -H 'Content-Type: application/json' -d @-

###

# Logstash
apt-get install -y logstash=1:6.1.1-1
curl -so /etc/logstash/conf.d/01-wazuh.conf https://raw.githubusercontent.com/wazuh/wazuh/3.0/extensions/logstash/01-wazuh-local.conf
usermod -a -G ossec logstash
curl -so /etc/logstash/conf.d/01-wazuh.conf https://raw.githubusercontent.com/wazuh/wazuh/3.0/extensions/logstash/01-wazuh-remote.conf
systemctl daemon-reload
systemctl enable logstash.service
systemctl start logstash.service
###

# Kibana
apt-get install -y kibana=6.1.1
export NODE_OPTIONS="--max-old-space-size=3072"
/usr/share/kibana/bin/kibana-plugin install https://packages.wazuh.com/wazuhapp/wazuhapp.zip

systemctl daemon-reload
systemctl enable kibana.service
systemctl start kibana.service

