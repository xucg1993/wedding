<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${modulename}</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no"/>
    <link rel="stylesheet" href="../../lib/weui.min.css">
    <link rel="stylesheet" href="../../lib/jquery-weui.css">
    <link rel="stylesheet" href="../../lib/plyr.css">
    <link rel="stylesheet" href="../../css/style.css?3dddd3=2332">
</head>

<body ontouchstart>
<input type="hidden" id="materialId" value="${material.materialid}">
<input type="hidden" id="moduleId" value="${moduleId}">
<input type="hidden" id="loginId" value="${loginId}">
<input type="hidden" id="readStatus" value="1">
<input type="hidden" id="readId" value="${readId}">
<input type="hidden" id="isShare" value="${isShare}">
<input type="hidden" id="title" value="${material.title}">
<input type="hidden" id="coverphotourl" value="${material.coverphotourl}">
<input type="hidden" id="materialType" value="${material.materialtype}">
<input type="hidden" id="mediaUrl" value="${material.mediaurl}">
<input type="hidden" id="introduction" value="${material.introduction}">
<div class="container">
    <div class="article">
        <div class="hd">
            <h1 class="page_title my-list-containt my-font-h1">${material.title}</h1>
        </div>
        <div class="bd">
            <div class="weui_panel">
                <div class="weui_panel_bd">
                    <div class="weui_media_box weui_media_text my-list-containt">
                        <ul class="weui_media_info" style="margin-top: 0;">
                            <div class="my-video-views">
                                <li class="weui_media_info_meta">${fn:substring(material.formatUpdatetime, 0, 10)} ${empty material.author ? '' : material.author}</li>
                            </div>


                            <div class="my-video-views">
                                <li class="weui_media_info_meta"><a class="company-link" href="javascript:;">酷友资讯</a></li>
                            </div>
                            <c:if test="${isShare != 3}">
                            <div class="my-video-views" onclick="openReadView()">
                                <li class="weui_media_info_meta"><img style="width: 14px;height: 12px;" src="../../img/views.png" alt="views"></li>
                                <li class="weui_media_info_meta">${material.readcount}</li>
                            </div>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <c:if test="${material.materialtype == 1}">
                    <article class="weui_article">
                        <section>
                            ${material.text}
                        </section>
                    </article>
                </c:if>
                <c:if test="${material.materialtype == 2}">
                    <section>
                        <audio controls>
                            <source src="${material.mediaurl}" type="audio/mp3">
                        </audio>
                    </section>
                </c:if>
                <c:if test="${material.materialtype == 3}">
                    <section>
                        <video style="width: 100%;height: 200px; object-fit: cover;" poster="${material.coverphotourl}" controls webkit-playsinline="true" playsinline="true">
                            <!-- Video files -->
                            <source src="${material.mediaurl}" type="video/mp4">

                            <!-- Text track file -->
                            <track kind="captions" label="English" srclang="en" src="https://cdn.selz.com/plyr/1.5/View_From_A_Blue_Moon_Trailer-HD.en.vtt" default>

                                <!-- Fallback for browsers that don't support the <video> element -->
                                <!-- <a href="https://cdn.selz.com/plyr/1.5/View_From_A_Blue_Moon_Trailer-HD.mp4" download>Download</a> -->
                        </video>
                    </section>
                </c:if>

                    <div class="weui_panel_bd">
                        <div class="weui_media_box weui_media_text my-list-containt">
                            <ul class="weui_media_info" style="margin-top: 0;">
                                <c:if test="${!empty material.link}">
                                <div class="my-video-views">
                                    <li onclick="location.href='${material.link}'" style="color: green">阅读原文</li>
                                </div>
                                </c:if>
                                <c:if test="${isShare != 3}">
                                <div class="my-video-views" onclick="zanClick()">
                                    <li class="weui_media_info_meta">
                                        <c:choose>
                                        <c:when test="${supportStatus == 2}">
                                        <img id="zan" style="width: 14px;height: 12px;" src="../../img/zan2.png" alt="views" name="2"></li>
                                    </c:when>
                                    <c:otherwise>
                                        <img id="zan" style="width: 14px;height: 12px;" src="../../img/zan.png" alt="views" name="1"></li>
                                    </c:otherwise>
                                    </c:choose>
                                    <li class="weui_media_info_meta company-link" id="zanCount">${material.supportcount}</li>
                                </div>
                                <div id="my-video-views" class="my-video-views my-zan-people" onclick="zanAllList()">
                                    <li class="weui_media_info_meta my-zan-peoples" id="zanList">
                                        <c:forEach items="${supportList}" var="s" varStatus="i">
                                            <c:choose>
                                                <c:when test="${i.last}">
                                                    <span wxid="${s.wxuserid}">${s.username}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span wxid="${s.wxuserid}">${s.username}、</span>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </li>
                                </div>
                                </c:if>
                            </ul>
                        </div>
                    </div>

            </div>
        </div>
    <c:if test="${isShare != 3}">
        <div class="ft">
            <div class="weui_panel_hd my-panel-hd">
                <span>评论（<span id="commentCount">${material.commentcount}</span>）</span>
                <a href="javascript:openComment('','',1,0,'');" class="weui_btn weui_btn_mini weui_btn_primary my-comment-icon">&emsp;</a>
            </div>
            <div class="my-list-containt" id="commentList">


            </div>
            <a id="loadMoreComment" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadMoreComment(this);">
                加载更多
            </a>

        </div>
    </c:if>
    </div>
