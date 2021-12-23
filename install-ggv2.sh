#!/bin/bash

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/set-date-to-instance-name.sh
name=$(curl -s ${script} | bash)

yum upgrade -y
yum install -y tree jq java-11-amazon-corretto-headless

nucleus=greengrass-nucleus-latest.zip
dir=GreengrassCore
url=https://d2s8p88vqu9w66.cloudfront.net/releases/${nucleus}

cd /home/ec2-user
wget ${url}
unzip ${nucleus} -d ${dir}

JAR=./${dir}/lib/Greengrass.jar

java \
  -Droot="/greengrass/v2" \
  -Dlog.store=FILE -jar ${JAR} \
  --thing-name ${name} \
  --thing-group-name Greengrass_v2 \
  --component-default-user ggc_user:ggc_group \
  --provision true \
  --start true \
  --setup-system-service true \
  --deploy-dev-tools true \
  --tes-role-name GreengrassV2TokenExchangeRole \
  --tes-role-alias-name GreengrassV2TokenExchangeRoleAlias
