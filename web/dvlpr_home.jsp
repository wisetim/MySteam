<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 2018/1/7
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>开发者主页</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale="/>
    <%--<link rel="stylesheet" href="assets/css/main.css"/>--%>
    <link rel="stylesheet" href="assets/css/button.css"/>
    <link rel="stylesheet" href="assets/css/home.css"/>
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
        <c:forEach items="${requestScope.gameProducts}" var="product">
            <tr>
                <td rowspan="2">
                    <div class="cover"><img src="images/icon.png" width="100" height="100"></div>
                </td>

                <td align="center">
                    <div class="name">${product.gameName}</div>
                </td>

                <td>
                    <div class="type">${product.type}</div>
                </td>

                <td>
                    <div class="version">${product.version}</div>
                </td>

                <td>
                    <div class="price">￥${product.price}</div>
                </td>

                <td>
                    <div style="height: 30px">
                        <c:if test="${product.state == 0 or product.state == 1 or product.state == 2}">
                            <form action="#" method="post">
                                <input class="button cancel" type="submit" value="撤销">
                            </form>
                        </c:if>
                        <c:if test="${product.state == 3}">
                            <form action="#" method="post">
                                <input class="button special" type="submit" value="确定">
                            </form>
                        </c:if>
                        <c:if test="${product.state == 4}">
                            <form action="#" method="post">
                                <input class="button special" type="submit" value="更新">
                            </form>
                        </c:if>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="second"><b>游戏简介：</b>${product.introduction}</div>
                </td>

                <td>
                    <div class="state">
                        <c:choose>
                            <c:when test="${product.state == 0}">
                                <p>上架申请中</p>
                            </c:when>
                            <c:when test="${product.state == 1}">
                                <p>更新申请中</p>
                            </c:when>
                            <c:when test="${product.state == 2}">
                                <p>下架申请中</p>
                            </c:when>
                            <c:when test="${product.state == 3}">
                                <p style="color: darkred">申请失败</p>
                            </c:when>
                            <c:when test="${product.state == 4}">
                                <p>已上架</p>
                            </c:when>
                            <c:when test="${product.state == 5}">
                                <p>已下架</p>
                            </c:when>
                        </c:choose>

                    </div>
                </td>

                <td>

                    <div style="height: 30px">
                        <c:if test="${product.state == 4}">
                            <form action="#" method="post">
                                <input class="button special" type="submit" value="下架">
                            </form>
                        </c:if>
                    </div>
                </td>
            </tr>
        </c:forEach>

        <tr>
            <td><br></td>
        </tr>

        <tr>
            <td style="width: 100px">
            </td>
            <td colspan="4" class="third"
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
