<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="assets/css/home.css">
    <link rel="stylesheet" href="assets/css/form.css">
    <link rel="stylesheet" href="assets/css/button.css">
    <link rel="stylesheet" href="assets/css/login_register.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/ctrl_filename.js"></script>
    <script type="text/javascript">
        function showLoginForm() {
            document.getElementById("registerForm").style.display = "none";
            document.getElementById("loginForm").style.display = "";
        }

        function showRegisterForm() {
            document.getElementById("loginForm").style.display = "none";
            document.getElementById("registerForm").style.display = "";
        }

        function changeCompany() {
            var type = document.getElementById("company").value;
            if (type === 2) {
                document.getElementById("company").style.display = "";
            } else {
                document.getElementById("company").style.display = "none";
            }
        }
    </script>
</head>
<body>
<%@include file="header.jsp" %>

<div class="banner">
    <div align="center">
        <b style="font-size: xx-large;">登录与注册</b>

    </div>
</div>

<%@include file="login_bar.jsp"%>

<br>
<br>
<div align="center">

    <form action="UserLogin" method="post" id="loginForm">
        <table class="table-wrapper">
            <tr>
                <td class="selected">
                    <div class="panel">登录</div>
                </td>
                <td class="default" onclick="showRegisterForm()">
                    <div class="panel">注册</div>
                </td>
            </tr>
            <tr>
                <td style="width: 400px" colspan="2">
                    <input type="text" name="user.account" value="" placeholder="用户名"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px" colspan="2">
                    <input type="password" name="user.password" value="" placeholder="密码"/>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input class="button special" type="submit" name="cover" value="登录"/>
                </td>
            </tr>
        </table>
    </form>

    <form action="UserRegister" method="post" id="registerForm" style="display: none">
        <table class="table-wrapper">
            <tr>
                <td class="default" onclick="showLoginForm()">
                    <div style="text-align: center; vertical-align: middle;font-size: large">登录</div>
                </td>
                <td class="selected">
                    <div style="text-align: center; vertical-align: middle;font-size: large">注册</div>
                </td>
            </tr>
            <tr>
                <td style="width: 400px" colspan="2">
                    <input type="text" name="user.account" value="" placeholder="用户名"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px" colspan="2">
                    <input type="password" name="user.password" value="" placeholder="密码"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px;display: none" colspan="2" id="company">
                    <input type="text" name="user.company" value="" placeholder="所属公司"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px;" colspan="2">
                    <div class="select-wrapper">
                        <select name="user.authority" title="用户类型" onchange="changeCompany()">
                            <option value="none">
                                - 用户类型 -
                            </option>
                            <option value="2">
                                开发者
                            </option>
                            <option value="1">
                                玩家
                            </option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 400px;padding-top: 5px;" colspan="2">
                    <div align="center" style="padding-top: 5px;">
                        <input type="radio" id="male" name="user.gender" checked value="1"><label for="male">男</label>
                        <input type="radio" id="female" name="user.gender" value="2"><label for="female">女</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input class="button special" type="submit" name="cover" value="注册"/>
                </td>
                <td align="center">
                    <input class="button special" type="reset" name="cover" value="重置"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div>
    <s:property value="#request.message"/>
</div>

</body>
</html>
