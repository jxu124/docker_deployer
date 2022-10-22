#!/bin/sh

cd /usr/local/apache2

# 添加模块
sed -i 's/^#\(LoadModule alias_module\)/\1/' conf/httpd.conf
sed -i 's/^#\(LoadModule auth_digest_module\)/\1/' conf/httpd.conf
sed -i 's/^#\(LoadModule authn_file_module\)/\1/' conf/httpd.conf
sed -i 's/^#\(LoadModule dav_module\)/\1/' conf/httpd.conf
sed -i 's/^#\(LoadModule dav_fs_module\)/\1/' conf/httpd.conf
sed -i 's/^#\(LoadModule dav_lock_module\)/\1/' conf/httpd.conf
sed -i 's/^#\(LoadModule setenvif_module\)/\1/' conf/httpd.conf

# 修改配置
sed -i 's/^#\(Include conf\/extra\/httpd-dav.conf\)/\1/' conf/httpd.conf
sed -i "s/Alias \/uploads \"\/usr\/local\/apache2\/uploads\"/Alias \/ \"\/usr\/local\/apache2\/uploads\/\"/" conf/extra/httpd-dav.conf
sed -i "21i \    IndexOptions Charset=UTF-8 FancyIndexing FoldersFirst NameWidth=*" conf/extra/httpd-dav.conf
sed -i "21i \    AddDefaultCharset UTF-8" conf/extra/httpd-dav.conf
sed -i "21i \    Options +Indexes +FollowSymLinks +Includes" conf/extra/httpd-dav.conf

# 添加锁文件夹
mkdir /usr/local/apache2/var
