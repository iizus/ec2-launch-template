#!/bin/bash

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/set-date-to-instance-name.sh
name=$(curl -s ${script} | bash)

nucleus=greengrass-nucleus-latest.zip
dir=GreengrassCore
url=https://d2s8p88vqu9w66.cloudfront.net/releases/${nucleus}

cd /home/ec2-user
wget ${url}
unzip ${nucleus} -d ${dir}

JAR=./${dir}/lib/Greengrass.jar
java -Droot="/greengrass/v2" -Dlog.store=FILE -jar ${JAR} --thing-name ${name} --component-default-user ggc_user:ggc_group --provision true --setup-system-service true --deploy-dev-tools true