</div>
<c:if test="${isShare != 3}">
<!-- 查看点赞详情 -->
<div id="zanPeopleList" class="weui-popup-container">
    <div class="weui-popup-overlay"></div>
    <div class="weui-popup-modal">
        <div class="weui_cells_title">
            <div class="weui-row">
                <div class="weui-col-100" style="text-align: right;">
                    <a href="javascript:closePop();" class="weui_btn weui_btn_mini weui_btn_primary">返回</a>
                </div>
            </div>
        </div>
        <div class="weui_cells weui_cells_access">
            <div id="userList"></div>
            <a id="loadMoreSupport" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadMoreSupport(this);">
                加载更多
            </a>
        </div>
    </div>
</div>

<!-- 留言弹窗 -->
<div id="chat" class="weui-popup-container">
    <input type="hidden" id="pwxid" value="">
    <input type="hidden" id="wxid" value="">
    <input type="hidden" id="commentId" value="">
    <input type="hidden" id="toUserName" value="">
    <div class="weui-popup-overlay"></div>
    <div class="weui-popup-modal">
        <div class="weui_cells_title">评论区</div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <textarea id="comment" class="weui_textarea" placeholder="请输入评论" rows="3" oninput="changeCount(this)"></textarea>
                    <div class="weui_textarea_counter"><span id="count">0</span>/120</div>
                    <div class="weui-row" id="showImg">

                    </div>
                    <div class="weui-row">
                        <div class="weui-col-10">
                            <img id="emoji-btn" style="width: 100%;" src="../../img/emoji.png">
                        </div>
                        <div class="weui-col-10" onclick="addImage();">
                            <label>
                                <img id="camera-btn" style="width: 100%;" src="../../img/camera.png">
                            </label>
                        </div>
                        <div class="weui-col-40" style="text-align: right;">
                        </div>
                        <div class="weui-col-40" style="text-align: right;">
                            <a id="commentSubBtn" href="javascript:subComment();" style="margin: 0;" class="weui_btn weui_btn_mini weui_btn_primary">提交</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="emoji-area" class="weui_cell" style="border-top:1px solid #ccc;">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui-row">
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/angry.png" alt="[生气]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/blush.png" alt="[害羞]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/clap.png" alt="[鼓掌]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/cold_sweat.png" alt="[冷汗]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/flushed.png" alt="[脸红]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/heart_eyes.png" alt="[爱慕]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/joy.png" alt="[笑哭]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/kissing_closed_eyes.png" alt="[亲亲]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/kissing_smiling_eyes.png" alt="[亲亲]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/laughing.png" alt="[大笑]">
                        </div>
                    </div>
                    <div class="weui-row">
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/mask.png" alt="[生病]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/ok_hand.png" alt="[好的]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/scream.png" alt="[惊恐]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/sleeping.png" alt="[瞌睡]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/smile.png" alt="[微笑]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/smirk.png" alt="[蔑视]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/sob.png" alt="[哭泣]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/stuck_out_tongue_winking_eye.png" alt="[吐舌]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/sunglasses.png" alt="[墨镜]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/sweat_smile.png" alt="[苦笑]">
                        </div>
                    </div>
                    <div class="weui-row">
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/thumbsup.png" alt="[拇指]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/wink.png" alt="[挤眼]">
                        </div>
                        <div class="weui-col-10 emoji">
                            <img style="width:100%;" src="../../img/emoji/worried.png" alt="[担心]">
                        </div>
                        <div class="weui-col-10 emoji">
                        </div>
                        <div class="weui-col-10 emoji">
                        </div>
                        <div class="weui-col-10 emoji">
                        </div>
                        <div class="weui-col-10 emoji">
                        </div>
                        <div class="weui-col-10 emoji">
                        </div>
                        <div class="weui-col-10 emoji">
                        </div>
                        <div class="weui-col-10 emoji">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="margin: 40px auto;width:60%;">
            <a href="javascript:closePop();" class="weui_btn weui_btn_plain_primary">返回</a>
        </div>
    </div>
