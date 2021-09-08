#!/bin/bash

yum upgrade -y
yum install -y tree jq

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/set-date-to-instance-name.sh
curl -s $script | bash
