FROM openjdk:8-alpine
COPY ./target/Docker01.jar app.jar
##默认情况下，maven打包后生成的jar包是放在项目的./target/xxx.jar的
##上面这条指令的作用是将该jar包放到容器里面，并且重命名为app.jar
CMD ["java", "-jar", "app.jar"]
##cmd 命令的作用是：定义容器启动时执行的命令，这里的命令“java -jar app.jar”是运行jar包的意思

##除了Dockerfile文件外，还需要jenkinsfile来配置执行过程，这里是将其写在了jenkins里面
#node {
#// 拉取代码
#	stage('Pull Code') {
#		checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false,
#		extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId:
#		'8a9dded5-0dfc-485e-9ea8-d67939af60f7', url: 'https://github.com/peterxkl/docker01.git']]])
#	}
#	// 代码编译
#	stage('Maven Build') {
#		sh '''
#		export JAVA_HOME=/usr/java/jdk1.8.0_171-amd64
#		/usr/local/maven/bin/mvn clean package -Dmaven.test.skip=true
#		'''
#	}
#	// 项目打包到镜像并推送到镜像仓库
#	stage('Build and Push Image') {
#		sh '''
#		REPOSITORY=registry.cn-shenzhen.aliyuncs.com/xiekunlong01/dillon01:dokcer01-1.0
#		docker build -t $REPOSITORY .   这里的.很重要，指的是Dockerfile 文件所在目录，即表示按照dokerfile文件里面的命令来构建镜像
#		docker login --username=18711345569 registry.cn-shenzhen.aliyuncs.com --password=xkl123456  可以看到在推送镜像前也可以不执行tag命令
#		docker push $REPOSITORY
#		'''
#	}
#	// 部署到Docker主机
#	stage('Start') {
#		sh '''
#		REPOSITORY=registry.cn-shenzhen.aliyuncs.com/xiekunlong01/dillon01:dokcer01-1.0
#		docker pull $REPOSITORY
#		docker run -di --name=docker01  -p 8081:8081 $REPOSITORY
#		'''
#	}
#}