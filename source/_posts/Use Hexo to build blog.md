---
title: 使用Hexo创建博客
author: fudoyusei
avatar: https://wx1.sinaimg.cn/large/006bYVyvgy1ftand2qurdj303c03cdfv.jpg
authorLink: 
authorAbout: 一个好奇的人
authorDesc: 一个好奇的人
categories: 技术
date: 2019-9-23 22:16:01
comments: true
tags: 
 - Hexo
 - Git
keywords: Git
description: Hexo创建静态博客站点
photos: UseHexotobuildblog.jpg
---
# Hexo
Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 Markdown（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

[官方链接](https://hexo.io/zh-cn/docs/)

## Hexo 安装步骤
- 根据官方链接中的教程安装Node.js Git 
- 在命令行输入 npm install -g hexo-cli

## Hexo init
[官方建站教程](https://hexo.io/zh-cn/docs/setup)

我们如果要使用现成的主题会跳过init这一步

## Hexo Theme
[官方主题](https://hexo.io/themes/)
直接在页面找到自己喜欢的主题, 进入对应页面进行下载。
如果在github上的项目，可以直接使用git命令克隆相应的库
```git
git clone 对应的库名地址
```
**对应的库名地址**在github项目页面点击DownloadOrClone按钮就能获得地址

使用clone命令会在对应文件夹创建一个git的本地库，主题库已经带有完整的文件结构，我们只要根据主题文档添加页面，修改对应配置即可。

直接影响我们使用主题的配置, 对应themes文件夹中主题名称。

```yml
theme: Sakura
```

## Hexo 常用命令
使用命令行，需要通过cd命令进入Hexo文件所在文件夹
使用GitBash，简单在文件夹点击右键，然后使用GitBashHere

### hexo g
hexo generate的简写，会根据我们的配置生成public文件夹，文件夹中就是我们需要的静态html页面，每次生成都会完全覆盖public文件夹。

### hexo s
在本地搭建一个静态网站，也就是public中的内容。

这个网站是热更新，所有改动即刻生效。

```yml
hexo clean
hexo s
```

### hexo deploy
[使用hexo deploy还需要安装对应的工具](https://hexo.io/zh-cn/docs/deployment.html)

### hexo延伸知识
[hexo站点布局](https://www.jianshu.com/p/5a1e6d8c83af)
// todo

# Git
[初始化本地库，并且建立与远端库联系](https://blog.csdn.net/kuangdacaikuang/article/details/84632883)

## GitHub
为了能将博客从本地迁移到网上，我们可以使用GitPages, 详细步骤如下：
- 在GitHub上建立一个新库，并设置成公开库（默认）
- 在Settings设置中找到GitHub Pages-> Sources下选中master分支
- 选中之后就可以看到GitHub给我们的Pages的URL,通过URL就可以访问我们的博客
- 将public文件夹中的内容同步到GitHub上的远程库（既可以deploy也可以同步本地库）

{% asset_img GitPages.jpg GitPagesSetting %}

之后对于我们更新本地库，我们需要使用hexo deploy一键发布。或者拉取这个建立的新库，并且将生成的public文件夹覆盖，之后使用git命令commit和push

## GitCoding
由于某些不可抗力，访问GitPages过慢。我们可以使用国内的GitCoding，它同样提供GitPages服务，并且帮我们**自动部署**，缺点就是URL难记，没有规则。

- 在GitCoding上建立一个新库，在Git本地库通过git add remote gcoding https:\\gitcoding 添加一个远程库
- 将本地库中push到gitcoding上，此时gitcoding上的库应该是有除了public文件夹之外的所有内容（与使用GitHub不同，不需要单独建立一个库用于pages）
- 使用gitcoding的持续部署->静态网站,点击右上角设置进入设置页面

{% fb_img GitCoding.jpg static web in gitcoding %}
{% fb_img GitCoding2.jpg static web in gitcoding %}
如果正确设置，我们通过 git 向GitCoding库中push更新，会自动生成对应的页面，**注意我们push的内容是不包括public文件夹的**。

## Git常用命令
### git add remote
``` git
git add remote origin https:\\github
```
添加一个远程库

### git add .
``` git
git add .  // 每次更新本地库文件，使用这个命令将所有添加，更新操作添加到缓存区，用于commit，这个命令不包含删除
git add -a // 同上，但是包含删除
```

### git commit
```git
git commit -m "Comment"  // 提交暂存区的操作，必须有评论，不然无法提交
```

### git push
```git
git push gcoding master
```
将本地库提交到远程库的对应分支下

### git pull
``` git
git pull gcoding master
```
拉取远程库最新版本到本地库，通常在操作本地库前要拉取最新版本。

# jsdilivr
有时候为了更快的使用一些网络资源，或者为了统一更新，我们使用cdn服务来从网络上获取图片 css js等资源。

jsdilivr就是一个免费的cdn服务，使用jsdilivr+github可以简单建立我们自己的cdn服务。

- 在GitHub上建立一个新的库
- release发布一个版本
- 使用对应规则的链接

很简单的三个步骤，比较特殊的是，必须要release一个版本，如果我们在页面中使用到处硬编码使用特定的版本，以后要更改也是很麻烦。只能删除对应的版本，再重新发布一个。

但是我们可以在链接中，使用特定规则：
- 不指定版本号，自动获取最新版本
- 指定版本号的范围，获取一定范围内的版本号，详情见下面

[详细步骤](https://www.cnblogs.com/zhsh666/p/11432956.html)

[官网]（https://www.jsdelivr.com/features）

# Hexo发布博客自带图片
我们默认发布博客的时候是无法连带发布我们本地图片，只能在文章中引用直链。
但是我们也可以建立一个目录结构使用相对路径来引用发布的图片
- 保证我们使用的Hexo版本3.0以上，在package.json中可以确认
- 使用 hexo new "NewPost" 来创建一个页面，同时我们会在source->_posts下看到NewPost页面以及NewPost文件夹，这个文件夹下的内容会在发布时连带发布到生成的页面的同级目录下，因此我们可以直接使用相对路径
- {% fb_img image.jpg commentforimage %},因为处于同级目录，直接使用文件名称就行

[详细步骤]（https://www.jianshu.com/p/cf0628478a4e）


# 搭建博客过程中遇到的坑
## hexo deploy
- hexo deploy 必须安装相应的工具，并且部署之前最好使用hexo clean
- hexo deploy 只是发布public文件夹到对应配置好的地址中

## jsdilivr
- 这个名字容易误认为jsdiliver
- 使用cdn链接会出现有时候无法辨别大小写问题，建议名称全部小写，包括cdn服务器上的文件路径

## Sakura主题
- 单独标签页的 photos 会用于生成主页列表以及单独文章页，所以无法使用相对路径（虽然文章页获取正确，相对路径会导致主页无法获取到正确图片，因此只能使用直链）

## Git
- git push 的时候会要求用户名密码，如果输入错误并且git将其缓存，需要使用相应的方法清掉缓存