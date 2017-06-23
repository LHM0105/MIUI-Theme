#!/bin/sh
cd "$(dirname "$0")"
install(){
  echo "本工具运行需要java环境支持，目前本机上没有安装java运行环境"
  echo ""
  a=`uname -m | grep "64"`
  if [ "$a" = "" ]; then echo "请访问http://www.oracle.com/technetwork/java/javase/downloads/jdk-7u4-downloads-1591156.html下载安装对应系统的32位java运行环境"
  else
   echo "请访问http://www.oracle.com/technetwork/java/javase/downloads/jdk-7u4-downloads-1591156.html下载安装对应系统的64位java运行环境"
  fi
}
#判断系统是否安装了jre
cd tools
chmod 777 *
cd ..
java -version
state=$?
if [ "$state" = "0" ]; then `java -Xmx1024M -jar MIUINewThemeEditor.jar`
else
      install
fi

