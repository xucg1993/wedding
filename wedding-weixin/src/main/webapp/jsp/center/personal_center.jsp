<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<html>
<head>
    <title>个人中心</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <%@ include file="/jsp/common/common_js_css.jsp" %>
</head>

<body ontouchstart>
<input type="hidden" id="moduleId" value="${moduleId}">
<input type="hidden" id="loginId" value="${loginId}">
<div class="weui_cells weui_cells_access my-margin-0">
    <a class="weui_cell" href="javascript:goHistory();">
        <div class="weui_cell_bd weui_cell_primary">
            <p>阅读历史</p>
        </div>
        <div class="weui_cell_ft">&emsp;&emsp;</div>
    </a>
    <c:if test="${isHasApproval}">
        <a class="weui_cell" href="javascript:goApproval();">
            <div class="weui_cell_bd weui_cell_primary">
                <p>我的审批</p>
            </div>
            <div class="weui_cell_ft">&emsp;&emsp;</div>
        </a>
    </c:if>
</div>
<script src="../../js/login.js?999=22"></script>
<script src="../../js/jweixin-1.1.0.js"></script>
<script src="../../js/weixin.js?dd=22"></script>
<script>
    $(function() {
        initWeixin();
        FastClick.attach(document.body);
    });

    function goHistory(){
        clearAllInterval();
        location.href = "/wedding/wx/readingrecord/forReadingRecordView.action";
        ;
    }

    function goApproval(){
        clearAllInterval();
        location.href = "/wedding/wx/center/approvalView.action?moduleId=" + $("#moduleId").val() + "&loginId=" + $("#loginId").val();
    }
</script>
<script src="../../lib/jquery-weui.min.js"></script>
</body>
</html>