</div>

<!-- 查看浏览记录 -->
<div id="viewsPeopleList" class="weui-popup-container">
    <div class="weui-popup-overlay"></div>
    <div class="weui-popup-modal">
        <div class="weui_cells_title">
            <div class="weui-row">
                <div class="weui-col-100">
                    <a href="javascript:closePop('#viewsPeopleList');" class="weui_btn weui_btn_mini weui_btn_primary">返回</a>
                </div>
            </div>
        </div>
        <div class="weui_search_bar">
            <form class="weui_search_outer">
                <div class="weui_search_inner">
                    <i class="weui_icon_search"></i>
                    <input type="search" id="userName" class="weui_search_input" id="search_input2" placeholder="搜索" required/>
                    <a href="javascript:" class="weui_icon_clear" id="search_clear2"></a>
                </div>
            </form>
            <a href="javascript:queryReadList();" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-left: 10px;background-color: #12b7f5;">搜索</a>
        </div>
        <div class="weui_cells weui_cells_access">
            <div id="readList">

            </div>
            <a id="loadMoreRead" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadingReadMore(this);">
                加载更多
            </a>
        </div>
    </div>
</div>
<div class="overlay" style="display:none; height:100%;width:100%;background-color:rgba(0,0,0,1);position:fixed;top:0; z-index: 99;" id="overlay"></div>
</c:if>
<style type="text/css" media="screen">
    .weui_cells:before{
        border-bottom: 0px solid #ccc;
        border-top: 0px solid #ccc;
    }
    .weui_cells:after{
        border-bottom: 0px solid #ccc;
        border-top: 0px solid #ccc;
    }
    .weui-photo-browser-modal{
        z-index: 999;
    }
    .weui_cells_access .weui_cell_ft:after{
        content: none;
    }
    li{
        padding-right: .5em!important;
    }
</style>
<script src="../../lib/jquery-latest.min.js"></script>
<script src="../../lib/fastclick.js"></script>
<script src="../../js/jweixin-1.1.0.js"></script>
<script src="../../js/weixin.js?1bbbdd=7hh"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
        $("#emoji-btn").click(function(){
            $("#emoji-area").toggle();
        })
        $(".weui-col-10.emoji").click(function(){
            var comment = $("#comment").val();
            if (comment.length + 4 > 120) {
                dialog("最多只能输入120个字符！");
            } else {
                $("#comment").val(comment + $(this).find('img').attr('alt'));
                $("#count").text(parseInt($("#count").text()) + 4);
            }

        })
        appendAllCommentList();
    });
</script>
<script src="../../lib/jquery-weui.js"></script>
<script src="../../lib/plyr.js"></script>
<script src="../../js/login.js?3111=dd"></script>
<script src="../../js/page.js?22=dd"></script>
<style>
    .weui_article{padding: 0px 15px;}
    .weui_article p{margin-top: 0!important;}
