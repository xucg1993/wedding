/*  init weixin */
function initWeixin(){
    $.getJSON("/wedding/wx/getConfig.action",{url:window.location.href},function(data){
        initConfig(data.appid,data.timestamp,data.noncestr,data.signature);
    })
}
function initConfig(appid,timestamp,noncestr,signature){
    wx.config({
        debug: false,
        appId: appid,
        timestamp: timestamp,
        nonceStr: noncestr,
        signature:signature,
        jsApiList: ["closeWindow","onMenuShareAppMessage","onMenuShareTimeline","hideOptionMenu","showOptionMenu","chooseImage","uploadImage","downloadImage","previewImage","getLocation","hideMenuItems","showMenuItems"]
    });
    wx.ready(function(){
        var isShare = $("#isShare").val();
        if (isShare == undefined || parseInt(isShare) < 2) {
            wx.hideOptionMenu();
        } else {
            wx.showOptionMenu();
            // wx.showMenuItems({
            //     menuList: ["onMenuShareAppMessage","onMenuShareTimeline"] // 要显示的菜单项，所有menu项见附录3
            // });
            // wx.hideMenuItems({
            //     menuList: ["onMenuShareQQ","onMenuShareWeibo","onMenuShareQZone"] // 要隐藏的菜单项，所有menu项见附录3
            // });
            var title = $('#title').val();
            var imgUrl = $('#coverphotourl').val();
            var type = '';
            var dataUrl = '';
            var dataType = parseInt($('#materialType').val());
            var link = window.location.href;
            if (dataType > 1) {
                dataUrl = $('#mediaUrl').val();
                if (dataType == 2) {
                    type = 'music';
                }
                if (dataType == 3) {
                    type = 'video';
                }
            }
            shareTimeline(title, link, imgUrl);
            shareAppMessage(title, $('#introduction').val(), link, imgUrl, type, dataUrl);
        }
    });

    wx.error(function(res){
    });
}

/*
*   分享到朋友圈
*/
function shareTimeline(title, link, imgUrl){
    wx.onMenuShareTimeline({
        title: title, // 分享标题
        link: link, // 分享链接
        imgUrl: imgUrl, // 分享图标
        success: function () {
            // 用户确认分享后执行的回调函数
        },
        cancel: function () {
            // 用户取消分享后执行的回调函数
        }
    });
}
function shareAppMessage(title, desc, link, imgUrl, type, dataUrl){
    wx.onMenuShareAppMessage({
        title: title, // 分享标题
        desc: desc, // 分享描述
        link: link, // 分享链接
        imgUrl: imgUrl, // 分享图标
        type: type, // 分享类型,music、video或link，不填默认为link
        dataUrl: dataUrl, // 如果type是music或video，则要提供数据链接，默认为空
        success: function () {
            // 用户确认分享后执行的回调函数
        },
        cancel: function () {
            // 用户取消分享后执行的回调函数
        }
    });
}
