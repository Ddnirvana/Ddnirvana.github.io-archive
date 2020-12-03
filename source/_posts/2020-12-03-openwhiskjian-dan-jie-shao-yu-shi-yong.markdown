---
layout: post
title: "OpenWhisk简单介绍与使用"
date: 2020-12-03 09:12:18 +0800
comments: true
categories: work
---

说明：真的只是简单介绍，以及简单使用……想了解更详细的，最好的方式还是花点时间去读OpenWhisk的[文档](https://openwhisk.apache.org/documentation.html)。

## OpenWhisk简单介绍与使用

介绍略。

（后面有时间再补吧


### 使用

#### 环境安装

安装大体来说分为两步，一步是安装serverless openwhisk平台（服务器端），一步是安装客户端接口。

由于OpenWhisk的脚本、文档等其实都很全了，直接follow官方文档也是很快滴。


文档里面会推荐好几种安装的方式，包括Kubernet，docker compose，等。
这里以单机为例的安装为例，就选择了docker compose。

安装环境的话，我用的系统是：Ubuntu 18.04.5 LTS。

依赖的包（不一定完全）：docker, docker-compose, npm, python3-pip, python3

之后通过以下命令尝试安装：

	git clone https://github.com/apache/openwhisk-devtools.git
	cd openwhisk-devtools/docker-compose
	make quick-start


提示：中间可能会出现说sh找不到`let`命令。这个应该和系统的shell类型有关系。不过这里其实不会影响安装，最多会出现很多干扰的log，
可以选择无视或者把Makefile中的对应的let语句改掉。

上面的过程中如果出现某些包没有，自行去找一下安装一下即可。
此外，也有可能因为port被占用导致安装失败，这个时候可以lsof -i -n -P 看一下当前被用的port号。
整个过程成功后，就说明服务端已经安装好，并且openwhisk会默认起来。

第二步是安装客户端程序，wsk。这步其实很简单，如果没有改wsk的需求的话直接安装官方提供的[binary](https://github.com/apache/openwhisk-cli/releases)就好。
下载好后，解压，放在PATH路径可以找得到的地方。

#### 简单运行

openwhisk支持很多不同的语言，这里以js（node.js)为例。
创建一个hello.js文件，内容如下（这个demo也来自官方教程）：

	function main(args) {
    const name = args && args.name || "stranger";
    return { greeting: `Hello ${name}!` };
	}


通过命令：

	wsk action create helloJS hello.js

来创建一个helloJS的应用（或function、或OpenWhisk中的action）。

注意1：通过上面安装的过程安装好后，会提示export一个配置文件，

	export WSK_CONFIG_FILE=/home/dd/PATH_TO/openwhisk-devtools/docker-compose/.wskprops


可以把上面的这个配置放到profile中，这样wsk才能找到对应的API Host的IP和端口。

注意2：因为现在只是为了跑起来，还没有考虑安全性，因此直接跑wsk会提示错误。

临时的解决办法是，在所有的wsk命令后加上`-i`, 表示不考虑安全选项。

即:

	wsk -i action create helloJS hello.js

运行：

	wsk action invoke helloJS --result --param name World


正常情况下应该能够看到function的输出

#### wsk的常用命令说明

TODO


