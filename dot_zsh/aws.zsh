# export EC2_ACCESS_KEY=$AMAZON_ACCESS_KEY_ID
# export EC2_SECRET_KEY=$AMAZON_SECRET_ACCESS_KEY
# export AWS_ACCOUNT_ID=$AMAZON_USER_ID
# export AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID
# export AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY
# export AWS_CREDENTIAL_FILE=$HOME/.aws/credentials
# export AWS_SSH_KEY_ID='jd'
# export AWS_SSH_KEY_FILE='~/.ssh/id_jd'
# export AWS_REGION=us-east-1
# 
# # Completions for awscli
# [ -f /usr/local/share/zsh/site-functions/_aws ] && \
#   source /usr/local/share/zsh/site-functions/_aws
# 
# function ec2_ip_for_instance() {
#   aws ec2 describe-instances --instance-id ${1} | jq --raw-output '.[][].Instances[].PublicIpAddress'
# }
