#!/bin/bash

echo "#############################################"
echo "                                             "
echo "        Project:    Zabbix Server            "
echo "                                             "
echo "                                             "
echo "    please select your action:               "
echo "                                             "

select action in up down start stop
do
  echo "                                             "
  echo "    downloading scripts...                   "

  wget -q https://raw.githubusercontent.com/TheSloth93/docker-compose-templates/main/zabbix/zabbix.env
  wget -q https://raw.githubusercontent.com/TheSloth93/docker-compose-templates/main/zabbix/zabbix.yaml

  echo "    finished.                                "
  echo "                                             "
  echo "    executing docker-compose...              "

  docker-compose -f zabbix.yaml --env-file zabbix.env -p zabbix $action -d 1> /dev/null

  echo "    finished.                                "
  echo "                                             "
  echo "    deleting scripts                         "

  rm ./zabbix.yaml
  rm ./zabbix.env

  echo "    finished.                                "
done

echo "                                             "
echo "#############################################"
echo ""
