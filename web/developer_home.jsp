<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 2018/1/7
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="gs" uri="http://mysteam.com/tag/state" %>
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
                    <div class="cover">
                        <img src="showCover.action?gameId=${product.gameId}&onSale=${gs:isOnSale(product)}"
                             width="100" height="100">
                    </div>
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
                        <c:choose>
                            <c:when test="${gs:isOnSale(product)}">
                                <c:if test="${gs:isNotOnApplying(product) and not gs:isApplyingFailed(product)}">
                                    <form action="applyUpdateGame.action" method="post">
                                        <input type="text" style="display: none" name="applyId"
                                               value="${product.gameId}">
                                        <input class="button special" type="submit" value="更新">
                                    </form>
                                </c:if>
                                <c:if test="${not gs:isNotOnApplying(product) || gs:isApplyingAddFailed(product)}">
                                    <form action="applyUpdateGame.action" method="post">
                                        <input type="text" style="display: none" name="applyId"
                                               value="${product.gameId}">
                                        <input class="button special" disabled="disabled" type="submit" value="更新">
                                    </form>
                                </c:if>
                            </c:when>
                            <c:when test="${gs:isOnApplyingAdd(product) or gs:isOnApplyingUpdate(product)
                                                            or gs:isOnApplyingRemove(product)}">
                                <form action="cancelApply.action" method="post">
                                    <input type="text" style="display:none;" name="applyId" value="${product.gameId}">
                                    <input class="button cancel" type="submit" value="撤销">
                                </form>
                            </c:when>
                            <c:when test="${gs:isApplyingFailed(product)}">
                                <form action="confirmResult.action" method="post">
                                    <input type="text" style="display:none;" name="applyId" value="${product.gameId}">
                                    <input class="button special" type="submit" value="确定">
                                </form>
                            </c:when>
                        </c:choose>
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
                            <c:when test="${gs:isOnSale(product)}">
                                <p>已上架</p>
                            </c:when>
                            <c:when test="${gs:isOnApplyingAdd(product)}">
                                <p style="color: yellow">上架申请中</p>
                            </c:when>
                            <c:when test="${gs:isOnApplyingUpdate(product)}">
                                <p style="color: yellow">更新申请中</p>
                            </c:when>
                            <c:when test="${gs:isOnApplyingRemove(product)}">
                                <p style="color: yellow">下架申请中</p>
                            </c:when>
                            <c:when test="${gs:isApplyingAddFailed(product)}">
                                <p style="color: darkred">上架失败</p>
                            </c:when>
                            <c:when test="${gs:isApplyingUpdateFailed(product)}">
                                <p style="color: darkred">更新失败</p>
                            </c:when>
                            <c:when test="${gs:isApplyingRemoveFailed(product)}">
                                <p style="color: darkred">下架失败</p>
                            </c:when>
                            <c:when test="${not gs:isOnSale(product)}">
                                <p>已下架</p>
                            </c:when>
                        </c:choose>

                    </div>
                </td>

                <td>

                    <div style="height: 30px">
                        <c:if test="${gs:isOnSale(product)}">
                            <c:if test="${not gs:isOnApplyingUpdate(product) and not gs:isOnApplyingRemove(product)}">
                                <form action="removeGameApplyCommitted.action" method="post">
                                    <input type="text" style="display:none;" name="applyId" value="${product.gameId}">
                                    <input class="button special" type="submit" value="下架">
                                </form>
                            </c:if>
                            <c:if test="${gs:isOnApplyingUpdate(product) || gs:isOnApplyingRemove(product)}">
                                <form action="removeGameApplyCommitted.action" method="post">
                                    <input type="text" style="display:none;" name="applyId" value="${product.gameId}">
                                    <input class="button special" disabled="disabled" type="submit" value="下架">
                                </form>
                            </c:if>
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
                onclick="window.location.href='developer_apply_add.jsp'">
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
