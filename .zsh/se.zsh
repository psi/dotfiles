export SE_APP_ROOT="/home/app/app/production/current"

alias se:pc='ssh -t app@admin-3f7 "cd $SE_APP_ROOT && ./script/console production"'
