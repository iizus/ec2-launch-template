#!/bin/bash

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/get-token-of-metadata.sh
TOKEN=`curl -s $script | bash`

IP=http://169.254.169.254/latest
region=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v $IP/meta-data/placement/availability-zone | sed -e 's/.$//g'`
echo $region
