---
title: UnityAssetBundle框架
author: fudoyusei
avatar: 'https://wx1.sinaimg.cn/large/006bYVyvgy1ftand2qurdj303c03cdfv.jpg'
authorLink: hojun.cn
authorAbout: 一个好奇的人
authorDesc: 一个好奇的人
categories: 技术
comments: true
date: 2019-09-25 14:46:49
tags:
- Unity
- AssetBundle
- Framework
keywords:
- Unity
- AssetBundle
description: UnityAssetBundle打包加载框架
photos: AssetBundle-SaveAndLoad.jpeg
---

# AssetBundle
[官方AssetBundle浏览器](https://bitbucket.org/Unity-Technologies/assetbundles-browser/src)

## 脚本中Build AssetBundle的方法
``` CSharp
public class BundleEditor 
{
    [MenuItem("Tools/Build AssetBundles")]
    public static void BuildAssetBundles()
    {
        if (!Directory.Exists(Application.streamingAssetsPath))
        {
            Directory.CreateDirectory(Application.streamingAssetsPath);
        }
        BuildPipeline.BuildAssetBundles(Application.streamingAssetsPath, BuildAssetBundleOptions.ChunkBasedCompression, EditorUserBuildSettings.activeBuildTarget);

        AssetDatabase.Refresh();
        Debug.Log("AssetBundle build successfully");
    }
}
```
**注意使用的方法是 BuildAssetBundles 另外有一个 BuildAssetBundle 的方法**

## 在脚本中加载AssetBundle
``` CSharp
string assetPath = Application.streamingAssetsPath + "/k423";
Debug.Log(assetPath);
AssetBundle assetBundle = AssetBundle.LoadFromFile(assetPath);
GameObject go = assetBundle.LoadAsset<GameObject>("attack");
GameObject.Instantiate(go); // 用于读取AB包，路径相对路径或者绝对路径都行
```

## 在Editor中加载AssetBundle
``` CSharp
// 用法和AssetBundle类似，不同点在于Editor的API可以加载所有类型的资源
AssetBundle assetBundle2 = UnityEditor.AssetDatabase.LoadAssetAtPath<AssetBundle>(assetPath);
GameObject.Instantiate<GameObject>(assetBundle.LoadAsset<GameObject>("attack"));
```

**正常打包策略**
在编辑器下手动设置文件夹或者文件的AB包名 -> 生成AB包 -> 根据Manifest进行依赖加载
优点：上手简单，方便操作
缺点： 编辑器必须打包才能运行游戏，浪费时间；容易产生冗余包；文件夹或文件等AB包名设置混乱，难以管理

**优化打包策略**
使用编辑器工具统一设置AB包名以及路径管理 -> 根据依赖关系生成不冗余的AB包 -> 基于Asset的全路径生成自己的依赖关系表 -> 根据依赖关系表加载AB包，编辑器下直接加载资源
优点：不需要在编辑器打包可以直接运行游戏（依赖关系表中有Asset的全路径）；不会产生冗余AB包（编辑器工具同一设置AB包名以及路径管理）
缺点：长时间未打包，打包时间较长；新手较难理解

核心原理就是：
1. 一个**没有设置AssetBundleName的文件**，如果同时被**多个AssetBundle中的文件依赖**，那么它会被复制多份**产生冗余**，常见的就是贴图材质Shader等资源文件。
2. 基于原理1，我们首先提取出除Prefab之外的资源文件，然后对资源文件夹设置AssetBundleName，这样资源文件基本不会产生冗余。
3. 对**文件夹设置AssetBundleName**，文件夹下所有文件包括所有子文件夹，都可以算作**同时设置了该AssetBundleName**。
4. 基于原理3，如果我们多个AssenBundle依赖于设置了AssetBundleName的文件夹下的文件，它不会冗余，而是创建一个依赖。
5. 给**Prefab设置AssetBundleName**，AssetBundleName**所依赖的文件不会自动设置同一个AssetBundleName**。就算是以类似于文件夹结构的嵌套Prefab，依然只是算作依赖，而不是子物体。
6. 基于原理5，我们设置Prefab的AssetBundleName时，必须**获取全部依赖文件**，排除掉已经包含在AssetBundle中的文件，剩余的依赖文件要**全部设置同样的AssetBundleName**。
7. 生成AssetBundle的Manifest文件，只是记录了设置了该AssetBundleName的asset，那些自动引入的冗余文件并不会显示。

# 打包详细步骤
## 自定义一个AB配置
ABConfig
``` CSharp
[CreateAssetMenu(fileName ="ABConfig", menuName = "CreateABConfig", order = 0)]
public class ABConfig : ScriptableObject
{
    // Prefab所在的文件夹
    public List<string> PrefabsDirs = new List<string>();
    // 资源文件夹
    public List<ABDirFile> FileDirs = new List<ABDirFile>();

    // 资源文件夹配置
    [Serializable]
    public struct ABDirFile
    {
        public string ABName;
        public string Path;
    }
}

```
在Editor中创建一个ScriptableObject的Asset，并且在Inspector中编辑相关属性。
{% asset_img ABConfig.jpg ABConfig in Inspector %}


## 读取ABConfig
``` CSharp
#region Load ABConfig
string ABCONFIG_PATH = "Assets/Editor/ABConfig.asset";
var abconfig = AssetDatabase.LoadAssetAtPath<ABConfig>(ABCONFIG_PATH);
foreach (var item in abconfig.FileDirs)
{
    Debug.LogFormat("{0}:{1}", item.ABName, item.Path);
}
foreach (var item in abconfig.PrefabsDirs)
{
    Debug.LogFormat(item);
}
#endregion
```
***注意读取ABConfig文件的时候，后缀名为.asset,全名 ABConfig.asset***
读取对应文件，然后反序列化。

## 根据ABConfig中的配置，设置文件的 AssetBundle Name
### 自定义打包策略
简单的将资源分为两种AB包：
- 对全是资源文件的文件夹打包， 对文件夹设置ABName
- 在全是Prefab文件的文件夹中对所有Prefab文件打包，对每一个Prefab以及它所依赖的资源文件设置ABName

同时为了保存这两种文件夹的路径，使用ScriptableObject的扩展类ABConfig进行文件夹路径的配置，这样我们可以在UnityEditor中读取，并进行自动化打包。

### 资源文件夹的打包流程
{% asset_img FileDirsAssetBundle.jpg %}


### Prefab文件夹的打包流程
{% asset_img PrefabsDirAssetBundle.jpg %}


**GetDependencies**
``` CSharp
// 会获取到本身，有些情况下需要考虑到
// 如果path是文件夹，仅能获取到文件夹本身，文件夹下的内容无法获取
string[] allDepend = AssetDatabase.GetDependencies(path);
```
**GetAssetPathsFromAssetBundle**
``` CSharp
// 获取所有的ABName
 string[] allABNames = AssetDatabase.GetAllAssetBundleNames();
 for (int i = 0; i < allABNames.Length; i++)
 {
     // 获取所有赋值ABName的AssetPath
     // 会忽略文件夹本体，但是文件夹下的所有auto类型的文件都可以返回
     string[] assetPaths = AssetDatabase.GetAssetPathsFromAssetBundle(allABNames[i]);

     for (int j = 0; j < assetPaths.Length; j++)
     {
         Debug.LogFormat("{0} : {1}", allABNames[i], assetPaths[j]);
     }
 }
```
{% asset_img autoassetbundle.jpg %}

打包代码
``` CSharp
// 2. 遍历Prefab文件夹，获取它的所有依赖
// 2.1 获取Prefab文件夹下所有Prefab的路径
string[] allPrefabPath = AssetDatabase.FindAssets("t:prefab",abConfig.PrefabsDirs.ToArray());
int index = 0;
foreach (var prefabGUID in allPrefabPath)
{
    // 2.2 遍历Prefab获取所有依赖
    string prefabPath = AssetDatabase.GUIDToAssetPath(prefabGUID);
    string prefabName = prefabPath.Substring(prefabPath.LastIndexOf('/') + 1);
    EditorUtility.DisplayProgressBar("查找Prefab", "Prefab: " + prefabPath, (index++ * 1.0f / allPrefabPath.Length));
    if (!IsFileExistsInABDirectories(prefabPath, fileABDic) && !IsFileExistsInPrefabAB(prefabPath, prefabABDic))
    {
        // 2.3 获取Prefab的所有依赖
        var dependencies = AssetDatabase.GetDependencies(prefabPath);
        List<string> dependPaths = new List<string>();
        // 2.4 剔除掉已经存在现有的AB包中的asset。（存在于资源文件AB包中，或者其他的Prefab形成的AB包中）
        // 我们平时也会将通用的资源文件单独打包，所以第二种仅仅是为了查漏，很少出现
        foreach (var dependency in dependencies)
        {
            if (!IsFileExistsInABDirectories(dependency, fileABDic) && !IsFileExistsInPrefabAB(dependency, prefabABDic) && !dependency.EndsWith(".cs"))
            {
                // 当前资源文件还没有包含在AssetBundle中, 并且不是Script文件
                dependPaths.Add(dependency);
            }
        }
        if (prefabABDic.ContainsKey(prefabName))
        {
            Debug.LogErrorFormat("Prefab重名 : {0}", prefabName);
        }
        else
        {
            prefabABDic.Add(prefabName, dependPaths);
        }
    }
}
```


### 文件去重
不同资源文件夹下不能有同名的资源文件
``` CSharp
    /// <summary>
    /// 检查文件是否存在于给出的所有文件夹下
    /// </summary>
    /// <param name="filePath"></param>
    /// <param name="directories"></param>
    /// <returns></returns>
    static bool IsFileExistsInDirectories(string filePath, string[] directories)
    {
        foreach (var dir in directories)
        {
            if (IsFileExistInDirectory(filePath, dir))
            {
                return true;
            }
        }

        return false;
    }
```

在Prefab对依赖去重，查找该Prefab依赖文件是否没有包含在资源文件夹AB以及别的PrefabAB中。
``` CSharp
    static bool IsFileExistsInPrefabAB(string filePath, Dictionary<string, List<string>> prefabABDic)
    {
        // 遍历所有已存在的prefab assetbundle，获取它的依赖，判断有没有重复
        foreach (var pairs in prefabABDic)
        {
            foreach (var path in pairs.Value)
            {
                if (path == filePath)
                {
                    return true;
                }
            }
        }

        return false;
    }
```

## Build AssetBundle
### 赋予AssetBundle名称
根据 FileDirsAssetBundle 给文件夹赋予对应的名称
根据 PrefabsDirAssetBundle 给Prefab以及它所依赖的所有文件赋予Prefab的名称
``` CSharp
 // 4. 根据配置给文件加上assetbundle名称
 foreach (var pair in fileABDic)
 {
     SetABName(pair.Key, pair.Value);
 }

 foreach (var pair in prefabABDic)
 {
     SetABNames(pair.Key, pair.Value);
 }

static void SetABName(string ABName, string path)
{
    AssetImporter assetImporter = AssetImporter.GetAtPath(path);
    if (assetImporter == null)
    {
        Debug.LogErrorFormat("不存在此文件路径：{0}", path);
    }
    else
    {
        assetImporter.SetAssetBundleNameAndVariant(ABName, null);
    }
}
```

### 在Build AssetBunle之前删除多余的AssetBundle
根据上面设置的所有 AssetBundle Name 匹配存储 AssetBundle 文件夹中所有的 AssetBundle，并删除其中多余的AssetBundle。

### Build AssetBundle
和第一节中一样脚本中 Build AssetBundle

### 在Build AssetBundle之后清除AssetBundle Name
由于每次更改文件AssetBundle Name，都会改变资源的meta文件中的AssetBundle Name属性，会导致版本控制混乱，所以我们会在建立AssetBundle后，清除所有文件的AssetBundle Name。


## 建立依赖关系表
**依赖关系表** 就是一个集合，集合内部每一个成员存储了
- 资源路径（在计算出CRC之后实际不需要）
- 资源名称
- 由资源路径计算出来的CRC
- 资源所在AssetBundle
- 资源所依赖的所有AssetBundle

这一步实际发生在清除 AssetBundle Name之前，获取所有AssetBundle Name，构建AssetBundle之间的相互依赖, 然后将依赖关系序列化到本地文件中用于之后在Editor中直接加载。

依赖关系表建立之后，还需要单独给依赖关系表打包，用于在实际运行环境中读取依赖配置。

注意点
- Windows以及网络URL路径检查都是不区分大小写
- Unity中AssetBundle相关的API也是不区分路径大小写
- 但是，这个框架默认区分大小写，因为有CRC校验，也可以通过更改CRC校验方法来支持不区分大小写
- Unity Editor界面默认不显示后缀名，但是在使用各个资源文件的时候不能忘记加后缀名


# 加载AssetBundle概述
## Unity中的Dependency
Unity中的依赖指的是人为外部引进的资源依赖，我们如果获取Scene类型的依赖，可以看到它只依赖于场景中的 Prefab script或者音频等外部资源。而本身包含的我们可以直接从菜单中创建的 3D 2D GameObject等都是属于内部资源。

有点类似于，引用外部DLL，如果是编译时自动包含进去的内部库，就不需要手动引用，而由我们手动引入的外部DLL，我们就需要主动引入进来。

1. 打完包并且建立了依赖关系表之后，加载资源就是根据 assetpath 计算出 CRC ，用CRC匹配依赖关系表的成员项
2. 得到对应CRC的成员项，遍历 AssetBundle Dependencies
3. 加载依赖AssetBundle，直到所有 AssetBundle Dependencies 都加载完毕
4. 加载目标AssetBundle，从AssetBundle中加载目标Asset

**注意点：**
1. 一个AssetBundle中的依赖关系是会**包含所有依赖并不仅仅包含直接依
赖**。
2. 在加载AssetBundle过程中要**先查看AssetBundle是否已经加载**过，使用一个字典缓存即可。

{% post_link AssetBundleManager %}

# Scene打包
Scene就是一个场景对象，Scene文件就是场景对象的序列化文件。这个文件就包含了它本身的各种属性以及它所依赖的外部文件，比如我们拖入场景的Prefab。所以我们也可以给Scene设置AssetBundleName，并在运行时进行加载。


# AssetBundle扩展阅读
[AssetBundle基础介绍](https://zhuanlan.zhihu.com/p/38122862)
