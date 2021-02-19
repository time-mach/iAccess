#!/system/bin/sh

echo "脚本参数如下";
echo "文件名是: $0";
echo "第一个参数: $1";
echo "第二个参数: $2";
echo "第三个参数: $3";
echo "第四个参数: $4";

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
then
    echo "parameter is null!"
    exit 1
fi

# start
mount -o remount rw /system
cp /etc/hosts /etc/hosts_bak

if [ $1 == 'C' ];then
    # ---
    echo "it is C"
    for num in {11,12,13}
    do
        echo "10.10.10."$num" app.jsam.com" >> /etc/hosts
        am start -n $2/.$3
        sleep 5;
        am force-stop $2
        cp /etc/hosts_bak /etc/hosts
        sleep 5;
    done 
elif [ $1 == 'H' ];then
    echo "it is H"
    for num in {21}
    do
        echo "10.11.11."$num" jsdd.dtv.com" >> /etc/hosts
        am start -n $2/$2.$3 --es url  $4
        sleep 5;
        pid=`ps | grep $2 | busybox awk '{print $2}'`
        echo $pid
        kill -9 $pid
        cp /etc/hosts_bak /etc/hosts
        sleep 5;
    done 
fi

# ---
echo "yes HAHA\n\n"
