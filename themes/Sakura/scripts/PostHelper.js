hexo.extend.helper.register('getpostphoto', function(theme, post){
    if(!post.photos || post.photos.length == 0) {return 'https://static.2heng.xin/wp-content/uploads//2019/02/wallhaven-672007-1-1024x576.png' };
    return theme.url + '/' + post.path + post.photos[0];
});

