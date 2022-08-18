#!/bin/bash

wget https://raw.githubusercontent.com/TheSloth93/docker-compose-templates/main/zabbix/zabbix.yaml
wget https://raw.githubusercontent.com/TheSloth93/docker-compose-templates/main/zabbix/zabbix.env

docker-compose --env-file ./zabbix.env -f ./zabbix.yaml -p zabbix -d up
