hexo.extend.helper.register('getpostphoto', function(theme, post){
    return theme.url + '/' + post.path + post.photos[0];
});

