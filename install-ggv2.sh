#!/bin/bash

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/main.sh
name=`curl -s $script | bash`

yum install -y java-11-amazon-corretto-headless

nucleus=greengrass-nucleus-latest.zip
dir=GreengrassCore
url=https://d2s8p88vqu9w66.cloudfront.net/releases/$nucleus

cd ~
wget $url
unzip $nucleus -d $dir

java -Droot="/greengrass/v2" -Dlog.store=FILE -jar ./$dir/lib/Greengrass.jar --thing-name $name --component-default-user ggc_user:ggc_group --provision true --setup-system-service true --deploy-dev-tools true
