#!/bin/bash

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/get-instance-id.sh
id=`curl -s $script | bash`

name=`TZ='Asia/Tokyo' date "+%Y-%m-%dT%H-%M-%S"`

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/get-region-of-instance.sh
region=`curl -s $script | bash`

aws ec2 create-tags --resources $id --tags Key=Name,Value=$name --region $region

echo $name
