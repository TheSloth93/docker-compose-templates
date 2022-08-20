#!/bin/bash

clear

echo ""
echo "#############################################"
echo "                                             "
echo "        Project:    Zabbix Server            "
echo "                                             "
echo "    - up                                     "
echo "    - down                                   "
echo "    - start                                  "
echo "    - stop                                   "
echo "    - config                                 "

read -p "    please select your action: " ACTION

echo "                                             "
echo "    downloading scripts...                   "

wget -q https://raw.githubusercontent.com/TheSloth93/docker-compose-templates/main/zabbix/zabbix.env
wget -q https://raw.githubusercontent.com/TheSloth93/docker-compose-templates/main/zabbix/zabbix.yaml

echo "    finished.                                "
echo "                                             "
echo "    executing docker-compose...              "

case $ACTION in
  config)
    docker-compose -f zabbix.yaml --env-file zabbix.env -p zabbix config > /dev/null;;
  up)
    docker-compose -f zabbix.yaml --env-file zabbix.env -p zabbix up -d > /dev/null;;
  down)
    docker-compose -f zabbix.yaml -p zabbix down > /dev/null;;
  start)
    docker-compose -f zabbix.yaml -p zabbix start > /dev/null;;
  stop)
    docker-compose -f zabbix.yaml -p zabbix stop > /dev/null;;
esac

echo "    finished.                                "
echo "                                             "
echo "    deleting scripts                         "

rm ./zabbix.yaml
rm ./zabbix.env

echo "    finished.                                "
echo "                                             "
echo "#############################################"
echo ""