</style>
<script>
    (function() {
        // This is the bare minimum JavaScript. You can opt to pass no arguments to setup.
        // e.g. just plyr.setup(); and leave it at that if you have no need for events
        var instances = plyr.setup({
            // Output to console
            debug: true
        });

        // Get an element
        function get(selector) {
            return document.querySelector(selector);
        }

        // Custom event handler (just for demo)
        function on(element, type, callback) {
            if (!(element instanceof HTMLElement)) {
                element = get(element);
            }
            element.addEventListener(type, callback, false);
        }
    })();
    $(function(){
        initWeixin()
    })
    var commentStatus = 1;

    function closePop(){
        $.closePopup();
        $(".container").css("visibility","visible");
        $("#userList").empty();
        initPage();
    }

    function dialogPopUp(that){
        $("#comment").val('');
        $("#count").val(0);
        $(that).popup();
        $(".container").css("visibility","hidden");
        $("#emoji-area").hide();
    }

    var zanFunctionStatus = 0;
    function zanClick(){
//        if(zanFunctionStatus == 1){
//            return;
//        }
//        zanFunctionStatus = 1;
        var _this = $("#zan");
        var zanStatus = _this.attr("name");
        var zanAmount = parseInt($("#zanCount").text());
        var src = "";
        if (zanStatus == 1) {
            src = "../../img/zan2.png";
            zanStatus = 2;
            zanAmount += 1;

        }else{
            src = "../../img/zan.png";
            zanStatus = 1;
            zanAmount -= 1;
        }
        $.ajaxSettings.async = false; //设置getJson同步
        $.getJSON("/wedding/wx/support/supportMaterial.action", {materialId : $("#materialId").val(), status : zanStatus}, function(data){
            if (data.status == 1) {
                var wxUserId = data.wxUserId;
                var userName = data.userName;
                var lenCount = parseInt($("#zanList span").length);
                if (zanStatus == 2) {
                    if ( lenCount > 0) {
                        $("#zanList").prepend('<span wxid = "' + wxUserId + '" >' + userName + '、</span>')
                    }else{
                        $("#zanList").prepend('<span wxid = "' + wxUserId + '" >' + userName + '</span>')
                    }
                }
                if (zanStatus == 1) {
                    var _del = $('#zanList span[wxid="' + wxUserId + '"]');
                    var index = _del.index()
                    if (lenCount > 1) {
                        if (index == lenCount - 1) {
                            var newSpan = $('#zanList span:eq(' + (lenCount - 2) + ')');
                            newSpan.text(newSpan.text().slice(0, newSpan.text().length - 1))
                        }
                    }
                    _del.remove();
                }
                _this.attr("src", src);
                _this.attr("name", zanStatus);
                $("#zanCount").text(zanAmount);
            } else {
                dialog(data.message)
            }
        })
        $.ajaxSettings.async = true;//设置getJson异步
    }

    function zanAllList(){
        $("#zanPeopleList").popup();
        $.getJSON("/wedding/wx/support/findSupportList.action", {materialId : $("#materialId").val(),
            pageNum : pageNum*pageSize, pageSize : pageSize}, function(data){
            data.forEach(function(x){
                var headImgUrl = x.headimgurl;
                var htmlStr = '';
                htmlStr += '<a class="weui_cell" href="javascript:;">';
                htmlStr += '        <div class="weui_cell_hd">';
                if (headImgUrl == '' || headImgUrl == null || headImgUrl == undefined) {
                    htmlStr += '        <img class="my-cell-img my-commit-img" src="../../img/photo.jpg">';
                } else {
                    htmlStr += '        <img class="my-cell-img my-commit-img" src="' + headImgUrl + '">';
                }
                htmlStr += '        </div>';
                htmlStr += '        <div class="weui_cell_bd weui_cell_primary">';
                htmlStr += '        <p>' + x.username + '</p>';
                htmlStr += '        </div>';
                htmlStr += '</a>';
                $("#userList").append(htmlStr)
            })
            dealLoading(data.length, "#loadMoreSupport")

        })
    }
    var emojis = {
        '[生气]': '<img class="emojis" src="../../emoji/angry.png">',
        '[害羞]': '<img class="emojis" src="../../emoji/blush.png">',
        '[鼓掌]': '<img class="emojis" src="../../emoji/clap.png">',
        '[冷汗]': '<img class="emojis" src="../../emoji/cold_sweat.png">',
        '[脸红]': '<img class="emojis" src="../../emoji/flushed.png">',
        '[爱慕]': '<img class="emojis" src="../../emoji/heart_eyes.png">',
        '[笑哭]': '<img class="emojis" src="../../emoji/joy.png">',
        '[亲亲]': '<img class="emojis" src="../../emoji/kissing_closed_eyes.png">',
        '[调皮]': '<img class="emojis" src="../../emoji/kissing_smiling_eyes.png">',
        '[大笑]': '<img class="emojis" src="../../emoji/laughing.png">',
        '[生病]': '<img class="emojis" src="../../emoji/mask.png">',
        '[好的]': '<img class="emojis" src="../../emoji/ok_hand.png">',
        '[惊恐]': '<img class="emojis" src="../../emoji/scream.png">',
        '[瞌睡]': '<img class="emojis" src="../../emoji/sleeping.png">',
        '[微笑]': '<img class="emojis" src="../../emoji/smile.png">',
        '[蔑视]': '<img class="emojis" src="../../emoji/smirk.png">',
        '[哭泣]': '<img class="emojis" src="../../emoji/sob.png">',
        '[吐舌]': '<img class="emojis" src="../../emoji/stuck_out_tongue_winking_eye.png">',
        '[墨镜]': '<img class="emojis" src="../../emoji/sunglasses.png">',
        '[苦笑]': '<img class="emojis" src="../../emoji/sweat_smile.png">',
        '[拇指]': '<img class="emojis" src="../../emoji/thumbsup.png">',
        '[挤眼]': '<img class="emojis" src="../../emoji/wink.png">',
        '[担心]': '<img class="emojis" src="../../emoji/worried.png">'
    }


    function matchEmajis(sendVal){
        var com = '';
        var commetss = sendVal.match(/\[[^\]]+\]|./g);
        for (var i in commetss) {
            if (emojis[commetss[i]] != undefined) {
                commetss[i] = emojis[commetss[i]];
            }
            com += commetss[i];
        }
        return com;
    }
    /* 评论弹框 */
    function subComment(){

        var sendVal = $("#comment").val();
        var com = matchEmajis(sendVal);
        if ($.trim(sendVal) == "") {
            dialog("输入内容为空，请重新输入！");
        }else{
            if (commentStatus == 1) {
                appendFirstComment(sendVal, 1, "");
            } else {
                appendSecondComment(sendVal, 1, "");
            }

            closePop();
        }
    }

    function subImgComment(imgUrl){
        if (commentStatus == 1) {
            appendFirstComment("", 2, imgUrl);
        } else {
            appendSecondComment("", 2, imgUrl);
        }
        closePop();
    }


