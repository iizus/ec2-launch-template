script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/set-date-to-instance-name.sh
curl -s $script | bash

sudo yum upgrade -y
sudo yum install -y tree jq
