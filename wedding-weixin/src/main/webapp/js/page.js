var pageNum = 0;
var pageSize = 10;

function initPage(){
    pageNum = 0;
    pageSize = 10;
}

function loading(id){
    $(id).html('<div class="weui-infinite-scroll">'
        +'<div class="infinite-preloader"></div>'
        +'正在加载...'
        +'</div>');
}

function dealLoading(size, id){
    if (size < pageSize) {
        $(id).remove();
    } else {
        $(id).html('加载更多')
        pageNum += 1;
    }
}