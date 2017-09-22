<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>

    <title>管理系统</title>
    <link rel="stylesheet" href="freecode/css/style.css"/>
    <jsp:include page="jsp/common/common_js_css.jsp" />
    <script type="text/javascript">
        DWZ.init("dwz/dwz.frag.xml", {
//            loginUrl:"/jsp/login_dialog.jsp", loginTitle:"登录",	// 弹出登录对话框
		    loginUrl:"login.jsp",	// 跳到登录页面
            statusCode:{ok:200, error:300, timeout:301}, //【可选】
            pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
            keys: {statusCode:"statusCode", message:"message"}, //【可选】
            ui:{hideMode:'offsets'}, //【可选】hideMode:navTab组件切换的隐藏方式，支持的值有’display’，’offsets’负数偏移位置的值，默认值为’display’
            debug:false,	// 调试模式 【true|false】
            callback:function(){
                initEnv();
                $("#themeList").theme({themeBase:"themes"}); // themeBase 相对于index页面的主题base路径
            }
        });
    </script>
</head>

<body scroll="no">
<div id="layout">
    <div id="header">
        <div id="navMenu">
            <ul>
                <li><a class="logo" target="_blank" href="http://www.baidu.com">LOGO</a></li>
                <li class="toggleCollapse_s"><span class="optmenu" >&nbsp;</span></li>
                <jsp:include page="/jsp/common/common_navmenu.jsp" />
            </ul>
        </div>
        <div id="userInfo">
            <span>欢迎您，<span>${sessionScope.adminuserrealname}</span> <a href="admin/adminuser/userLoginOut.action" title="确认退出吗？">退出</a></span>
        </div>
    </div>

    <div id="leftside">
        <div id="sidebar_s">
            <div class="collapse">
                <div class="toggleCollapse toggleCollapse_s"><span>&nbsp;</span></div>
            </div>
        </div>
        <jsp:include page="/jsp/common/common_framework.jsp" />

    </div>
    <div id="container">
        <div id="navTab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                    <ul class="navTab-tab">
                        <li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
                    </ul>
                </div>
                <div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
                <div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
                <div class="tabsMore">more</div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">我的主页</a></li>
            </ul>
            <div class="navTab-panel tabsPageContent layoutBox">
                <div class="page unitBox">

                    <%--<div class="pageFormContent" layoutH="80" style="padding: 10px 15px;">--%>
                       <%--<h1 class="comName fonts18 mBottom10">企业号名称:${qyName}</h1>--%>
                        <%--<h2 class="fonts16">(CropId:wx548437589347985)</h2>--%>
                        <%--<div class="lineCon">--%>
                            <%--<span class="viewState paddingL0">已关注 <strong class="sNo">${param.concernedCount}</strong></span>--%>
                            <%--<span class="viewState">未关注 <strong class="sNo">${param.notConcernedCount}</strong></span>--%>
                            <%--<span class="viewState">禁用 <strong class="sNo disableUse">${param.disabledCount}</strong></span>--%>
                            <%--<span class="viewState">管理员 <strong class="sNo">${adminCount}</strong></span>--%>
                        <%--</div>--%>
                        <%--<div class="lineCon lineCon2">--%>
                            <%--<span class="viewState2">已装应用数 <strong class="sNo">${param.agentcount}</strong></span>--%>
                            <%--<div style="overflow: hidden;float: left;">--%>
                            <%--<c:forEach var="a" items="${agentlist}" varStatus="s">--%>
                            <%--<div class="radiusRoundCon">--%>
                                <%--<span class="radiusRound" style="background-image: url('${a.squarelogourl}');background-size: 100%;"></span>--%>
                                <%--<span style="float:left; width: 70px;word-break: break-all;word-wrap: break-word;text-align: center;">${a.agentname}</span>--%>

                            <%--</div>--%>
                            <%--</c:forEach>--%>
                            <%--</div>--%>
                            <%--&lt;%&ndash;<div class="radiusRoundCon">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<span class="radiusRound">+</span>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<br>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;添加应用&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--</div>--%>
                        <%--<div>--%>
                            <%--<h3 class="comName fonts18 mBottom10">操作流程</h3>--%>
                            <%--<div class="progressCon">--%>
                                <%--<span class="progressItem">添加管理员</span>--%>
                                <%--<span class="doshedLine"></span>--%>
                                <%--<span class="progressItem">添加成员</span>--%>
                                <%--<span class="doshedLine"></span>--%>
                                <%--<span class="progressItem">添加承运商</span>--%>
                                <%--<span class="doshedLine"></span>--%>
                                <%--<span class="progressItem">添加仓库</span>--%>
                                <%--<span class="doshedLine"></span>--%>
                                <%--<span class="progressItem">日志查询</span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<label>企业号名称：${qyName}</label>--%>
                        <%--<label>(CropId:wx548437589347985)</label>--%>
                        <%--<br><br>--%>
                        <%--<hr>--%>
                        <%--<label>已关注 1000 | 未关注 1000 | 禁用 100 | 管理员 ${adminCount}</label>--%>
                        <%--<br><br>--%>
                        <%--<hr>--%>
                        <%--<label>已装应用数量 33 </label>--%>
                        <%--<br><br>--%>
                        <%--<hr>--%>
                        <%--<label>操作流程</label>--%>
                        <%--<iframe width="100%" height="430" class="share_self"  frameborder="0" scrolling="no" src="">--%>
                        <%--</iframe>--%>
                        <%--<iframe width="100%" height="550" class="share_self"  frameborder="0" scrolling="no" src="">--%>
                        <%--</iframe>--%>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<div id="footer">Copyright &copy; 2016 TCL </div>

<script type="text/javascript">
//    $("#id_username").html($.cookie("adminusername"));
</script>
</body>
</html>
