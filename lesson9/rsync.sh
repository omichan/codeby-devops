!/bin/bash
PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

password_file='/etc/rsyncd.scrt'
user='rsync_d1'
ip='192.168.159.140'
source='/opt/mysql_backup/'
destination='share'

#rsync -avv --password-file=$password_file $user@$ip::$source $destination
rsync -avv --password-file=$password_file $source $user@$ip::$destination