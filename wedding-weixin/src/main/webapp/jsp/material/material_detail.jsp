<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../lib/weui.min.css">
    <link rel="stylesheet" href="../../lib/jquery-weui.css">
    <link rel="stylesheet" href="../../lib/plyr.css">
    <link rel="stylesheet" href="../../css/style.css">
</head>

<body ontouchstart>
<input type="hidden" id="moduleId" value="${moduleId}">
<input type="hidden" id="loginId" value="${loginId}">
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
                            <%--<div class="my-video-views">--%>
                                <%--<li class="weui_media_info_meta"><img style="width: 16px;height: 14px;" src="../../img/views.png" alt="views"></li>--%>
                                <%--<li class="weui_media_info_meta">999</li>--%>
                            <%--</div>--%>

                        </ul>
                    </div>
                </div>
                <c:if test="${material.materialtype == 1}">
                    <article class="weui_article">
                        <section>
                            <p>&emsp;&emsp;${material.text}</p>
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
                <c:if test="${!empty material.link}">
                <div class="weui_panel_bd">
                    <div class="weui_media_box weui_media_text my-list-containt">
                        <ul class="weui_media_info" style="margin-top: 0;">
                            <div class="my-video-views">
                                <li onclick="location.href='${material.link}'" style="color: green">阅读原文</li>
                            </div>
                        </ul>
                    </div>
                </div>
                </c:if>
            </div>
        </div>
        <%--<div class="ft">--%>
            <%--<div class="weui_panel_hd" style="border-bottom: 0;background-color: #cbcbcb; font-size: 14px;">评论（3）</div>--%>
            <%--<div class="my-list-containt">--%>
                <%--<div class="weui_cells weui_cell_access my-margin-0 my-list">--%>
                    <%--<div class="weui_cell my-cell-d">--%>
                        <%--<div class="weui_cell_hd">--%>
                            <%--<img class="my-cell-img my-commit-img" src="../../img/photo.jpg" alt="icon">--%>
                        <%--</div>--%>
                        <%--<div class="weui_cell_bd weui_cell_primary">--%>
                            <%--<div class="weui_cell my-padding-0">--%>
                                <%--<div class="weui_cell_hd my-cell-list company-link"><a href="javascript:;"></a>徐晨光</div>--%>
                                <%--<div class="my-date">2016-08-18</div>--%>
                            <%--</div>--%>
                            <%--<div class="my-padding-0">--%>
                                <%--<div class="weui_cell_hd my-cell-list2 my-font-black">马蓉出轨了，王宝强</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>
<script src="../../lib/jquery-latest.min.js"></script>
<script src="../../lib/fastclick.js"></script>
<script src="../../js/jweixin-1.1.0.js"></script>
<script src="../../js/weixin.js?dd=22"></script>
<script src="../../lib/jquery-weui.js"></script>
<script src="../../lib/plyr.js"></script>
<script src="../../js/login.js?22=11"></script>
<style>
    .weui_article{padding: 0px 15px;}
    .weui_article p{margin-top: 0!important;}
</style>
<script>
    $(function() {
        initWeixin();
        FastClick.attach(document.body);
    });
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
</script>
</body>
</html>
