<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>

<div id="sidebar">
    <!--<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>-->

    <div class="accordion" fillSpace="sidebar">
        <div class="accordionHeader">
            <h2><span>Folder</span>组织管理</h2>
        </div>
        <div class="accordionContent">
            <ul class="menulist">
                <li>
                    <ul>
                        <li><a href="admin/dept/forGroupList.action" target="navTab" rel="r_group" title="员工列表">组织列表</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="accordionHeader">
            <h2><span>Folder</span>模块管理</h2>
        </div>
        <div class="accordionContent">
            <ul class="menulist">
                <%--<li><a>模块</a>--%>
                <li>
                    <ul>
                        <li><a href="admin/module/findModulePageList.action" target="navTab" rel="r_module"
                               title="模板列表">模块列表</a></li>
                    </ul>
                </li>
                <%--<c:if test="${fn:contains(sessionScope.fun,'moban_bumenquanxianguanli' )}">--%>
                <%--<li><a>模块_部门权限管理</a>--%>
                <%--<ul>--%>
                <%--<li><a href="admin/deptmodule/findDeptModulePageList.action" target="navTab" rel="r_driver"--%>
                <%--title="关系列表">关系列表</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
                <%--</c:if>--%>
                <%--<c:if test="${fn:contains(sessionScope.fun,'moban_renyuanguanli' )}">--%>
                <%--<li><a>模块_人员权限管理</a>--%>
                <%--<ul>--%>
                <%--<li><a href="admin/userrelmodule/findAllUserRelModulePageList.action" target="navTab"--%>
                <%--rel="r_driver" title="关系列表">关系列表</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
                <%--</c:if>--%>
            </ul>
        </div>
        <div class="accordionHeader">
            <h2><span>Folder</span>素材管理</h2>
        </div>
        <div class="accordionContent">
            <ul class="menulist">
                <li><a>素材库</a>
                    <ul>
                        <li><a href="admin/material/findMaterialPageList.action" target="navTab" rel="r_material_list"
                               title="素材列表">素材列表</a></li>
                    </ul>
                </li>

            </ul>
            <ul class="menulist">
                <li><a>审批</a>
                    <ul>
                        <li><a href="admin/approval/findApprovalPageList.action" target="navTab" rel="r_driver"
                               title="审批列表">审批列表</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="accordionHeader">
            <h2><span>Folder</span>统计管理</h2>
        </div>
        <div class="accordionContent">
            <ul class="menulist">
                <li><a>登录统计</a>
                    <ul>
                        <li><a href="admin/loginrecord/findLoginRecordList.action" target="navTab" rel="r_user"
                               title="已登录人员统计">
                            已登录人员统计</a></li>
                        <li><a href="admin/loginrecord/findUnLoginUserList.action" target="navTab" rel="r_user"
                               title="未登录人员统计">
                            未登录人员统计</a></li>
                    </ul>
                </li>
                <li><a>留言统计</a>
                    <ul>
                        <li><a href="admin/comment/listComment.action" target="navTab" rel="r_comment" title="留言统计">
                            留言统计</a></li>
                    </ul>
                </li>
                <li><a>点赞统计</a>
                    <ul>
                        <li><a href="admin/support/findSupportPageList.action" target="navTab" rel="r_user"
                               title="点赞统计">
                            点赞统计</a></li>
                    </ul>
                </li>
                <li><a>阅读统计</a>
                    <ul>
                        <li><a href="admin/readingrecord/findReadingRecordList.action" target="navTab"
                               rel="r_reader" title="已阅读人员统计">
                            已阅读人员统计</a></li>
                        <li><a href="admin/readingrecord/findUnReadingUserList.action" target="navTab"
                               rel="r_reader" title="未阅读人员统计">
                            未阅读人员统计</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="accordionHeader">
            <h2><span>Folder</span>权限管理</h2>
        </div>
        <div class="accordionContent">
            <ul class="menulist">
                <li>
                    <%--<a>权限管理</a>--%>
                    <%--<ul>--%>
                    <%--<li><a href="admin/function/findFunctionList.action" target="navTab" rel="r_power" title="权限管理">权限管理</a>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <ul>
                        <li><a href="admin/power/PowerRole.action" target="navTab" rel="r_role" title="角色管理">角色管理</a>
                        </li>
                    </ul>
                    <ul>
                        <li><a href="admin/power/PowerUser.action" target="navTab" rel="r_power_user"
                               title="用户管理">用户管理</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
    appendToken();
</script>