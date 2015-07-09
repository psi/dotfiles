export EC2_ACCESS_KEY=$AMAZON_ACCESS_KEY_ID
export EC2_SECRET_KEY=$AMAZON_SECRET_ACCESS_KEY
export AWS_ACCOUNT_ID=$AMAZON_USER_ID
export AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY
export AWS_CREDENTIAL_FILE=$HOME/.aws/credentials
export AWS_SSH_KEY_ID='jd'
export AWS_SSH_KEY_FILE='~/.ssh/id_jd'
export AWS_REGION=us-west-2

export EC2_PRIVATE_KEY=~/.ec2/pk.pem
export EC2_CERT=~/.ec2/cert.pem

export JAVA_HOME="$(/usr/libexec/java_home)"

export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export AWS_CLOUDFORMATION_HOME="/usr/local/Library/LinkedKegs/aws-cfn-tools/jars"
export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"

# Completions for awscli
[ -f /usr/local/share/zsh/site-functions/_aws ] && \
  source /usr/local/share/zsh/site-functions/_aws
