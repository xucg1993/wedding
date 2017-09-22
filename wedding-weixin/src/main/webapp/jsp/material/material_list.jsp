<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>公告</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no" />
    <meta content="email=no" name="format-detection" />
    <%@ include file="/jsp/common/common_js_css.jsp" %>
</head>
<body ontouchstart>
<input type="hidden" id="moduleId" value="${moduleId}">
<input type="hidden" id="loginId" value="${loginId}">
<div class="weui_tab" id='page-infinite-navbar'>
<div class="weui_navbar mynavbar" style="position: fixed;top: 0;left: 0;z-index: 999;">
    <a href='#tab1' class="weui_navbar_item weui_bar_item_on" alt="textTab" status="1">
        图文消息
    </a>
    <a href='#tab2' class="weui_navbar_item" alt="voiceTab" status="2">
        语音消息
    </a>
    <a href='#tab3' class="weui_navbar_item" alt="videoTab" status="3">
        视频消息
    </a>
</div>
<div class="weui_tab_bd">
    <div id="tab1" class="weui_tab_bd_item weui_tab_bd_item_active">
        <div class="weui_search_bar" id="search_bar">
            <form class="weui_search_outer">
                <div class="weui_search_inner">
                    <i class="weui_icon_search"></i>
                    <input type="search" class="weui_search_input" id="search_input" placeholder="搜索" required/>
                    <a href="javascript:" class="weui_icon_clear" id="search_clear"></a>
                </div>
            </form>
            <a href="javascript:initPage();findMaterialList('');" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-left: 10px;background-color: #12b7f5;">搜索</a>
        </div>
        <div class="my-list-containt">
            <div id="textTab"></div>
            <a id="loadMoreText" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadMoreText(this);">
                加载更多
            </a>
        </div>

    </div>
    <div id="tab2" class="weui_tab_bd_item">
        <div class="weui_search_bar" id="search_bar2">
            <form class="weui_search_outer">
                <div class="weui_search_inner">
                    <i class="weui_icon_search"></i>
                    <input type="search" class="weui_search_input" id="search_input2" placeholder="搜索" required/>
                    <a href="javascript:" class="weui_icon_clear" id="search_clear2"></a>
                </div>
            </form>
            <a href="javascript:initPage();findMaterialList('');" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-left: 10px;background-color: #12b7f5;">搜索</a>
        </div>
        <div class="my-list-containt">
            <div id="voiceTab"></div>
            <a id="loadMoreVoice" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadMoreVoice(this);">
                加载更多
            </a>
        </div>

    </div>
    <div id="tab3" class="weui_tab_bd_item">
        <div class="weui_search_bar" id="search_bar3">
            <form class="weui_search_outer">
                <div class="weui_search_inner">
                    <i class="weui_icon_search"></i>
                    <input type="search" class="weui_search_input" id="search_input3" placeholder="搜索" required/>
                    <a href="javascript:" class="weui_icon_clear" id="search_clear3"></a>
                </div>
            </form>
            <a href="javascript:initPage();findMaterialList('');" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-left: 10px;background-color: #12b7f5;">搜索</a>
        </div>
        <div class="my-list-containt" >
            <div id="videoTab"></div>
            <a id="loadMoreVideo" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadMoreVideo(this);">
                加载更多
            </a>
        </div>

    </div>
