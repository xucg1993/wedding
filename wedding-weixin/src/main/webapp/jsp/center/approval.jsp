<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的审批</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no, email=no"/>
    <%@ include file="/jsp/common/common_js_css.jsp" %>
</head>

<body ontouchstart>
<input type="hidden" id="moduleId" value="${moduleId}">
<input type="hidden" id="loginId" value="${loginId}">
<div class="weui_tab" id='page-infinite-navbar'>
<div class="weui_navbar mynavbar" style="position: fixed;top: 0;left: 0;z-index: 999;">
    <a href='#tab1' class="weui_navbar_item weui_bar_item_on" alt="wait-approval">
        未审批
    </a>
    <a href='#tab2' class="weui_navbar_item" alt="already-approval">
        已审批
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
        <a href="javascript:initData();" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-left: 10px;background-color: #12b7f5;">搜索</a>
    </div>
    <div class="my-list-containt">
        <div  id="wait-approval">

        </div>
        <a id="loadMoreWaitApproval" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadMoreWaitApproval(this);">
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
        <a href="javascript:initData();" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-left: 10px;background-color: #12b7f5;">搜索</a>
    </div>
    <div class="my-list-containt">
        <div id="already-approval"></div>
        <a id="loadMoreAlreadyApproval" class="weui_cell" style="text-align:center;display:block;color: #cecece;box-sizing: border-box;" href="javascript:loadMoreAlreadyApproval(this);">
            加载更多
        </a>
    </div>
