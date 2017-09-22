<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<ul>
    <c:forEach items="${treeList}" var="d">
        <li>
            <a href="admin/user/findGroupUserPageList.action?wxdeptid=${d.wxdeptid}" target="ajax" rel="jbsxBox">${d.deptname}</a>
            <c:if test="${fn:length(d.childDept) > 0}">
                <c:set var="treeList" value="${d.childDept}" scope="request" />
                <c:import url="/jsp/common/common_tree.jsp" />
            </c:if>
        </li>
    </c:forEach>
</ul>
