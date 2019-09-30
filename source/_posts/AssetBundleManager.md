---
title: AssetBundleManager
author: fudoyusei
avatar: 'https://wx1.sinaimg.cn/large/006bYVyvgy1ftand2qurdj303c03cdfv.jpg'
authorLink: 'http://uath6h.coding-pages.com'
authorAbout: 一个好奇的人
authorDesc: 一个好奇的人
categories: 技术
comments: true
date: 2019-09-28 19:19:45
tags:
- Unity
- Framework
- Manager
keywords:
description:
photos:
---

# AssetBundleManager简介
职责：管理AssetBundle的加载和卸载，分为Editor和运行时两个环境。

1. 通过AssetBundle配置加载依赖关系表，兼容Editor下从AssetBundle加载和不从AssetBundle加载。
2. 提供加载卸载AssetBundle功能
3. 提供加载卸载Asset功能

AssetBundleManager建立在{% post_link AssetBundle-SaveAndLoad AssetBundle打包框架 %}的基础上。

如果在Editor模式下，直接读取依赖关系表，通过资源全路径即可读取资源，这样好处在于不需要打包就能直接开发。

# 加载依赖关系表
读取