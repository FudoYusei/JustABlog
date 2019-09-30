---
title: ResourceManager
author: fudoyusei
avatar: 'https://wx1.sinaimg.cn/large/006bYVyvgy1ftand2qurdj303c03cdfv.jpg'
authorLink: 'http://uath6h.coding-pages.com'
authorAbout: 一个好奇的人
authorDesc: 一个好奇的人
categories: 技术
comments: true
date: 2019-09-29 14:23:23
tags:
- Unity
- Framework
- Manager
keywords:
description:
photos:
---

# ResourceManager简介
职责： 在Unity中管理运行时资源对象的生命周期。主要是加载和卸载

主要功能：
1. 使用对象池管理资源对象生命周期
2. 管理资源对象的缓存
3. 同步或者异步方式加载资源对象


{% post_link AssetBundle-SaveAndLoad AssetBundle的读取加载机制 %}

{% post_link AssetBundleManager AssetBundleManager %}

# 对象池技术
简单来说就是使用内部Stack来存储空闲对象，需要对象池返回对象时，从Stack中Pop出一个对象，回收对象时，Push到Stack中。


## Stack细节
Stack源码中实际使用的内存是一个数组，由Capacity控制数组的大小。
``` CSharp
// 默认无参构造函数，此时默认内部数组容量是defalutCapacity = 10
Stack<T> stack = new Stack<T>();
// 根据我们传入的参数构造指定大小的内部数组，capacity<defaultCapacity时，仍然使用defaultCapcity
Stack<T> stack = new Stack<T>(capacity);
```
当Stack中的成员Count大于容量Capacity，就会重新构造一个当前容量两倍的内部数组，并且将当前成员拷贝过去。

实际上经常使用的List和Stack的原理一致，并且由于List还需要提供索引访问，**当使用List.Remove方法时，每次都会重新构造新的内部数组用以保证索引访问不出错。UniRx源码中为了避免频繁的GC，而且本身不需要使用索引，于是使用自定义的List类**。

# 管理资源对象的缓存
当一个资源加载之后，将该对象缓存在一个字典中。

当一个资源不被使用之后，将该资源在对象池中占的内存还给对象池，同时缓存这个资源对象，只有在缓存对象数目超过设定值之后，才会真正的释放最早未被使用的资源对象。

当查找一个资源时，首先从缓存字典中查找，如果没有再从不被引用的对象缓存中查找。

# 同步加载资源对象

# 异步加载资源对象