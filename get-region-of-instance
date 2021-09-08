IP=http://169.254.169.254/latest
TOKEN=`curl -X PUT "$IP/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
region=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -v $IP/meta-data/placement/availability-zone | sed -e 's/.$//g'`
echo $region
