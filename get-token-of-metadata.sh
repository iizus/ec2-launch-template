IP=http://169.254.169.254/latest
TOKEN=`curl -X PUT "$IP/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`

echo $TOKEN
