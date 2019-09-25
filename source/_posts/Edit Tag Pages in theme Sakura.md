---
title: HexoSakura主题进阶-Tag页功能改进
author: fudoyusei
avatar: 'https://wx1.sinaimg.cn/large/006bYVyvgy1ftand2qurdj303c03cdfv.jpg'
authorLink: 
authorAbout: 一个好奇的人
authorDesc: 一个好奇的人
categories: 技术
comments: true
date: 2019-09-24 12:33:48
tags: 
    - Hexo
keywords: Git
description: Hexo Sakura主题Tag页功能改进
photos: 
---

# Hexo页面布局
[hexo页面布局](https://www.jianshu.com/p/5a1e6d8c83af)

[hexo模版](https://hexo.io/zh-cn/docs/templates)

[front-matter](https://hexo.io/zh-cn/docs/front-matter.html)

# Sakura主题Tag页面问题
{% fb_img TagPageProblem.jpg ImageUrl Error %}

我们需要在项目中定位tag页面。
首先我们知道所有页面默认使用layout布局，找到Sakura文件中的tag页面对应的ejs文件: tag.ejs
``` html
<%
  var img = page.tag + '.img';
%>
<div class="pattern-center-blank"></div>
<div class="pattern-center ">
  <div class="pattern-attachment-img">
    <img <% if(__(img)){%>src="<%- theme.lazyloadImg%>" data-src="<%= __(img)%>"<%} else {%>src="<%- theme.lazyloadImg%>" data-src="https://view.moezx.cc/images/2017/12/03/writing.jpg"<%} %> class="lazyload" onerror="imgError(this,3)" style="width: 100%; height: 100%; object-fit: cover; pointer-events: none;">
  </div>
  <header class="pattern-header ">
    <h1 class="cat-title"><%= __(page.tag) %></h1>
  </header>
</div>
<div id="content" class="site-content">
    ...省略
  </div>
</div>
``` 
很直观的可以看到页面顶端图片的 data-src 逻辑：
如果存在img变量，使用img变量作为图片url，此时url就变成一个相对路径，因此只要我们在生成的Tag页面的文件夹下加入对应的图片，就可以正确显示。而且我们也不可能添加一个Tag项，就添加一张图片到对应的目录。我们使用一个智能的方法，获取第一个文章的photo作为Tag主页的封面。

- 获取当前分页(page)的所有文章(posts)
- 根据日期排序获得第一个文章
- 获取文章的Photos[0]，作为Url

## 改进方法
由于我们之前在post中使用的Photos中的链接都是直链，所有可以直接使用第一篇文章的photos地址，而不需要担心相对路径问题。我们可以通过自带的标签语言获取，page下的posts变量可以获取当前分页的所有文章，详见[官方文档](https://hexo.io/zh-cn/docs/variables)。除了Index中分页相关的变量，其他基本都是我们在post的front-matter中人为填写的。

# Sakura主题Tag页面
找到tag.ejs, 修改如下

``` html
<%
  var img = page.tag + '.img';

  // 默认获取第一个文章的photos[0], 这个为直链。
  var firstphoto = page.posts.sort('date', theme.homePageSortType).limit(theme.homeArticleShown).eq(0).photos[0];
%>

<div class="pattern-center-blank"></div>
<div class="pattern-center ">
  <div class="pattern-attachment-img">
    <img <% if(firstphoto){%>src="<%- theme.lazyloadImg%>" data-src="<%= firstphoto %>"<%} else {%>src="<%- theme.lazyloadImg%>" data-src="https://view.moezx.cc/images/2017/12/03/writing.jpg"<%} %> class="lazyload" onerror="imgError(this,3)" style="width: 100%; height: 100%; object-fit: cover; pointer-events: none;">
  </div>
  <header class="pattern-header ">
    <h1 class="cat-title"><%= __(page.tag) %></h1>
  </header>
</div>
```

# 修改文章中的直链
主要是通过Url生成规则获得文章的封面图Url，这样就可以使用我们自己引入的图片。

[修改permalink](https://blog.csdn.net/jingbin_/article/details/80617210)

~~而我实际使用的时候，发现permalink并不是根据title生成，而是post的文件名。~~
这里的 :title 指的是文件名，也就是 xx.md 中的 xx

:post_title 才是文章标题

permalink 默认根据文档创建时间生成链接，这个链接和文件结构目录是一致的，因此我们的图片链接如下
``` html
<%- firstphotolink = <%- theme.url + url_for(firstlink)+ firstPost.title + '.jpg' %> %>
```

获得以下
firstlink = https://uath6h.coding-pages.com/2019/09/24/HexoSakura主题进阶-Tag页面修改/HexoSakura主题进阶-Tag页功能改进.jpg

可以看到这个链接过长，并且掺杂中文。
因此，只要我们在对应文件夹下加入和post的名称相同名称的jpg，就能作为post的封面引用到页面上，因此我们还需要将post的文件名称最好改成英文，也显得简洁。

重新修改tag.ejs代码
``` html
<%
  var firstPost = page.posts.sort('date', theme.homePageSortType).limit(theme.homeArticleShown).eq(0);
  var firstlink = firstPost.permalink;
  var title = :title;
  var firstphotolink = theme.url + url_for(firstlink)+ title + '.jpg';
%>

<div class="pattern-center-blank"></div>
<div class="pattern-center ">
  <div class="pattern-attachment-img">
    <img <% if(firstphotolink){%>src="<%- theme.lazyloadImg%>" data-src="<%= firstphotolink %>"<%} else {%>src="<%- theme.lazyloadImg%>" data-src="https://view.moezx.cc/images/2017/12/03/writing.jpg"<%} %> class="lazyload" onerror="imgError(this,3)" style="width: 100%; height: 100%; object-fit: cover; pointer-events: none;">
  </div>
  <header class="pattern-header ">
    <h1 class="cat-title"><%= __(page.tag) %></h1>
  </header>
</div>
...
</div>
```

# 修改文章封面
在上一节的最后修改，我们的封面图名称和文章的title是一样的，现在我们修改成和 post 中的 photos 属性相关
在post的 Front-matter 的photos中代表的是我们的文章封面的链接，Sakura主题默认photos是个完全Url，现在，我们将它修改成只是代表cover名称，这样方便发布我们自己的封面图。 


先修改文章的 Front-matter 中的photos属性为相对路径。
然后修改所有用到 post.photos 属性的地方
- post本体使用的顶部封面图
- 首页的文章列表封面图
- Category中的文章列表封面图
- Tags中的文章列表封面图
- post中前一页后一页封面图

本着Dont Repeat Yourself原则，我们创建一个获得修改后路径的[辅助函数](https://hexo.io/zh-cn/api/helper)
``` js
hexo.extend.helper.register('getpostphoto', function(theme, post){
    var defaultImgUrl = 'https://static.2heng.xin/wp-content/uploads//2019/02/wallhaven-672007-1-1024x576.png';

    if(!post.photos || post.photos.length == 0 || post.photos[0] == defaultImgUrl) {return defaultImgUrl; }
    return theme.url + '/' + post.path + post.photos[0];
});
```

<<<<<<< HEAD
=======
由于lazyload插件导致图片中的名字不能带空格，它会解析成错误的URL，因此所有photos的名称不能使用空格。
>>>>>>> e83fa54b932497e2e4d047172d6ce100aef0df40




