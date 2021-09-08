script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/get-token-of-metadata.sh
curl -s $script | bash

id=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v $IP/meta-data/instance-id`
echo $id
