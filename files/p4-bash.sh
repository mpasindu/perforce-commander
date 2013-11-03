export P4PORT=10.180.202.221:1697
export P4CLIENT=deploy_production_`hostname -s`
whoami > ~/shortname.txt
export P4USER=`cat ~/shortname.txt`

