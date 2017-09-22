<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/jsp/common/common_jstl.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <c:if test="${usernameorpasswd =='error'}">
        用户名或密码不能为空
    </c:if>
    <%--<c:if test="${errortime =='error'}">--%>
        <%--登录错误次数过多，请稍后再试--%>
    <%--</c:if>--%>
    <c:if test="${error =='error'}">
      用户名或密码不正确，登录失败
    </c:if>
    <c:if test="${nostatus =='nostatus'}">
      该用户没有激活，请联系超级管理员。
    </c:if>
    <%--<c:if test="${kong =='null'}">--%>
      <%--该用户没有权限，请联系超级管理员。--%>
    <%--</c:if>--%>
</body>
</html>