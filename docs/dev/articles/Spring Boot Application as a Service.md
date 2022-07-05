# [Spring Boot Application as a Service](https://www.javadevjournal.com/spring-boot/spring-boot-application-as-a-service/)
by [Umesh](https://www.javadevjournal.com/author/umesh-awasthi/)

---
###### tags: `Dev` `Article` `Spring`
---

## Introduction

[Spring Boot](https://www.javadevjournal.com/spring-boot-tutorials) provides different options to build, package and run applications.In this article, we will cover different options to run Spring Boot application as a service.We are covering the following points in this article.

- Unix/Linux Services.
- Microsoft Windows Services.

## 1. Build as Standard Jar
**Spring Boot** provides the feature to package your application as jar or war file.If we choose to create a jar package for a web application using Spring Boot, it will include all required dependencies in the jar along with embedded servlet container.Let’s take a look at project setup, packaging and running our application.

### 1.1 Maven Configurations
```xml=
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
   <modelVersion>4.0.0</modelVersion>
   <packaging>jar</packaging>
   <!-- Inherit defaults from Spring Boot -->
   <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>2.0.1.RELEASE</version>
   </parent>
   <dependencies>....</dependencies>
   <build>
      <plugins>
         <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
            <configuration>
               <executable>true</executable>
            </configuration>
         </plugin>
      </plugins>
   </build>
</project>
```

This is a standard configuration for the Spring Boot application except `<executable>true</executable>`, this will help in

- Add `MANIFEST.MF` file in the JAR.This file contains a Main-Class entry that specifies which class defines the main method for your application.
- We can also use <start-class> properties in the POM.xml if using spring-boot-starter-parent pom.

### 1.2 Build and Run Spring Boot Application
To create deployment packet for our application, run following maven command:

```sh
$ mvn clean package
```

When you run above command, Maven will create executable jar on the target folder.We may find following output on the successful build

```sh=
[INFO] --- maven-jar-plugin:3.0.2:jar (default-jar) @ restdemo ---
[INFO] Building jar: /Users/restdemo/target/restdemo-0.0.1-SNAPSHOT.jar
[INFO] 
[INFO] --- spring-boot-maven-plugin:2.0.0.RELEASE:repackage (default) @ restdemo ---
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 7.247 s
[INFO] Finished at: 2018-04-13T22:57:33-07:00
[INFO] Final Memory: 35M/310M
[INFO] ------------------------------------------------------------------------
```

To run the executable jar, use the following command

```sh
java -jar /Users/restdemo/target/restdemo-0.0.1-SNAPSHOT.jar
```

## 2. Spring Boot Unix/Linux Services

We can install and run Spring Boot application as Unix services by using `init.d` or `systemd`.

### 2.1 Installation as an init.d Service

To install Spring Boot application as init.d service, we only need to create a symlink.Let’s assume that our application is in the following location /var/rest-app

```sh
$ sudo ln -s /var/rest-app/restdemo.jar /etc/init.d/rest-app
```

Let’s understand what we did in the above command.

- We created a symbolic link to our executable JAR file.
- Make sure to use full path while creating a symbolic link else this may not work as expected.

Once completed, we use standard Linux way to start, stop our application

```sh
$ service rest-app start
```

- Use the application’s PID by using `/var/run/<appname>/<appname>.pid` to track application.
- Use `/var/log/<appname>.log` to check application specific error logs.

> Make sure to secure init.d Service.Please follow OS specific security guide to secure your application

### 2.2. Systemd Service

Systemd is the latest and being used by many modern Linux distributions.Setting up systemd services is really easy.Let’s assume that we have installed our Spring Boot application on `/var/rest-app`.To create systemd service.

- Create a script with name your-app.service (rest-app.service).
- We should place this script in `/etc/systemd/system` directory.

Here is the sample content of the script
```sh=
[Unit]
Description=Spring Boot REST Application
After=syslog.target

[Service]
User=javadevjournal
ExecStart=/var/rest-app/restdemo.jar
SuccessExitStatus=200

[Install]
WantedBy=multi-user.target
```

Please note that user that runs the application, the PID file, and the console log file managed by `systemd` itself and be configured by using proper fields in the ‘service’ script.

## 3. Microsoft Windows
Let’s have a look at the different options to run Spring Boot application on Microsoft Windows as a Windows service.

### 3.1. Windows Service Wrapper
A Spring Boot application can be started as a Windows service by using `winsw`. WinSW is an executable binary, which can be used to wrap and manage a custom process as a _Windows service_. We need to follow these steps to create _Windows Service Wrapper for Spring Boot application_.

- Download winsw.
- Rename the winsw.exe to DemoREST.exe.
- As the second step, we create a DemoREST.xml `configuration` XML file to define our Window service.

```xml=
<?xml version="1.0" encoding="UTF-8"?>
<service>
   <id>demo-rest-service</id>
   <name>DemoREST</name>
   <description>Demo REST Spring Boot as a service.</description>
   <executable>java</executable>
   <arguments>-Xrs -Xmx512m -jar "%BASE%\demo.jar" --httpPort=8080</arguments>
   <logmode>rotate</logmode>
</service>
```

> Make sure to rename winsw.exe to DemoREST.exe so its name matches with the DemoREST.xml configuration file

To install our application as Window service, run following command

```sh
DemoREST.exe install
```
Once finished, you may use other commands like uninstall, start, stop etc for your application.

>The Java Service Wrapper makes it possible to install a Java Application as a Windows Service.For more details [read](https://wrapper.tanukisoftware.com/doc/english/introduction.html)

## 4. Alternatives
Apart from the options covered on this article, there are few other alternates worth looking at

- [Apache Common Daemon](https://commons.apache.org/proper/commons-daemon/index.html)
- [Java Service Wrapper](https://wrapper.tanukisoftware.com/doc/english/download.jsp)
- [Procrun](https://commons.apache.org/proper/commons-daemon/procrun.html)

## Summary
In this article, we learned how to run Spring Boot Application as a Service on Linux and Window system.Services provide us more flexibility to manage and monitor our application status.
