<%@ page contentType="text/html;charset=UTF-8" language="java" %>
{
"statusCode":"${statusCode}",
"message":"${message}",
"confirmMsg":"${param.callbackType eq 'forwardConfirm' ? message : ''}",
"navTabId":"${navTabId}",
"rel":"${rel}",
"callbackType":"${callbackType}",
"forwardUrl":"${forwardUrl}"
}

