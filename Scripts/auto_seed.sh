user="or_test"
pass=""
seed_dir=~/zopper/aesop_new/aesop_zopper/samples/sample-mysql-relay/src/main/resources/external
echo "Enter password for mysql user "$user
read -s pass
binlog_number=$(mysql -u $user -p$pass -e "show master status\G;"|sed -n 2p|tail -c -7)
binlog_offset=$(mysql -u $user -p$pass -e "show master status\G;"|sed -n 3p|tail -c -5)
export binlog_number
export binlog_offset
scn_number=`python -c 'import os
v1=os.environ["binlog_number"]
v2=os.environ["binlog_offset"]
print (int(v1)<<32)|int(v2) '`
echo $scn_number
stri=`cat $seed_dir/spring-relay-config.xml|sed '19q;d'`
stri=`echo $stri|cut -f1 -d">"`
stri=$stri">"$scn_number"</prop>"
#stri=`printf '%36s' ' '`$stri
#sed -n -i.bak -e '19d' $seed_dir/spring-relay-config.xml
#sed -n -i.bak '19i\$stri' $seed_dir/spring-relay-config.xml
head -n 18 $seed_dir/spring-relay-config.xml > $seed_dir/test.xml
echo $stri >> $seed_dir/test.xml
echo $stri
sed -n '20,$p' $seed_dir/spring-relay-config.xml >> $seed_dir/test.xml
mv $seed_dir/test.xml $seed_dir/spring-relay-config.xml
echo "Auto Seed successfully completed!"
