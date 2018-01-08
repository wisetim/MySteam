<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 2018/1/7
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>开发者主页</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale="/>
    <%--<link rel="stylesheet" href="assets/css/main.css"/>--%>
    <link rel="stylesheet" href="assets/css/button.css"/>
    <link rel="stylesheet" href="assets/css/dvlpr_main.css"/>
</head>
<body>

<%@include file="header_lib.jsp" %>

<div class="banner">
    <h1 align="center">DEVELOPER GAME MANAGE CENTER</h1>
    <%--<hr style="height:1px;border:none;border-top:1px ridge #51ff08;"/>--%>
</div>
<br>
<br>
<%--<h2 style="color: #127f1b; text-align: center; border: dashed #4da00c 1px">MY GAME LIBRARY</h2>--%>
<div>
    <table align="center" class="table-wrapper" cellspacing="10">
        <tr>
            <td colspan="6" align="center">
                <h2 class="title">MY GAME LIBRARY</h2>
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <div class="first">
                    <img src="images/icon.png">
                </div>
            </td>

            <td style="width: 180px; height: 20px;">
                <div>
                    Game Name
                </div>
            </td>

            <td>
                <div style="width: 90px; height: 20px;">
                    Game Type
                </div>
            </td>

            <td>
                <div style="width: 90px; height: 20px;">
                    Game Version
                </div>
            </td>

            <td>
                <div style="width: 90px; height: 20px;">
                    Game Price
                </div>
            </td>

            <td>
                <div style="height: 40px">
                    <form action="#" method="post">
                        <input class="button special" type="submit" value="UPDATE">
                    </form>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="second">
                    ajdsfnjz hcafjfkjdsfdsj afkjnmvnxchj kahfqei sadxzc
                </div>
            </td>

            <td style="width: 90px; height: 70px;">
                <div>
                    Game State
                </div>
            </td>

            <td>

                <div style="height: 40px">
                    <form action="#" method="post">
                        <input class="button special" type="submit" value="DELETE">
                    </form>
                </div>
            </td>
        </tr>

        <tr>
            <td rowspan="2">
                <div class="first">
                    <img src="images/icon.png">
                </div>
            </td>

            <td>
                <div style="width: 180px; height: 20px;">
                    Game Name
                </div>
            </td>

            <td>
                <div style="width: 90px; height: 20px;">
                    Game Type
                </div>
            </td>

            <td>
                <div style="width: 90px; height: 20px;">
                    Game Version
                </div>
            </td>

            <td>
                <div style="width: 90px; height: 20px;">
                    Game Price
                </div>
            </td>

            <td style="height: 40px">
                <div >
                    <form action="#" method="post">
                        <input class="button special" type="submit" value="UPDATE">
                    </form>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <div class="second">
                    ajdsfnjz hcafjfkjdsfdsj afkjnmvnxchj kahfqei sadxzc
                </div>
            </td>

            <td style="width: 90px; height: 70px;">
                <div>
                    Game State
                </div>
            </td>

            <td>

                <div style="height: 40px">
                    <form action="#" method="post">
                        <input class="button special" type="submit" value="DELETE">
                    </form>
                </div>
            </td>
        </tr>

        <tr>
            <td><br></td>
        </tr>

        <tr>
            <td style="width: 100px">
            </td>
            <td rowspan="2" class="third"
                onclick="window.location.href='http://localhost:8080/mysteam/dvlpr_apply_add.jsp'">
                + ADD
            </td>
            <td style="width: 100px">
        </tr>
        <tr>
            <td><br></td>
        </tr>
    </table>
</div>
</body>
</html>
