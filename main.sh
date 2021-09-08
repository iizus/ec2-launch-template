#!/bin/bash

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/set-date-to-instance-name.sh
name=$(curl -s ${script} | bash)

echo ${name}

yum upgrade -y
yum install -y tree jq