//    评论textarea内容匹配表情删除整个
    $('#comment').keydown(function(event) {
        var sendVal = $("textarea").val();
        if (event.keyCode == 8 && sendVal !="" ) {
            var commetss = sendVal.match(/\[[^\]]+\]|./g);
            if (emojis[commetss[commetss.length-1]] != 'undefined') {
                commetss.splice(commetss.length-1,1);
                sendVal = "";
                for(var i in commetss){
                    sendVal += commetss[i];
                };
                $("textarea").val(sendVal + "0")
            }
        }
    });
    function appendFirstComment(com, type, imgUrl){
        var wxUserId = "${user.wxuserid}"
        var userHeadImg = "${user.headimgurl}";
        var userName = "${user.username}";
        var comment = matchEmajis(com);
        $.getJSON("/wedding/wx/comment/insertComment.action", {
            fromuserid : wxUserId, touserid : "", content : encodeURIComponent(com), tocontentid : 0,
            materialid : $("#materialId").val(), type : type, imgurl : imgUrl, moduleid : $("#moduleId").val()
        }, function(data){
            if (data.status == 1) {
                var contentId = data.cid;
                var timeStr = data.sendtime;
                var htmlStr = '';
                htmlStr += '<div style="padding-bottom: 10px;" class="my-border-b">';
                htmlStr += '        <div class="weui_cells weui_cell_access my-margin-0 my-list">';
                htmlStr += '        <div class="weui_cell my-cell-d my-padding-bt0">';
                htmlStr += '        <div class="weui_cell_hd">';
                htmlStr += '        <img class="my-cell-img my-commit-img" src="' + userHeadImg + '" alt="icon">';
                htmlStr += '        </div>';
                htmlStr += '        <div class="weui_cell_bd weui_cell_primary">';
                htmlStr += '        <div class="weui_cell my-padding-0">';
                htmlStr += '        <div class="weui_cell_hd my-cell-list company-link"><a href="javascript:;"></a>' + userName + '</div>';
                htmlStr += '        <div class="my-date">' + timeStr + '</div>';
                htmlStr += '        </div>';
                htmlStr += '        <div class="my-padding-0" >';
                if (type == 2) {
                    comment = '<img style="width: 40px;height: 40px;" src="' + imgUrl + '"/>';
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black" onclick="dd(\'' + wxUserId + '\', \'' + wxUserId + '\', 2, ' +contentId + ', \'' + userName + '\', \''+ imgUrl + '\')">' + comment + '</div>';
                }else{
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black" onclick="openComment(\'' + wxUserId + '\', \'' + wxUserId + '\', 2, ' +contentId + ', \'' + userName + '\')">' + comment + '</div>';
                }
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '<div class="weui_cells weui_cell_access my-margin-0 my-list" id="' + contentId + '">';
                htmlStr += '</div>';
                htmlStr += '</div>';
                $("#commentList").prepend(htmlStr);
                $("#commentCount").text(parseInt($("#commentCount").text()) + 1)
            } else {
                dialog(data.message);
            }

        })
    }

    function openComment(pwxid, wxid, status, commentId, toUserName){
        if (status == 2) {
            $("#pwxid").val(pwxid)
            $("#wxid").val(wxid)
            $("#commentId").val(commentId)
            $("#toUserName").val(toUserName)
            commentStatus = 2;
            $("#comment").attr("placeholder","@" + toUserName)
        } else {
            commentStatus = 1;
            $("#comment").attr("placeholder","请输入评论")
        }

        dialogPopUp("#chat");
    }

    function appendSecondComment(com, type, imgUrl){
        var htmlStr = '';
//        var pWxId = $("#pwxid").val();
        var toWxUserId = $("#pwxid").val();
        var fromWxUserId = "${user.wxuserid}";
        var fromUserName = "${user.username}";
        var toContentId = $("#commentId").val();
        var toUserName = $("#toUserName").val();
        var comment = com;
        com = matchEmajis(com);
        $.getJSON("/wedding/wx/comment/insertComment.action", {
            fromuserid : fromWxUserId, touserid : toWxUserId, content : encodeURIComponent(comment), tocontentid : toContentId,
            materialid : $("#materialId").val(), type : type, imgurl : imgUrl, moduleid : $("#moduleId").val()
        }, function(data){
            if (type == 2) {
                com = '<img style="width: 40px;height: 40px;" src="' + imgUrl + '"/>';
            }
            if ($("#" + toContentId).find('div').length == 0) {
                htmlStr += '        <div class="weui_cell my-cell-d my-padding-bt0">';
                htmlStr += '        <div class="weui_cell_hd">';
                htmlStr += '        <span class="my-cell-img my-commit-img"></span>';
                htmlStr += '        </div>';
                htmlStr += '        <div class="weui_cell_bd weui_cell_primary my-commit-bg my-margin-5 my-padding-5" id="child_' + toContentId + '">';
                htmlStr += '        <em class="three-angle-logo"></em>';
                if (fromWxUserId == toWxUserId) {
                    if(type == 2){
                        htmlStr += '        <div class="my-padding-0" onclick="dd(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, ' + toContentId + ', \'' + fromUserName + '\', \'' + imgUrl + '\')">';
                    }else{
                        htmlStr += '        <div class="my-padding-0" onclick="openComment(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, ' + toContentId + ', \'' + fromUserName + '\')">';
                    }
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black"><a class="company-link" href="javascript:;">' + fromUserName + ':</a>' + com + '</div>';
                } else {
                    if(type == 2){
                        htmlStr += '        <div class="my-padding-0 my-margin-top5" onclick="dd(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, \''+ toContentId +'\', \'' + fromUserName + '\', \'' + imgUrl + '\')">';
                    }else{
                        htmlStr += '        <div class="my-padding-0 my-margin-top5" onclick="openComment(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, \''+ toContentId +'\', \'' + fromUserName +'\')">';
                    }
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black"><a class="company-link" href="javascript:;">' + fromUserName + '</a>回复<a class="company-link" href="javascript:;">' + toUserName + ':</a>' + com + '</div>';
                }
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                $("#" + toContentId).append(htmlStr)
            } else {
                if (fromWxUserId == toWxUserId) {
                    if(type == 2){
                        htmlStr += '        <div class="my-padding-0" onclick="dd(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, \'' + toContentId + '\', \'' + fromUserName +'\', \'' + imgUrl +  '\')">';
                    }else{
                        htmlStr += '        <div class="my-padding-0" onclick="openComment(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, \'' + toContentId + '\', \'' + fromUserName + '\')">';
                    }
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black"><a class="company-link" href="javascript:;">' + toUserName + ':</a>' + com + '</div>';
                    htmlStr += '        </div>';
                } else {
                    if(type == 2){
                        htmlStr += '        <div class="my-padding-0 my-margin-top5" onclick="dd(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, ' + toContentId + ', \'' + fromUserName +'\', \'' + imgUrl +  '\')">';
                    }else{
                        htmlStr += '        <div class="my-padding-0 my-margin-top5" onclick="openComment(\'' + fromWxUserId + '\', \'' + toWxUserId + '\', 2, ' + toContentId + ', \'' + fromUserName + '\')">';
                    }
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black"><a class="company-link" href="javascript:;">' + fromUserName + '</a>回复<a class="company-link" href="javascript:;">' + toUserName + ':</a>' + com + '</div>';
                    htmlStr += '        </div>';
                }
                $("#child_" + toContentId).append(htmlStr)
            }
        })

    }
    //图片点击执行选项
    function dd(fromWxUserId,toWxUserId,status,toContentId,fromUserName,src){
        $.modal({
            title: "提示",
            text: '<a href="javascript:bigger(\'' + src + '\');" class="weui_btn weui_btn_default">查看图片</a><a href="javascript:dealOpenComment(\'' + fromWxUserId + '\', \'' + toWxUserId + '\',' + status +', \'' + toContentId + '\', \'' + fromUserName + '\');" class="weui_btn weui_btn_default">回复评论</a>',
            buttons: [
                { text: "取消", className: "default", onClick: function(){} }
            ]
        });
    }
    function closeDialog1(){
        $.closeModal();
    }
    function dealOpenComment(fromWxUserId,toWxUserId,status,toContentId,fromUserName){
        closeDialog1();
        openComment(fromWxUserId,toWxUserId,status,toContentId,fromUserName);
    }
    function bigger(foo){
        closeDialog1()
        $("#overlay").fadeIn();
        $("#overlay").append("<img style='width:100%; margin-top:50px;' src='"+foo+"'>");
    }
    $("#overlay").click(function(){
        $("#overlay").fadeOut();
        $("#overlay img").remove();
    })
    function appendAllCommentList(){
        var materialId = $("#materialId").val();
        $.getJSON("/wedding/wx/comment/findAllComment.action", {materialid : materialId, pageNum : pageNum*pageSize, pageSize : pageSize}, function(data){
            data.forEach(function(x){
                var htmlStr = '';
                var headImgUrl = x.fromuserheadimgurl;
                var commentList = x.commentList;
                var toContentId = x.cid;
                var xContent = x.content;
                if (x.type == 2) {
                    xContent = '<img style="width: 40px;height: 40px;" src="' + x.imgurl + '"/>';
                } else {
                    xContent = matchEmajis(xContent);
                }
                htmlStr += '<div style="padding-bottom: 10px;" class="my-border-b">';
                htmlStr += '        <div class="weui_cells weui_cell_access my-margin-0 my-list">';
                htmlStr += '        <div class="weui_cell my-cell-d my-padding-bt0">';
                htmlStr += '        <div class="weui_cell_hd">';
                if (headImgUrl == '' || headImgUrl == null || headImgUrl == undefined) {
                    htmlStr += '        <img class="my-cell-img my-commit-img" src="../../img/photo.jpg" alt="icon">';
                } else {
                    htmlStr += '        <img class="my-cell-img my-commit-img" src="' + headImgUrl + '" alt="icon">';
                }
                htmlStr += '        </div>';
                htmlStr += '        <div class="weui_cell_bd weui_cell_primary">';
                htmlStr += '        <div class="weui_cell my-padding-0">';
                htmlStr += '        <div class="weui_cell_hd my-cell-list company-link"><a href="javascript:;"></a>' + x.fromusername + '</div>';
                htmlStr += '        <div class="my-date">' + x.timestr + '</div>';
                htmlStr += '        </div>';
                htmlStr += '        <div class="my-padding-0" >';
                if(x.type == 2){
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black" onclick="dd(\'' + x.fromuserid + '\', \'' + x.fromuserid + '\', 2, ' + toContentId + ', \'' + x.fromusername +'\', \'' + x.imgurl +  '\')">' + xContent + '</div>';
                }else{
                    htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black" onclick="openComment(\'' + x.fromuserid + '\', \'' + x.fromuserid + '\', 2, ' + toContentId + ', \'' + x.fromusername + '\')">' + xContent + '</div>';

                }
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '<div class="weui_cells weui_cell_access my-margin-0 my-list" id="' + toContentId + '">';
                if (commentList.length > 0) {
                    htmlStr += '        <div class="weui_cell my-cell-d my-padding-bt0">';
                    htmlStr += '        <div class="weui_cell_hd">';
                    htmlStr += '        <span class="my-cell-img my-commit-img"></span>';
                    htmlStr += '        </div>';
                    htmlStr += '        <div class="weui_cell_bd weui_cell_primary my-commit-bg my-margin-5 my-padding-5" id="child_' + toContentId + '">';
                    htmlStr += '        <em class="three-angle-logo"></em>';
                    commentList.forEach(function(c){
                        var cContent = c.content;
                        if (c.type == 2) {
                            cContent = '<img style="width: 40px;height: 40px;" src="' + c.imgurl + '"/>';
                        } else {
                            cContent = matchEmajis(cContent);
                        }
                        if (c.fromuserid == c.touserid) {
                            if(c.type == 2){
                                htmlStr += '        <div class="my-padding-0" onclick="dd(\'' + c.fromuserid + '\', \'' + c.touserid + '\', 2, ' + toContentId + ', \'' + c.fromusername + '\', \'' + c.imgurl +'\')">';
                            }else{
                                htmlStr += '        <div class="my-padding-0" onclick="openComment(\'' + c.fromuserid + '\', \'' + c.touserid + '\', 2, ' + toContentId + ', \'' + c.fromusername + '\')">';
                            }
                            htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black"><a class="company-link" href="javascript:;">' + c.fromusername + ':</a>' + cContent + '</div>';
                        } else {
                            if(c.type == 2){
                                htmlStr += '        <div class="my-padding-0 my-margin-top5" onclick="dd(\'' + c.fromuserid + '\', \'' + c.touserid + '\', 2, '+ toContentId +', \'' + c.fromusername + '\', \'' + c.imgurl +'\')">';
                            }else{
                                htmlStr += '        <div class="my-padding-0 my-margin-top5" onclick="openComment(\'' + c.fromuserid + '\', \'' + c.touserid + '\', 2, '+ toContentId +', \'' + c.fromusername + '\')">';
                            }
                            htmlStr += '        <div class="weui_cell_hd my-message-line my-font-black"><a class="company-link" href="javascript:;">' + c.fromusername + '</a>回复<a class="company-link" href="javascript:;">' + c.tousername + ':</a>' + cContent + '</div>';
                        }
                        htmlStr += '        </div>';
                    })
                    htmlStr += '        </div>';
                    htmlStr += '        </div>';
                }
                htmlStr += '</div>';
                htmlStr += '</div>';
                $("#commentList").append(htmlStr);
            })
            dealLoading(data.length, "#loadMoreComment");
        })
    }
    function dialog(content){
        $.alert({
            text: content,
            onOK: function () {
                //点击确认
            }
        });
    }

    function changeCount(obj){
        var val = $(obj).val();
        var len = val.length;
        if (len > 120) {
            dialog("最多只能输入120个字符！");
            $(obj).val(val.slice(0,120));
            $("#count").text(120);
        } else {
            $("#count").text(len);
        }

    }

    function addImage(){
//        subImgComment("../../img/photo.jpg", "../../img/photo.jpg")
        camera.chooseImage();
    }

    function appendImage(imgUrl){
        var htmlStr = '';
        htmlStr += '<div class="weui-col-20" style="position:relative;">';
        htmlStr += '    <img onclick="" src="' + imgUrl + '" style="width: 100%;" alt="">';
        htmlStr += '    <i class="weui_icon_cancel" onclick="delImage(this)" style="position: absolute;right:-10px;top: -12px;"></i>';
        htmlStr += '</div>';
        $("#showImg").append(htmlStr)
    }

    function delImage(obj){
        $(obj).parent().remove()
    }

    function openReadView(){
        dialogPopUp("#viewsPeopleList")
        $("#readList").empty();
        readList();
    }

    function queryReadList(){
        $("#readList").empty();
        readList();
    }

    function readList(){
        $.getJSON("/wedding/wx/statistics/findReadHistoryList.action",
                {materialId : $("#materialId").val(), userName : encodeURIComponent($("#userName").val()),
                pageNum : pageNum*pageSize, pageSize : pageSize}, function(data){
                    data.forEach(function(x){
                        var headImg = x.headimgurl;
                        var htmlStr = '';
                        htmlStr += '<a class="weui_cell" href="javascript:;">';
                        htmlStr += '<div class="weui_cell_hd">';
                        if (headImg == '' || headImg == null || headImg == undefined) {
                            htmlStr += '<img class="my-cell-img my-commit-img" src="../../img/photo.jpg">';
                        } else {
                            htmlStr += '<img class="my-cell-img my-commit-img" src="' + headImg + '">';
                        }
                        htmlStr += '</div>';
                        htmlStr += '<div class="weui_cell_bd weui_cell_primary">';
                        htmlStr += '<p>' + x.username + '</p>';
                        htmlStr += '</div>';
                        htmlStr += '<div class="weui_cell_ft">';
                        htmlStr += '<p>' + formatTime(x.readtime) + '</p>';
                        htmlStr += '</div>';
                        htmlStr += '</a>';
                        $("#readList").append(htmlStr);
                    })
                    dealLoading(data.length, "#loadMoreRead");
                })

    }

    function loadingReadMore(id){
        loading(id)
        readList();
    }

    function loadMoreSupport(id){
        loading(id)
        zanAllList();
    }

    var cPageNum = 0;

    function loadMoreComment(id){
        loading(id);
        appendAllCommentList();
    }

    /*  拍照 */
    var camera = {
        chooseImage: function () {
            wx.chooseImage({
                count: 1,
                sizeType: ['compressed'], // 可以指定是原图还是压缩图，默认二者都有
                success: function (res) {
                    var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
                    camera.uploadImage(localIds);
                }
            });
        },

        uploadImage: function (localIds) {
            var localId = localIds.pop();
            wx.uploadImage({
                localId: localId, // 需要上传的图片的本地ID，由chooseImage接口获得
                isShowProgressTips: 1,// 默认为1，显示进度提示
                success: function (res) {
                    var serverId = res.serverId; // 返回图片的服务器端ID
                    $.getJSON('/wedding/wx/uploadImage.action',{mediaId : serverId},function(res){
                        subImgComment(res.imgurl)
                    })


                }
            });
        }
    };

</script>
</body>
</html>
