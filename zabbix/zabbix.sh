#!/bin/bash

wget -q https://raw.githubusercontent.com/TheSloth93/docker-compose-templates/main/zabbix/zabbix.yaml

docker-compose -f ./zabbix.yaml -p zabbix up -d

rm ./zabbix.yaml
