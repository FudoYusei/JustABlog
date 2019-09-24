hexo.extend.helper.register('getpostphoto', function(theme, post){
    var defaultImgUrl = 'https://static.2heng.xin/wp-content/uploads//2019/02/wallhaven-672007-1-1024x576.png';

    if(!post.photos || post.photos.length == 0 || post.photos[0] == defaultImgUrl) {return defaultImgUrl; }
    return theme.url + '/' + post.path + post.photos[0];
});

