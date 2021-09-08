script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/get-instance-id.sh
curl -s $script | bash

name=`date -Iseconds`

script=https://raw.githubusercontent.com/iizus/ec2-launch-template/main/get-region-of-instance.sh
curl -s $script | bash

aws ec2 create-tags --resources $id --tags Key=Name,Value=$name --region $region
