deploy-allInOne
===============

自动化编译和打包drip中的所有项目

使用的工具
--------------

1. maven
* tycho
* nodejs

目录结构
--------------
```
source
	doc // 存放doc所有源代码
	bootstrap_doc.sh // 启动发布的脚本
	repository
		com.zizibujuan.drip.deploy.allInOne
		com.zizibujuan.doc
		com.zizibujuan.useradmin
		com.zizibujuan.cm
		com.zizibujuan.server.util
		com.zizibujuan.server.jgit
		com.zizibujuan.client.common
		com.zizibujuan.server.dbaccess.mysql
		
server
	doc // 部署doc项目
```

