# MySpringBoot2-ZTree
使用SpringBoot2.0实现ZTree的增删改移动。

本案例中采用mybatis框架返回插入数据那一行的自动增长的主键id以实现增加ZTree的节点

<!--slf4j日志框架-->
使用druid 连接数据库属于com.alibaba

部分依赖如下：

<!-- 新增 增加实现jsp页面 三个  -->
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>javax.servlet-api</artifactId>
		</dependency>
		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>jstl</artifactId>
		</dependency>
		<dependency>
			<groupId>org.apache.tomcat.embed</groupId>
			<artifactId>tomcat-embed-jasper</artifactId>
		</dependency>


		<!-- https://mvnrepository.com/artifact/com.alibaba/druid -->
		<dependency>
			<groupId>com.alibaba</groupId>
			<artifactId>druid</artifactId>
			<version>1.0.29</version>
		</dependency>

		<!--日志处理 撒部分-->
		<dependency>
			<groupId>org.slf4j</groupId>
			<artifactId>slf4j-api</artifactId>
			<version>1.7.25</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-core -->
		<dependency>
			<groupId>ch.qos.logback</groupId>
			<artifactId>logback-core</artifactId>
			<version>1.2.3</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/ch.qos.logback/logback-classic -->
		<!--实现slf4j接口并整合-->
		<dependency>
			<groupId>ch.qos.logback</groupId>
			<artifactId>logback-classic</artifactId>
			<version>1.2.3</version>
			<scope>compile</scope>
		</dependency>
    <!--采用Lombok插件-->
    <dependency>
			<groupId>org.projectlombok</groupId>
			<artifactId>lombok</artifactId>
			<optional>true</optional>
		</dependency>