</div>
</div>
</div>
</body>
<script src="../../js/login.js?31111=22"></script>
<script src="../../js/page.js?322=2dd2"></script>
<script src="../../js/jweixin-1.1.0.js"></script>
<script src="../../js/weixin.js?dd=22"></script>
<script>
    $(function() {
        initWeixin();
        FastClick.attach(document.body);
        $(".weui_navbar_item").click(function(){
            initPage();
            var id = $(this).attr("alt");
            $("#" + id).empty();
            appendList(id);
        })
        appendWaitApproval();
    });

    function initData(){
        var id = $(".weui_bar_item_on").attr('alt')
        $("#" + id).empty();
        appendList(id);
    }

    function loadMoreAlreadyApproval(id){
        loading(id);
        initData();
    }

    function loadMoreWaitApproval(id){
        loading(id);
        initData();
    }

    function appendList(id){
        if (id == 'wait-approval') {
            appendWaitApproval("#loadMoreWaitApproval");
        }
        if (id == 'already-approval') {
            appendAlreadyApproval("#loadMoreAlreadyApproval")
        }
    }
    function appendWaitApproval(id){
        $.getJSON("/wedding/wx/center/findApprovalList.action", {pageNum : pageNum*pageSize, pageSize : pageSize, status : 1, title : $("#search_input").val()}, function(data){
            data.forEach(function(x){
                var htmlStr = '';
                htmlStr += '<div class="weui_cells weui_cell_access my-margin-0 my-list" >';
                htmlStr += '        <div class="weui_cell">';
                htmlStr += '        <div class="weui_cell_hd" onclick="materialDetail(' + x.materialid + ')">';
                htmlStr += '        <img class="my-cell-img" src="' + x.coverphotourl + '" alt="icon">';
                htmlStr += '        </div>';
                htmlStr += '        <div class="weui_cell_bd weui_cell_primary" style="width: 100%;">';
                htmlStr += '        <div class="weui_cell my-padding-0">';
                var title = x.title;
                if (title.length > 10) {
                    title = title.slice(0, 10) + "...";
                }
                htmlStr += '        <div class="weui_cell_hd my-cell-list"  onclick="materialDetail(' + x.materialid + ')">' + title + '</div>';
                htmlStr += '        <div class="my-date">' + formatTime(x.updatetime) + '</div>';
                htmlStr += '        </div>';
                htmlStr += '        <div class="my-padding-0">';
                var introduction = x.introduction;
                if (introduction.length > 10) {
                    introduction = introduction.slice(0, 10) + "...";
                }
                htmlStr += '        <div class="weui_cell_hd my-cell-list2">' + introduction + '</div>';
                htmlStr += '        </div>';
                htmlStr += '<div style="text-align: right;">';
                htmlStr += '        <a href="javascript:;" style="background-color: ' + x.backgroupcode + ';background-image:url(' + x.modulelogourl + ')" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0 my-index-state-logo">&emsp;</a>';
                htmlStr += '<span class="my-index-state">' + x.modulename + '</span>';
                htmlStr += '        <a href="javascript:alertDialog(1,' + x.uuid + ',' + x.materialid + ',' + x.moduleid + ');" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-top: 10px;background-color: #32b16c;margin-right:5px;">审批</a>';
                htmlStr += '        <a href="javascript:javascript:alertDialog(2,' + x.uuid + ',' + x.materialid + ',' + x.moduleid + ');" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0" style="margin-top: 10px;background-color: #32b16c;">拒绝</a>';
                htmlStr += '        </div>';

                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '</div>';
                $("#wait-approval").append(htmlStr);
            })
            dealLoading(data.length, id)
        })

    }
    function appendAlreadyApproval(id){
        $.getJSON("/wedding/wx/center/findApprovalList.action", {pageNum : pageNum*pageSize, pageSize : pageSize, status : 2, title : $("#search_input2").val()}, function(data){
            data.forEach(function(x){
                var htmlStr = '';
                htmlStr += '<div class="weui_cells weui_cell_access my-margin-0 my-list">';
                htmlStr += '        <div class="weui_cell my-cell-d">';
                htmlStr += '        <div class="weui_cell_hd" onclick="materialDetail(' + x.materialid + ')">';
                htmlStr += '        <img class="my-cell-img" src="' + x.coverphotourl + '" alt="icon">';
                htmlStr += '        </div>';
                htmlStr += '        <div class="weui_cell_bd weui_cell_primary" style="width: 100%;">';
                htmlStr += '        <div class="weui_cell my-padding-0">';
                htmlStr += '        <div class="weui_cell_hd my-cell-list" onclick="materialDetail(' + x.materialid + ')">' + x.title + '</div>';
                htmlStr += '        <div class="my-date">' + formatTime(x.updatetime) + '</div>';
                htmlStr += '        </div>';
                htmlStr += '        <div class="my-padding-0">';
                var introduction = x.introduction;
                if (introduction.length > 10) {
                    introduction = introduction.slice(0, 10) + "...";
                }
                htmlStr += '        <div class="weui_cell_hd my-cell-list2">' + introduction + '</div>';
                htmlStr += '        </div>';
                htmlStr += '        <div style="text-align: right;">';
                htmlStr += '<a href="javascript:;" style="background-color: ' + x.backgroupcode + ';background-image:url(' + x.modulelogourl + ')" class="weui_btn weui_btn_mini weui_btn_primary my-margin-0 my-index-state-logo my-index-state-logo2">&emsp;</a>';
                htmlStr += '<span class="my-index-state my-index-state2">' + x.modulename + '</span>';
                htmlStr += '        </div>';
                htmlStr += '        <div class="my-approved" style="text-align: right;">';
                if (x.approvalstatus == 2) {
                    htmlStr += '        <img class="my-approvedImg" src="../../img/approved.png" alt="">';
                }
                if (x.approvalstatus == 3) {
                    htmlStr += '        <img class="my-approvedImg" src="../../img/reject.png" alt="">';
                }
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '        </div>';
                htmlStr += '</div>';
                $("#already-approval").append(htmlStr);
            })
            dealLoading(data.length, id)
        })
    }

    function alertDialog(status, uuid, materialId, moduleId){
        var message = '';
        if (status == 1) {
            message = '确认要审批通过吗？';
        }
        if (status == 2) {
            message = '确认拒绝此次审批吗？';
        }
        $.confirm({
            title: '温馨提示',
            text: message,
            onOK: function () {
                if (status == 1) {
                    approvalEvent(uuid, 2, materialId, moduleId);
                }
                if (status == 2) {
                    approvalEvent(uuid, 3, materialId, moduleId);
                }
            },
            onCancel: function () {
            }
        })
    }

    function approvalEvent(uuid, status, materialId, moduleId){
        $.getJSON("/wedding/wx/center/approvalEvent.action", {uuid : uuid, status : status, materialId : materialId, moduleId : moduleId}, function(data){
            initData();
        })
    }

    function materialDetail(materialId){
        clearAllInterval();
        location.href = "/wedding/wx/material/materialDetail.action?materialId=" + materialId + "&moduleId=" + $("#moduleId").val() + "&loginId=" + $("#loginId").val();;
    }

</script>

</html>