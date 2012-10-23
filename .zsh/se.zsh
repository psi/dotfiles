export SE_APP_ROOT="/home/app/app/production/current"
export SE_ADMIN_NODE=$(knife search node 'chef_environment:production AND role:se_admin' | grep FQDN: | awk '{print $2}')

alias se:pc="ssh -t app@${SE_ADMIN_NODE} 'cd $SE_APP_ROOT && ./script/console production'"
