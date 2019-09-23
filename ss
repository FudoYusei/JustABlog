warning: LF will be replaced by CRLF in themes/Sakura/_config.yml.
The file will have its original line endings in your working directory
[1mdiff --git a/_config.yml b/_config.yml[m
[1mindex 0cde9d1..b0c317b 100644[m
[1m--- a/_config.yml[m
[1m+++ b/_config.yml[m
[36m@@ -3,11 +3,11 @@[m
 ## Source: https://github.com/hexojs/hexo/[m
 [m
 # Site[m
[31m-title: hojun[m
[32m+[m[32mtitle: fudoyusei[m
 subtitle:[m
 description: 好少年光芒万丈[m
 keywords:[m
[31m-author: hojun[m
[32m+[m[32mauthor: fudoyusei[m
 language: zh-cn[m
 timezone:[m
 [m
[36m@@ -81,25 +81,25 @@[m [mdeploy:[m
   type: git[m
   repo: [m
     # github: git@github.com:honjun/honjun.github.io.git[m
[31m-    github: https://github.com/FudoYusei/JustBlog[m
[32m+[m[32m    #github: https://github.com/FudoYusei/JustBlog[m
     #coding: https://git.coding.net/hojun/hojun.git[m
   branch: master[m
 [m
 # backup[m
[31m-backup:[m
[31m-  type: git[m
[31m-  message: backup my blog of https://yourname.github.io/[m
[31m-  repository:[m
[31m-    # github: https://github.com/honjun/honjun.github.io.git,backup[m
[31m-    coding: https://git.coding.net/hojun/hojun.git,backup[m
[32m+[m[32m# backup:[m
[32m+[m[32m#   type: git[m
[32m+[m[32m#   message: backup my blog of https://yourname.github.io/[m
[32m+[m[32m#   repository:[m
[32m+[m[32m#     # github: https://github.com/honjun/honjun.github.io.git,backup[m
[32m+[m[32m#     coding: https://git.coding.net/hojun/hojun.git,backup[m
 [m
 #RSS[m
[31m-feed:[m
[31m-  type: atom[m
[31m-  path: atom.xml[m
[31m-  limit: 20[m
[31m-  hub:[m
[31m-  content:[m
[31m-  content_limit: 140[m
[31m-  content_limit_delim: ' '[m
[31m-  order_by: -date[m
[32m+[m[32m# feed:[m
[32m+[m[32m#   type: atom[m
[32m+[m[32m#   path: atom.xml[m
[32m+[m[32m#   limit: 20[m
[32m+[m[32m#   hub:[m
[32m+[m[32m#   content:[m
[32m+[m[32m#   content_limit: 140[m
[32m+[m[32m#   content_limit_delim: ' '[m
[32m+[m[32m#   order_by: -date[m
[1mdiff --git "a/source/_posts/Hexo-Theme-Sakura - \345\211\257\346\234\254 (2).md" "b/source/_posts/Hexo-Theme-Sakura - \345\211\257\346\234\254 (2).md"[m
[1mdeleted file mode 100644[m
[1mindex 9f466ad..0000000[m
[1m--- "a/source/_posts/Hexo-Theme-Sakura - \345\211\257\346\234\254 (2).md"[m	
[1m+++ /dev/null[m
[36m@@ -1,377 +0,0 @@[m
[31m----[m
[31m-title: Hexo-Theme-Sakura[m
[31m-author: hojun[m
[31m-avatar: https://wx1.sinaimg.cn/large/006bYVyvgy1ftand2qurdj303c03cdfv.jpg[m
[31m-authorLink: hojun.cn[m
[31m-authorAbout: 一个好奇的人[m
[31m-authorDesc: 一个好奇的人[m
[31m-categories: 技术[m
[31m-date: 2018-12-12 22:16:01[m
[31m-comments: true[m
[31m-tags: [m
[31m- - web[m
[31m- - 悦读[m
[31m-keywords: Sakura[m
[31m-description: hexo-sakura主题使用教程[m
[31m-photos: https://static.2heng.xin/wp-content/uploads//2019/02/wallhaven-672007-1-1024x576.png[m
[31m----[m
[31m-hexo-theme-sakura主题 [English document](https://github.com/honjun/hexo-theme-sakura/blob/master/README.md)[m
[31m-[m
[31m-基于WordPress主题[Sakura](https://github.com/mashirozx/Sakura/)修改成Hexo的主题。[m
[31m-[m
[31m-[demo预览](https://sakura.hojun.cn)[m
[31m-[m
[31m-正在开发中......[m
[31m-[m
[31m-![](https://wx3.sinaimg.cn/large/006bYVyvly1g069tuf42oj312w0m8ndq.jpg)[m
[31m-[m
[31m-## 交流群[m
[31m-若你是使用者，加群QQ: 801511924[m
[31m-[m
[31m-若你是创作者，加群QQ: 194472590[m
[31m-[m
[31m-[m
[31m-## 主题特性[m
[31m-[m
[31m- - 首页大屏视频[m
[31m- - 首页随机封面[m
[31m- - 图片懒加载[m
[31m- - valine评论[m
[31m- - fancy-box相册[m
[31m- - pjax支持，音乐不间断[m
[31m- - aplayer音乐播放器[m
[31m- - 多级导航菜单（按现在大部分hexo主题来说，这也算是个特性了）[m
[31m-[m
[31m-[m
[31m-## 赞赏作者[m
[31m-如果喜欢hexo-theme-sakura主题，可以考虑资助一下哦~非常感激！[m
[31m-[m
[31m-[paypal](https://www.paypal.me/hojuncn) | [Alipay 支付宝](https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn/img/custom/donate/AliPayQR.jpg) | [WeChat Pay 微信支付](https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn/img/custom/donate/WeChanSQ.jpg)[m
[31m-[m
[31m-## 未完善的使用教程[m
[31m-[m
[31m-那啥？老实说我目前也不是很有条理233333333~[m
[31m-[m
[31m-## 1、主题下载安装[m
[31m-[m
[31m-[hexo-theme-sakura](https://github.com/honjun/hexo-theme-sakura)建议下载压缩包格式，因为除了主题内容还有些source的配置对新手来说比较太麻烦，直接下载解压就省去这些麻烦咯。[m
[31m-[m
[31m-下载好后解压到博客根目录（不是主题目录哦，重复的选择替换）。接着在命令行（cmd、bash）运行`npm i`安装依赖。[m
[31m-[m
[31m-## 2、主题配置[m
[31m-[m
[31m-### 博客根目录下的_config配置[m
[31m-[m
[31m-站点[m
[31m-```yml[m
[31m-# Site[m
[31m-title: 你的站点名[m
[31m-subtitle:[m
[31m-description: 站点简介[m
[31m-keywords:[m
[31m-author: 作者名[m
[31m-language: zh-cn[m
[31m-timezone:[m
[31m-```[m
[31m-[m
[31m-部署[m
[31m-```yml[m
[31m-deploy:[m
[31m-  type: git[m
[31m-  repo: [m
[31m-    github: 你的github仓库地址[m
[31m-    # coding: 你的coding仓库地址[m
[31m-  branch: master[m
[31m-```[m
[31m-[m
[31m-备份 （使用hexo b发布备份到远程仓库）[m
[31m-```yml[m
[31m-backup:[m
[31m-  type: git[m
[31m-  message: backup my blog of https://honjun.github.io/[m
[31m-  repository:[m
[31m-    # 你的github仓库地址,备份分支名  （建议新建backup分支）[m
[31m-    github: https://github.com/honjun/honjun.github.io.git,backup[m
[31m-    # coding: https://git.coding.net/hojun/hojun.git,backup[m
[31m-[m
[31m-```[m
[31m-[m
[31m-### 主题目录下的_config配置[m
[31m-[m
[31m-其中标明【改】的是需要修改部门，标明【选】是可改可不改，标明【非】是不用改的部分[m
[31m-```yml[m
[31m-# site name[m
[31m-# 站点名 【改】[m
[31m-prefixName: さくら荘その[m
[31m-siteName: hojun[m
[31m-[m
[31m-# favicon and site master avatar[m
[31m-# 站点的favicon和头像 输入图片路径（下面的配置是都是cdn的相对路径，没有cdn请填写完整路径，建议使用jsdeliver搭建一个cdn啦，先去下载我的cdn替换下图片就行了，简单方便~）【改】[m
[31m-favicon: /images/favicon.ico[m
[31m-avatar: /img/custom/avatar.jpg[m
[31m-[m
[31m-# 站点url 【改】[m
[31m-url: https://sakura.hojun.cn[m
[31m-[m
[31m-# 站点介绍（或者说是个人签名）【改】[m
[31m-description: Live your life with passion! With some drive![m
[31m-[m
[31m-# 站点cdn，没有就为空 【改】  若是cdn为空，一些图片地址就要填完整地址了，比如之前avatar就要填https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn@1.0/img/custom/avatar.jpg[m
[31m-cdn: https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn[m
[31m-[m
[31m-# 开启pjax 【选】[m
[31m-pjax: 1[m
[31m-[m
[31m-# 站点首页的公告信息 【改】[m
[31m-notice: hexo-Sakura主题已经开源，目前正在开发中...[m
[31m-[m
[31m-# 懒加载的加载中图片 【选】[m
[31m-lazyloadImg: https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn/img/loader/orange.progress-bar-stripe-loader.svg[m
[31m-[m
[31m-# 站点菜单配置 【选】[m
[31m-menus:[m
[31m-  首页: { path: /, fa: fa-fort-awesome faa-shake }[m
[31m-  归档: { path: /archives, fa: fa-archive faa-shake, submenus: { [m
[31m-    技术: {path: /categories/技术/, fa: fa-code }, [m
[31m-    生活: {path: /categories/生活/, fa: fa-file-text-o }, [m
[31m-    资源: {path: /categories/资源/, fa: fa-cloud-download }, [m
[31m-    随想: {path: /categories/随想/, fa: fa-commenting-o },[m
[31m-    转载: {path: /categories/转载/, fa: fa-book }[m
[31m-  } }[m
[31m-  清单: { path: javascript:;, fa: fa-list-ul faa-vertical, submenus: { [m
[31m-    书单: {path: /tags/悦读/, fa: fa-th-list faa-bounce }, [m
[31m-    番组: {path: /bangumi/, fa: fa-film faa-vertical }, [m
[31m-    歌单: {path: /music/, fa: fa-headphones },[m
[31m-    图集: {path: /tags/图集/, fa: fa-photo }[m
[31m-  } }[m
[31m-  留言板: { path: /comment/, fa: fa-pencil-square-o faa-tada }[m
[31m-  友人帐: { path: /links/, fa: fa-link faa-shake }[m
[31m-  赞赏: { path: /donate/, fa: fa-heart faa-pulse }[m
[31m-  关于: { path: /, fa: fa-leaf faa-wrench , submenus: { [m
[31m-    我？: {path: /about/, fa: fa-meetup}, [m
[31m-    主题: {path: /theme-sakura/, fa: iconfont icon-sakura },[m
[31m-    Lab: {path: /lab/, fa: fa-cogs },[m
[31m-  } }[m
[31m-  客户端: { path: /client/, fa: fa-android faa-vertical }[m
[31m-  RSS: { path: /atom.xml, fa: fa-rss faa-pulse }[m
[31m-[m
[31m-# Home page sort type: -1: newer first，1: older first. 【非】[m
[31m-homePageSortType: -1[m
[31m-[m
[31m-# Home page article shown number) 【非】[m
[31m-homeArticleShown: 10[m
[31m-[m
[31m-# 背景图片 【选】[m
[31m-bgn: 8[m
[31m-[m
[31m-# startdash面板 url, title, desc img 【改】[m
[31m-startdash: [m
[31m-  - {url: /theme-sakura/, title: Sakura, desc: 本站 hexo 主题, img: /img/startdash/sakura.md.png}[m
[31m-  - {url: http://space.bilibili.com/271849279, title: Bilibili, desc: 博主的b站视频, img: /img/startdash/bilibili.jpg}[m
[31m-  - {url: /, title: hojun的万事屋, desc: 技术服务, img: /img/startdash/wangshiwu.jpg}[m
[31m-[m
[31m-[m
[31m-# your site build time or founded date[m
[31m-# 你的站点建立日期 【改】[m
[31m-siteBuildingTime: 07/17/2018[m
[31m-[m
[31m-[m
[31m-# 社交按钮(social)  url, img PC端配置 【改】[m
[31m-social:[m
[31m-  github: {url: http://github.com/honjun, img: /img/social/github.png}[m
[31m-  sina: {url: http://weibo.com/mashirozx?is_all=1, img: /img/social/sina.png}[m
[31m-  wangyiyun: {url: http://weibo.com/mashirozx?is_all=1, img: /img/social/wangyiyun.png}[m
[31m-  zhihu: {url: http://weibo.com/mashirozx?is_all=1, img: /img/social/zhihu.png}[m
[31m-  email: {url: http://weibo.com/mashirozx?is_all=1, img: /img/social/email.svg}[m
[31m-  wechat: {url: /#, qrcode: /img/custom/wechat.jpg, img: /img/social/wechat.png}[m
[31m-[m
[31m-# 社交按钮(msocial)  url, img 移动端配置 【改】[m
[31m-msocial:[m
[31m-  github: {url: http://github.com/honjun, fa: fa-github, color: 333}[m
[31m-  weibo: {url: http://weibo.com/mashirozx?is_all=1, fa: fa-weibo, color: dd4b39}[m
[31m-  qq: {url: https://wpa.qq.com/msgrd?v=3&uin=954655431&site=qq&menu=yes, fa: fa-qq, color: 25c6fe}[m
[31m-[m
[31m-# 赞赏二维码（其中wechatSQ是赞赏单页面的赞赏码图片）【改】[m
[31m-donate:[m
[31m-  alipay: /img/custom/donate/AliPayQR.jpg[m
[31m-  wechat: /img/custom/donate/WeChanQR.jpg[m
[31m-  wechatSQ: /img/custom/donate/WeChanSQ.jpg[m
[31m-[m
[31m-# 首页视频地址为https://cdn.jsdelivr.net/gh/honjun/hojun@1.2/Unbroken.mp4，配置如下 【改】[m
[31m-movies:[m
[31m-  url: https://cdn.jsdelivr.net/gh/honjun/hojun@1.2[m
[31m-  # 多个视频用逗号隔开，随机获取。支持的格式目前已知MP4,Flv。其他的可以试下，不保证有用[m
[31m-  name: Unbroken.mp4[m
[31m-[m
[31m-# 左下角aplayer播放器配置 主要改id和server这两项，修改详见[aplayer文档] 【改】[m
[31m-aplayer: [m
[31m-  id: 2660651585[m
[31m-  server: netease[m
[31m-  type: playlist[m
[31m-  fixed: true[m
[31m-  mini: false[m
[31m-  autoplay: false[m
[31m-  loop: all[m
[31m-  order: random[m
[31m-  preload: auto[m
[31m-  volume: 0.7[m
[31m-  mutex: true[m
[31m-[m
[31m-# Valine评论配置【改】[m
[31m-valine: true[m
[31m-v_appId: GyC3NzMvd0hT9Yyd2hYIC0MN-gzGzoHsz[m
[31m-v_appKey: mgOpfzbkHYqU92CV4IDlAUHQ[m
[31m-```[m
[31m-[m
[31m-## 分类页和标签页配置[m
[31m-[m
[31m-### 分类页[m
[31m-![](https://ws3.sinaimg.cn/large/006bYVyvly1g07b0gucy9j31060jih76.jpg)[m
[31m-### 标签页[m
[31m-![](https://wx2.sinaimg.cn/large/006bYVyvly1g07azb2399j31040jgazs.jpg)[m
[31m-[m
[31m-配置项在\themes\Sakura\languages\zh-cn.yml里。新增一个分类或标签最好加下哦，当然嫌麻烦可以直接使用一张默认图片（可以改主题或者直接把404图片替换下，征求下意见要不要给这个在配置文件中加个开关，可以issue或群里提出来），现在是没设置的话会使用那种倒立小狗404哦。[m
[31m-```yml[m
[31m-#category[m
[31m-# 按分类名创建[m
[31m-技术:[m
[31m-    #中文标题[m
[31m-    zh: 野生技术协会 [m
[31m-    # 英文标题[m
[31m-    en: Geek – Only for Love[m
[31m-    # 封面图片[m
[31m-    img: https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn/img/banner/coding.jpg[m
[31m-生活:[m
[31m-    zh: 生活[m
[31m-    en: live[m
[31m-    img: https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn/img/banner/writing.jpg[m
[31m-[m
[31m-#tag[m
[31m-# 标签名即是标题[m
[31m-悦读:[m
[31m-    # 封面图片[m
[31m-    img: https://cdn.jsdelivr.net/gh/fudoyusei/jsdelivercdn/img/banner/reading.jpg[m
[31m-```[m
[31m-[m
[31m-## 单页面封面配置[m
[31m-[m
[31m-![](https://ws3.sinaimg.cn/large/006bYVyvly1g07b1pi619j31080jge4u.jpg)[m
[31m-如留言板页面页面，位于source下的comment下，打开index.md如下：[m
[31m-```md[m
[31m----[m
[31m-title: comment[m
[31m-date: 2018-12-20 23:13:48[m
[31m-keywords: 留言板[m
[31m-description: [m
[31m-comments: true[m
[31m-# 在这里配置单页面头部图片，自定义替换哦~[m
[31m-photos: https://cdn.jsdelivr.net/gh/honjun/cdn@1.4/img/banner/comment.jpg[m
[31m----[m
[31m-```[m
[31m-[m
[31m-[m
[31m-## 单页面配置[m
[31m-[m
[31m-### 番组计划页 （请直接在下载后的文件中改，下面的添加了注释可能会有些影响）[m
[31m-![](https://wx2.sinaimg.cn/large/006bYVyvly1g07b2gyx60j31090jjahj.jpg)[m
[31m-[m
[31m-```yml[m
[31m----[m
[31m-layout: bangumi[m
[31m-title: bangumi[m
[31m-comments: false[m
[31m-date: 2019-02-10 21:32:48[m
[31m-keywords:[m
[31m-description:[m
[31m-bangumis:[m
[31m-  # 番组图片[m
[31m-  - img: https://lain.bgm.tv/pic/cover/l/0e/1e/218971_2y351.jpg[m
[31m-  # 番组名[m
[31m-    title: 朝花夕誓——于离别之朝束起约定之花[m
[31m-  # 追番状态 （追番ing/已追完）[m
[31m-    status: 已追完[m
[31m-  # 追番进度[m
[31m-    progress: 100[m
[31m-  # 番剧日文名称[m
[31m-    jp: さよならの朝に約束の花をかざろう[m
[31m-  # 放送时间[m
[31m-    time: 放送时间: 2018-02-24 SUN.[m
[31m-  # 番剧介绍[m
[31m-    desc:  住在远离尘嚣的土地，一边将每天的事情编织成名为希比欧的布，一边静静生活的伊欧夫人民。在15岁左右外表就停止成长，拥有数百年寿命的他们，被称为“离别的一族”，并被视为活着的传说。没有双亲的伊欧夫少女玛奇亚，过着被伙伴包围的平稳日子，却总感觉“孤身一人”。他们的这种日常，一瞬间就崩溃消失。追求伊欧夫的长寿之血，梅萨蒂军乘坐着名为雷纳特的古代兽发动了进攻。在绝望与混乱之中，伊欧夫的第一美女蕾莉亚被梅萨蒂带走，而玛奇亚暗恋的少年克里姆也失踪了。玛奇亚虽然总算逃脱了，却失去了伙伴和归去之地……。[m
[31m-  - img: https://lain.bgm.tv/pic/cover/l/0e/1e/218971_2y351.jpg[m
[31m-    title: 朝花夕誓——于离别之朝束起约定之花[m
[31m-    status: 已追完[m
[31m-    progress: 50[m
[31m-    jp: さよならの朝に約束の花をかざろう[m
[31m-    time: 放送时间: 2018-02-24 SUN.[m
[31m-    desc: 住在远离尘嚣的土地，一边将每天的事情编织成名为希比欧的布，一边静静生活的伊欧夫人民。在15岁左右外表就停止成长，拥有数百年寿命的他们，被称为“离别的一族”，并被视为活着的传说。没有双亲的伊欧夫少女玛奇亚，过着被伙伴包围的平稳日子，却总感觉“孤身一人”。他们的这种日常，一瞬间就崩溃消失。追求伊欧夫的长寿之血，梅萨蒂军乘坐着名为雷纳特的古代兽发动了进攻。在绝望与混乱之中，伊欧夫的第一美女蕾莉亚被梅萨蒂带走，而玛奇亚暗恋的少年克里姆也失踪了。玛奇亚虽然总算逃脱了，却失去了伙伴和归去之地……。[m
[31m----[m
[31m-```[m
[31m-[m
[31m-### 友链页 （请直接在下载后的文件中改，下面的添加了注释可能会有些影响）[m
[31m-![](https://ws3.sinaimg.cn/large/006bYVyvly1g07b39tleej31080jhjv1.jpg)[m
[31m-[m
[31m-```yml[m
[31m----[m
[31m-layout: links[m
[31m-title: links[m
[31m-# 创建日期，可以改下[m
[31m-date: 2018-12-19 23:11:06 [m
[31m-# 图片上的标题，自定义修改[m
[31m-keywords: 友人帐 [m
[31m-description: [m
[31m-# true/false 开启/关闭评论[m
[31m-comments: true [m
[31m-# 页面头部图片，自定义修改[m
[31m-photos: https://cdn.jsdelivr.net/gh/honjun/cdn@1.4/img/banner/links.jpg [m
[31m-# 友链配置[m
[31m-links: [m
[31m-  # 类型分组[m
[31m-  - group: 个人项目[m
[31m-    # 类型简介[m
[31m-    desc: 充分说明这家伙是条咸鱼 < (￣︶￣)>[m
[31m-    items:[m
[31m-    # 友链链接[m
[31m-    - url: https://shino.cc/fgvf[m
[31m-    # 友链头像[m
[31m-      img: https://cloud.moezx.cc/Picture/svg/landscape/fields.svg[m
[31m-    # 友链站点名[m
[31m-      name: Google[m
[31m-    # 友链介绍  下面雷同[m
[31m-      desc: Google 镜像[m
[31m-    - url: https://shino.cc/fgvf[m
[31m-      img: https://cloud.moezx.cc/Picture/svg/landscape/fields.svg[m
[31m-      name: Google[m
[31m-      desc: Google 镜像[m
[31m-  # 类型分组...[m
[31m-  - group: 小伙伴们[m
[31m-    desc: 欢迎交换友链 ꉂ(ˊᗜˋ)[m
[31m-    items:[m
[31m-    - url: https://shino.cc/fgvf[m
[31m-      img: https://cloud.moezx.cc/Picture/svg/landscape/fields.svg[m
[31m-      name: Google[m
[31m-      desc: Google 镜像[m
[31m-    - url: https://shino.cc/fgvf[m
[31m-      img: https://cloud.moezx.cc/Picture/svg/landscape/fields.svg[m
[31m-      name: Google[m
[31m-      desc: Google 镜像[m
[31m----[m
[31m-```[m
[31m-[m
[31m-## 写文章配置[m
[31m-[m
[31m-主题集成了个人插件hexo-tag-bili和hexo-tag-fancybox_img。其中hexo-tag-bili用来在文章或单页面中插入B站外链视频，使用语法如下：[m
[31m-```md[m
[31m-{% bili video_id [page] %}[m
[31m-```[m
[31m-详细使用教程详见[hexo-tag-bili](https://github.com/honjun/hexo-tag-bili/blob/master/README-zh_cn.md)。[m
[31m-[m
[31m-hexo-tag-fancybox_img用来在文章或单页面中图片，使用语法如下：[m
[31m-```md[m
[31m-{% fb_img src [caption] %}[m
[31m-```[m
[31m-详细使用教程详见[hexo-tag-fancybox_img](https://github.com/honjun/hexo-tag-fancybox_img/blob/master/README-zh_cn.md)[m
[31m-[m
[31m-## 还有啥，一时想不起来......[m
[31m-[m
[31m-To be continued...[m
\ No newline at end of file[m
[1mdiff --git a/themes/Sakura/_config.yml b/themes/Sakura/_config.yml[m
[1mindex 43f129b..16589ff 100644[m
[1m--- a/themes/Sakura/_config.yml[m
[1m+++ b/themes/Sakura/_config.yml[m
[36m@@ -29,16 +29,16 @@[m [mmenus:[m
     歌单: {path: /music/, fa: fa-headphones },[m
     图集: {path: /tags/图集/, fa: fa-photo }[m
   } }[m
[31m-  留言板: { path: /comment/, fa: fa-pencil-square-o faa-tada }[m
[31m-  友人帐: { path: /links/, fa: fa-link faa-shake }[m
[31m-  赞赏: { path: /donate/, fa: fa-heart faa-pulse }[m
[32m+[m[32m  #留言板: { path: /comment/, fa: fa-pencil-square-o faa-tada }[m
[32m+[m[32m  #友人帐: { path: /links/, fa: fa-link faa-shake }[m
[32m+[m[32m  #赞赏: { path: /donate/, fa: fa-heart faa-pulse }[m
   关于: { path: /, fa: fa-leaf faa-wrench , submenus: { [m
     我？: {path: /about/, fa: fa-meetup}, [m
     主题: {path: /theme-sakura/, fa: iconfont icon-sakura },[m
     Lab: {path: /lab/, fa: fa-cogs },[m
   } }[m
[31m-  客户端: { path: /client/, fa: fa-android faa-vertical }[m
[31m-  RSS: { path: /atom.xml, fa: fa-rss faa-pulse }[m
[32m+[m[32m  #客户端: { path: /client/, fa: fa-android faa-vertical }[m
[32m+[m[32m  #RSS: { path: /atom.xml, fa: fa-rss faa-pulse }[m
 [m
 [m
 # Home page sort type: -1: newer first，1: older first.[m
[36m@@ -92,25 +92,25 @@[m [mmsocial:[m
 #   wechatSQ: /img/custom/donate/WeChanSQ.jpg[m
 [m
 # 视频地址为https://cdn.jsdelivr.net/gh/honjun/hojun@1.2/Unbroken.mp4，配置如下[m
[31m-movies:[m
[31m-  url: https://cdn.jsdelivr.net/gh/honjun/hojun@1.2[m
[31m-  # 多个视频用逗号隔开，随机获取。支持的格式目前已知MP4,Flv。其他的可以试下，不保证有用[m
[31m-  name: Unbroken.mp4[m
[31m-[m
[31m-aplayer: [m
[31m-  id: 2660651585[m
[31m-  server: netease[m
[31m-  type: playlist[m
[31m-  fixed: true[m
[31m-  autoplay: false[m
[31m-  loop: all[m
[31m-  order: random[m
[31m-  preload: auto[m
[31m-  volume: 0.7[m
[31m-  mutex: true[m
[31m-[m
[31m-# Valine[m
[31m-valine: true[m
[31m-v_appId: GyC3NzMvd0hT9Yyd2hYIC0MN-gzGzoHsz[m
[31m-v_appKey: mgOpfzbkHYqU92CV4IDlAUHQ[m
[32m+[m[32m# movies:[m
[32m+[m[32m#   url: https://cdn.jsdelivr.net/gh/honjun/hojun@1.2[m
[32m+[m[32m#   # 多个视频用逗号隔开，随机获取。支持的格式目前已知MP4,Flv。其他的可以试下，不保证有用[m
[32m+[m[32m#   name: Unbroken.mp4[m
[32m+[m
[32m+[m[32m# aplayer:[m[41m [m
[32m+[m[32m#   id: 2660651585[m
[32m+[m[32m#   server: netease[m
[32m+[m[32m#   type: playlist[m
[32m+[m[32m#   fixed: true[m
[32m+[m[32m#   autoplay: false[m
[32m+[m[32m#   loop: all[m
[32m+[m[32m#   order: random[m
[32m+[m[32m#   preload: auto[m
[32m+[m[32m#   volume: 0.7[m
[32m+[m[32m#   mutex: true[m
[32m+[m
[32m+[m[32m# # Valine[m
[32m+[m[32m# valine: true[m
[32m+[m[32m# v_appId: GyC3NzMvd0hT9Yyd2hYIC0MN-gzGzoHsz[m
[32m+[m[32m# v_appKey: mgOpfzbkHYqU92CV4IDlAUHQ[m
 [m
