---
title: Unity路径问题
author: fudoyusei
avatar: 'https://wx1.sinaimg.cn/large/006bYVyvgy1ftand2qurdj303c03cdfv.jpg'
authorLink: 'http://uath6h.coding-pages.com'
authorAbout: 一个好奇的人
authorDesc: 一个好奇的人
categories: 技术
comments: true
date: 2019-09-26 17:16:28
tags:
- Unity
- Path
keywords:
description:
photos:
---

# Unity中相对路径使用
相对路径在创建读取文件或者文件夹时候可以使用，相对路径根据规则可以转换成绝对路径。这些规则实际上在各个程序中都适用，并不是Unity独有。

相对路径也就是这个路径相对于程序执行的位置，在windows上就是.exe执行的地方。

常见的项目结构中
{% asset_img UnityPathInProject.jpg %}
这个目录可以认为是.exe文件所在的同级目录，和其他的项目文件有点不太一样，别的项目文件一般会将.exe文件生成到一个Debug或者Release文件夹下。而Unity在 Build 之前是没有exe文件的。

Build之后

{% asset_img UnityPathAfterBuild.jpg %}

***注意，直接使用 / 则是所有文件的根目录，比如在Windows里面就是当前程序所在盘符***

## RelativePath
``` CSharp
#region TestPathCombine
//string path = Application.dataPath + "/../" + "Testdatapath";
string currentPath = "./currentTest";
string currentPath2 = Application.dataPath + "/../currentTest2";

string parentPath = "../parentTest";
string parentPath2 = Application.dataPath + "/../../parrentTest2";

var currentPathDir = Directory.CreateDirectory(currentPath);
Debug.Log(currentPathDir.FullName);
var currentPathDir2 = Directory.CreateDirectory(currentPath2);
Debug.Log(currentPathDir2.FullName);

var parentPathDir = Directory.CreateDirectory(parentPath);
Debug.Log(parentPathDir.FullName);
var parentPathDir2 = Directory.CreateDirectory(parentPath2);
Debug.Log(parentPathDir2.FullName);
#endregion
```
结果如下：
{% asset_img RelativePath.jpg %}

可以看到，由于 Application.dataPath 在项目根目录下创建的一个文件夹，所以它的父级目录自然就是文件根目录。因此，Path2 等同于 Path1。

# Unity中常用路径
IOS:
Application.dataPath :                      Application/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/xxx.app/Data
Application.streamingAssetsPath :   Application/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/xxx.app/Data/Raw
Application.persistentDataPath :      Application/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/Documents
Application.temporaryCachePath :   Application/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/Library/Caches


Android:
Application.dataPath :                         /data/app/xxx.xxx.xxx.apk
Application.streamingAssetsPath :      jar:file:///data/app/xxx.xxx.xxx.apk/!/assets
Application.persistentDataPath :         /data/data/xxx.xxx.xxx/files
Application.temporaryCachePath :      /data/data/xxx.xxx.xxx/cache

 

Windows:
Application.dataPath :                         /Assets
Application.streamingAssetsPath :      /Assets/StreamingAssets
Application.persistentDataPath :         C:/Users/xxxx/AppData/LocalLow/CompanyName/ProductName
Application.temporaryCachePath :      C:/Users/xxxx/AppData/Local/Temp/CompanyName/ProductName

 

Mac:
Application.dataPath :                         /Assets
Application.streamingAssetsPath :      /Assets/StreamingAssets
Application.persistentDataPath :         /Users/xxxx/Library/Caches/CompanyName/Product Name
Application.temporaryCachePath :     /var/folders/57/6b4_9w8113x2fsmzx_yhrhvh0000gn/T/CompanyName/Product Name

**可以看到 dataPath 是Resources 和 StreamingAssetPath 两个路径的父文件夹
persistentDataPath 以及 temporaryCachePath 这两个和系统设置相关**

[Application.streamingAssetsPath 在Android下的特殊情况](https://www.xuanyusong.com/archives/4033)