</div>
</div>
<script src="../../js/login.js?111dd=222"></script>
<script src="../../js/page.js?e2=32"></script>
<script src="../../js/jweixin-1.1.0.js"></script>
<script src="../../js/weixin.js?dd=22"></script>
<script>
    $(function() {
        initWeixin();
        FastClick.attach(document.body);
        $(".weui_navbar_item").click(function(){
            initPage()
            var id = $(this).attr("alt");
            var materialType = $(this).attr("status");
            appendMaterialList(id, materialType, "", "");
        })
        appendMaterialList($('.weui_bar_item_on').attr("alt"), $('.weui_bar_item_on').attr("status"), "", "");
    });

    function findMaterialList(source){
        var id = '';
        var status = parseInt($('.weui_bar_item_on').attr("status"));
        if (status == 1) {
            id = "search_input";
        }
        if (status == 2) {
            id = "search_input2";
        }
        if (status == 3) {
            id = "search_input3";
        }
        if(source != null){
            appendMaterialList($('.weui_bar_item_on').attr("alt"), $('.weui_bar_item_on').attr("status"), $("#" + id).val(), "");
        }else{
            appendMaterialList($('.weui_bar_item_on').attr("alt"), $('.weui_bar_item_on').attr("status"), $("#" + id).val());
        }
    }

    function materialDetail(materialId){
        clearAllInterval();
        location.href = "/wedding/wx/material/materialAllDetail.action?materialId=" + materialId + "&moduleId=" + $("#moduleId").val() + "&loginId=" + $("#loginId").val();
    }

    function appendMaterialList(id, materialType, title, source){
        $.getJSON("/wedding/wx/material/findMaterialList.action",
                {materialType : materialType, moduleId : $("#moduleId").val(),
                title : encodeURIComponent(title), pageNum : pageNum*pageSize, pageSize : pageSize}, function(data){
                    if(source != null){
                        $("#" + id).empty();
                    }
                        data.forEach(function(x){
                            var htmlStr = '';
                            if (materialType == 1) {
                                htmlStr += '<div class="weui_cells weui_cell_access my-margin-0 my-list" onclick="materialDetail(' + x.materialid + ')">';
                                htmlStr += '        <div class="weui_cell">';
                                htmlStr += '        <div class="weui_cell_hd">';
                                htmlStr += '        <img class="my-cell-img" src="' + x.coverphotourl + '" alt="icon">';
                                if (x.readstatus == 2) {
                                    htmlStr += '        <span class="my-message-node"></span>';
                                }
                                htmlStr += '        </div>';
                                htmlStr += '        <div class="weui_cell_bd weui_cell_primary">';
                                htmlStr += '        <div class="weui_cell my-padding-0">';
                                var title = x.title;
                                if (title.length > 10) {
                                    title = title.slice(0, 10) + "...";
                                }
                                htmlStr += '        <div class="weui_cell_hd my-cell-list">' + title + '</div>';
                                htmlStr += '        <div class="my-date">' + formatTime(x.updatetime) + '</div>';
                                htmlStr += '        </div>';
                                htmlStr += '        <div class="my-padding-0">';
                                var introduction = x.introduction;
                                if (introduction.length > 10) {
                                    introduction = introduction.slice(0, 10) + "...";
                                }
                                htmlStr += '        <div class="weui_cell_hd my-cell-list2">' + introduction + '</div>';
                                htmlStr += '        </div>';
                                htmlStr += '        <div style="overflow: auto;">';
                                htmlStr += '        <ul class="my-submit-ul">';
                                htmlStr += '        <li class="my-submit-li"><img src="../../img/chats.png" alt="chats"><span>' + x.commentcount + '</span></li>';
                                htmlStr += '<li class="my-submit-li"><img src="../../img/views.png" alt="views"><span>' + x.readcount + '</span></li>';
                                htmlStr += '<li class="my-submit-li"><img src="../../img/zan.png" alt="zan"><span>' + x.supportcount + '</span></li>';
                                htmlStr += '        </ul>';
                                htmlStr += '        </div>';
                                htmlStr += '        </div>';
                                htmlStr += '        </div>';
                                htmlStr += '</div>';
                            }
                            if (materialType == 2) {
                                htmlStr += '<div class="weui_cells weui_cell_access my-margin-0 my-list" onclick="materialDetail(' + x.materialid + ')">';
                                htmlStr += '        <div class="weui_cell">';
                                htmlStr += '        <div class="weui_cell_hd">';
                                htmlStr += '        <img class="my-cell-img" src="' + x.coverphotourl + '" alt="icon">';
                                if (x.readstatus == 2) {
                                    htmlStr += '<span class="my-message-node"></span>';
                                }
                                htmlStr += '<img class="my-cell-img my-pause-img" src="../../img/voice.png" alt="icon">';
                                htmlStr += '        </div>';
                                htmlStr += '        <div class="weui_cell_bd weui_cell_primary">';
                                htmlStr += '        <div class="weui_cell my-padding-0">';
                                var title = x.title;
                                if (title.length > 10) {
                                    title = title.slice(0, 10) + "...";
                                }
                                htmlStr += '        <div class="weui_cell_hd my-cell-list">' + title + '</div>';
                                htmlStr += '        <div class="my-date">' + formatTime(x.updatetime) + '</div>';
                                htmlStr += '        </div>';
                                htmlStr += '        <div class="my-padding-0">';
                                var introduction = x.introduction;
                                if (introduction.length > 10) {
                                    introduction = introduction.slice(0, 10) + "...";
                                }
                                htmlStr += '        <div class="weui_cell_hd my-cell-list2">' + introduction + '</div>';
                                htmlStr += '        </div>';
                                htmlStr += '        <div style="overflow: auto;">';
                                htmlStr += '        <ul class="my-submit-ul">';
                                htmlStr += '        <li class="my-submit-li"><img src="../../img/chats.png" alt="chats"><span>' + x.commentcount + '</span></li>';
                                htmlStr += '<li class="my-submit-li"><img src="../../img/views.png" alt="views"><span>' + x.readcount + '</span></li>';
                                htmlStr += '<li class="my-submit-li"><img src="../../img/zan.png" alt="zan"><span>' + x.supportcount + '</span></li>';
                                htmlStr += '        </ul>';
                                htmlStr += '        </div>';
                                htmlStr += '        </div>';
                                htmlStr += '        </div>';
                                htmlStr += '</div>';
                            }
                            if (materialType == 3) {
                                htmlStr += '<div class="weui_cells weui_cell_access my-margin-0 my-list" onclick="materialDetail(' + x.materialid + ')">';
                                htmlStr += '        <div class="weui_cell">';
                                htmlStr += '        <div class="weui_cell_hd">';
                                htmlStr += '        <img class="my-cell-img" src="' + x.coverphotourl + '" alt="icon">';
                                if (x.readstatus == 2) {
                                    htmlStr += '        <span class="my-message-node"></span>';
                                }
                                htmlStr += '<img class="my-cell-img my-pause-img" src="../../img/pause.png" alt="icon">';
                                htmlStr += '        </div>';
                                htmlStr += '        <div class="weui_cell_bd weui_cell_primary">';
                                htmlStr += '        <div class="weui_cell my-padding-0">';
                                var title = x.title;
                                if (title.length > 10) {
                                    title = title.slice(0, 10) + "...";
                                }
                                htmlStr += '        <div class="weui_cell_hd my-cell-list">' + title + '</div>';
                                htmlStr += '        <div class="my-date">' + formatTime(x.updatetime) + '</div>';
                                htmlStr += '        </div>';
                                htmlStr += '        <div class="my-padding-0">';
                                var introduction = x.introduction;
                                if (introduction.length > 10) {
                                    introduction = introduction.slice(0, 10) + "...";
                                }
                                htmlStr += '        <div class="weui_cell_hd my-cell-list2">' + introduction + '</div>';
                                htmlStr += '        </div>';
                                htmlStr += '        <div style="overflow: auto;">';
                                htmlStr += '        <ul class="my-submit-ul">';
                                htmlStr += '        <li class="my-submit-li"><img src="../../img/chats.png" alt="chats"><span>' + x.commentcount + '</span></li>';
                                htmlStr += '<li class="my-submit-li"><img src="../../img/views.png" alt="views"><span>' + x.readcount + '</span></li>';
                                htmlStr += '<li class="my-submit-li"><img src="../../img/zan.png" alt="zan"><span>' + x.supportcount + '</span></li>';
                                htmlStr += '        </ul>';
                                htmlStr += '        </div>';
                                htmlStr += '        </div>';
                                htmlStr += '        </div>';
                                htmlStr += '</div>';
                            }
                            $("#" + id).append(htmlStr);
                        })
                        var loadId = '';
                        if (materialType == 1) {
                            loadId = "#loadMoreText";
                        }
                        if (materialType == 2) {
                            loadId = "#loadMoreVoice";
                        }
                        if (materialType == 3) {
                            loadId = "#loadMoreVideo";
                        }
                        dealLoading(data.length, loadId)

                })
    }

    function loadMoreText(id){
        loading(id);
        findMaterialList();
    }

    function loadMoreVoice(id){
        loading(id);
        findMaterialList();
    }

    function loadMoreVideo(id){
        loading(id);
        findMaterialList();
    }

</script>
</body>
</html>