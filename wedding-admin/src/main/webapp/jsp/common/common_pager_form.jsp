<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<form id="pagerForm" method="post" action="#rel#">
    <input type="hidden" name="pageNum" value="${vo.pageNum}" />
    <input type="hidden" name="numPerPage" value="${vo.numPerPage}" />
    <input type="hidden" name="orderField" value="${vo.orderField}" />
    <input type="hidden" name="orderDirection" value="${vo.orderDirection}" />
</form>

<c:set var="targetType" value="${empty param.targetType ? 'navTab' : param.targetType}"/>
<div class="panelBar">
    <div class="pages">
        <span>每页 </span>
        <select name="pageSize" onchange="dwzPageBreak({targetType:'${targetType}',data:{numPerPage:this.value}})" class="combox">
            <c:forEach begin="10" end="40" step="10" varStatus="s">
                <option value="${s.index}" ${vo.numPerPage eq s.index ? 'selected="selected"' : ''}>${s.index}</option>
            </c:forEach>
        </select>
        <span> 共 ${vo.totalCount} 条结果</span>
    </div>

    <div class="pagination" targetType="${targetType}" totalCount="${vo.totalCount}" numPerPage="${vo.numPerPage}" pageNumShown="10" currentPage="${vo.pageNum}"></div>
</div>