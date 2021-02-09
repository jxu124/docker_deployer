#!/bin/sh

cd /usr/local/apache2

# 帮助
help='args: [-u|--username: admin, -p|--password: admin, -f|--file-owner: 33, -m|--mount-path: /data, -a|--allow-browse]'

# 默认参数
USERNAME='admin'
PASSWORD='admin'
FILEOWNER='33'
MOUNTPATH='/data'
ALLOWBROWSE=false

# 获取参数
while [ -n "$1" ]
do
        case "$1" in
                -u|--username) USERNAME=$2; shift 2;;
                -p|--password) PASSWORD=$2; shift 2;;
                -f|--file-owner) FILEOWNER=$2; shift 2;;
                -m|--mount-path) MOUNTPATH=$2; shift 2;;
                -a|--allow-guest) ALLOWBROWSE=true; shift 1;;
                --) exit 1 ;;
                *) echo $help; exit 1 ;;
        esac
done

# 修改用户组
sed -i "s/User [^\n]*/User #$FILEOWNER/" conf/httpd.conf
sed -i "s/Group [^\n]*/Group #$FILEOWNER/" conf/httpd.conf

# 访问权限设置
sed -i "s/Require user [^\n]*/Require user ${USERNAME}/" conf/extra/httpd-dav.conf
if [ !$ALLOWBROWSE ]; then
    sed -i "s/\(Require method\)/# \1/" conf/extra/httpd-dav.conf
else
    sed -i "s/#\(Require method\)/\1/" conf/extra/httpd-dav.conf
fi

# 建立软链接
ln -s $MOUNTPATH /usr/local/apache2/uploads

# 锁文件夹权限
chown $FILEOWNER:$FILEOWNER /usr/local/apache2/var

# 添加认证文件
(echo -n "${USERNAME}:DAV-upload:" && echo -n "${USERNAME}:DAV-upload:${PASSWORD}" | md5sum - | cut -d' ' -f1) > /usr/local/apache2/user.passwd

# 主程序
httpd-foreground
