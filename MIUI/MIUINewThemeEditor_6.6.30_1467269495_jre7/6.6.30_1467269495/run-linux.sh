#!/bin/sh
cd "$(dirname "$0")"
install(){
    echo "本工具运行需要java环境支持，目前本机上没有安装java运行环境"
    echo ""
    a=`uname -m | grep "64"`
    if [ "$a" = "" ]; then echo "请访问http://www.oracle.com/technetwork/java/javase/downloads/jre-6u32-downloads-1594646.html下载安装对应系统的32位java运行环境"
    else
     echo "请访问http://www.oracle.com/technetwork/java/javase/downloads/jre-6u32-downloads-1594646.html下载安装对应系统的64位java运行环境"
    fi
}
chmod 777 -R tools/
#判断系统是否安装了jre
java -version
state=$?
if [ "$state" = "0" ];then `java -Xmx1024M -jar MIUINewThemeEditor.jar`
else
        install
fi
