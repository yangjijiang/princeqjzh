应用部署小程序，练习用


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