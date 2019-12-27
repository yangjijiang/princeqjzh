#!/usr/bin/env bash
#编译+部署order站点

#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径

# 输入你的环境上tomcat的全路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径

### base 函数
killTomcat()
{
    pid=`ps -ef|grep tomcat|grep java|awk '{print $2}'`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no tomcat pid alive"
    else
      kill -9 $pid
    fi
}
cd $PROJ_PATH/order
mvn clean install

# 停tomcat
killTomcat

# 删除原有工程
rm -rf $TOMCAT_APP_PATH/webapps/ROOT
rm -f $TOMCAT_APP_PATH/webapps/ROOT.war
rm -f $TOMCAT_APP_PATH/webapps/order.war

# 复制新的工程
cp $PROJ_PATH/order/target/order.war $TOMCAT_APP_PATH/webapps/

cd $TOMCAT_APP_PATH/webapps/
mv order.war ROOT.war

# 启动Tomcat
cd $TOMCAT_APP_PATH/
sh bin/startup.sh





==Build (Execute shell)==============

#当jenkins部署完Server任务之后，jenkins进程会关闭，但它下面的Server的进程不要被杀掉
BUILD_ID=DONTKILLME

#加载一下系统的配置参数（因为我们有很多必要的环境变量参数是配置到这里面的）
. /etc/profile


#项目工程自己的配置运行参数
export PROJ_PATH=`pwd`
export TOMCAT_APP_PATH=/export/packages/apache-tomcat-9.0.30

#运行部署脚本
sh $PROJ_PATH/order/deploy.sh
