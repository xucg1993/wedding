<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>酷友门户网站管理系统</title>
    <link href="dwz/themes/css/login.css" rel="stylesheet" type="text/css" />
    <script src="dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
    <%--<script src="js/base64.js" type="text/javascript"></script>--%>
    <script src="js/base64.min.js" type="text/javascript"></script>

</head>

<body>
<div id="login">
    <div id="login_header">
        <h1 class="login_logo">
            <a href="javascript:"><img src="dwz/themes/css/images/logo_small.png" /></a>
        </h1>
        <div class="login_headerContent">
            <div class="navList">
                <ul>

                </ul>
            </div>
            <h2 class="login_title">酷友门户网站管理系统</h2>
        </div>
    </div>
    <div id="login_content">
        <div class="loginForm">
            <form id="f_form" action="admin/adminuser/userLogin.action" method="post">
                <input id="h_password" type="hidden"  name="password"/>
                <p class="error">&nbsp;${param.message}</p>
                <p>
                    <label>用户名：</label>
                    <input type="text" id="t_username" name="username" size="20" class="textInput" />
                </p>
                <p>
                    <label>密&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" id="t_password" size="20" class="textInput" />
                </p>
                <p>
                    <input type="button" value="登 录" class="submit" onclick="check()" />
                </p>
            </form>
        </div>
        <div class="login_banner"></div>

        <div class="login_main">
            <%--<ul class="helpList">--%>
                <%--<li><a>忘记密码怎么办？</a></li>--%>
            <%--</ul>--%>
            <div class="login_inner">
                <!--
                <p>创意感动生活</p>
                <p>The Creative Life</p>
                -->
            </div>
        </div>
    </div>
    <div id="login_footer">
        Copyright &copy; 2016 tcl
    </div>
</div>

<script type="text/javascript">
    function check() {
        var username = $("#t_username").val();
        var password = $("#t_password").val();
        if (username == "") {
            alert("请输入用户名");
            $("#t_username").focus();
            return false;
        }

        if (password == "") {
            alert("请输入密码");
            $("#t_password").focus();
            return false;
        }

        $("#h_password").val(md5(password));

        $("#f_form").submit();
    }
    function md5(name) {
        return Base64.encode(name);
    }
</script>

</body>
</html>