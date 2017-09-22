<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<ul>
    <c:forEach items="${treeList}" var="d">
        <li>
            <c:set var="nowDepts" value="${d.deptname}${d.deptid}" />
            <a  deptid="${d.deptid}" ${fn:contains(validDepts, nowDepts) ? "checked" : ""}>${d.deptname}</a>
            <c:if test="${fn:length(d.childDept) > 0}">
                <c:set var="treeList" value="${d.childDept}" scope="request" />
                <c:set var="validDepts" value="${validDepts}" scope="request" />
                <c:import url="/jsp/common/common_tree_new.jsp" />
            </c:if>
        </li>
    </c:forEach>
</ul>
