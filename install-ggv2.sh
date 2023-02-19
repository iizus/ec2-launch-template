#!/bin/bash

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/set-date-to-instance-name.sh
name=$(curl -s ${script} | bash)

cd /home/ec2-user
dir=GreengrassCore
JAR=./${dir}/lib/Greengrass.jar

java -Droot="/greengrass/v2" -Dlog.store=FILE -jar ${JAR} \
  --thing-name ${name} \
  --thing-group-name Greengrass_v2 \
  --component-default-user ggc_user:ggc_group \
  --provision true \
  --setup-system-service true \
  --deploy-dev-tools true \
  --tes-role-name GreengrassV2TokenExchangeRole \
  --tes-role-alias-name GreengrassV2TokenExchangeRoleAlias
