<%@ page import="com.mysteam.entity.Game" %><%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 2018/1/9
  Time: 0:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="gs" uri="http://mysteam.com/tag/state" %>
<html>
<head>
    <title>管理员个人主页</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale="/>
    <link rel="stylesheet" href="assets/css/button.css"/>
    <link rel="stylesheet" href="assets/css/home.css"/>
</head>
<body>
<%@include file="header_lib.jsp" %>

<div class="banner">
    <h1 align="center">ADMIN GAME MANAGE CENTER</h1>
</div>

<br>
<br>

<div>
    <table align="center" class="table-wrapper" cellspacing="10">
        <tr>
            <td colspan="6" align="center">
                <h2 class="title">GAMES ON APPLYING LIST</h2>
            </td>
        </tr>

        <c:forEach items="${requestScope.applyList}" var="product">
            <c:if test="${not gs:isApplyingFailed(product)}">
                <tr>
                    <td rowspan="2">
                        <div class="cover"><img src="showCover.action?gameId=${product.gameId}&onSale=${gs:isOnSale(product)}" width="100"
                                                height="100"></div>
                    </td>

                    <td>
                        <c:if test="${not gs:isOnApplyingRemove(product)}">
                            <div class="name">
                                  <a href="streamDownloadAction.action?gameId=${product.gameId}"
                                     style="text-decoration:none;color: #aaffad;">
                                          ${product.gameName}
                                  </a>
                            </div>
                        </c:if>
                        <c:if test="${gs:isOnApplyingRemove(product)}">
                            <div class="name">
                                ${product.gameName}
                            </div>
                        </c:if>
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
                        <c:choose>
                            <c:when test="${gs:isOnApplyingAdd(product)}">
                                <div style="height: 30px">
                                    <form action="acceptApplyNewGame.action" method="post">
                                        <input type="text" style="display:none;" name="applyId"
                                               value="${product.gameId}">
                                        <input class="button special" type="submit" value="同意">
                                    </form>
                                </div>
                            </c:when>
                            <c:when test="${gs:isOnApplyingUpdate(product)}">
                                <div style="height: 30px">
                                    <form action="acceptUpdateGame.action" method="post">
                                        <input type="text" style="display:none;" name="applyId"
                                               value="${product.gameId}">
                                        <input class="button special" type="submit" value="同意">
                                    </form>
                                </div>
                            </c:when>
                            <c:when test="${gs:isOnApplyingRemove(product)}">
                                <div style="height: 30px">
                                    <form action="acceptRemoveGame.action" method="post">
                                        <input type="text" style="display:none;" name="applyId"
                                               value="${product.gameId}">
                                        <input class="button special" type="submit" value="同意">
                                    </form>
                                </div>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="second"><b>游戏简介：</b>${product.introduction}</div>
                    </td>

                    <td>
                        <div class="state">
                            <c:choose>
                                <c:when test="${gs:isOnApplyingAdd(product)}">
                                    <p style="color: yellow">申请上架</p>
                                </c:when>
                                <c:when test="${gs:isOnApplyingUpdate(product)}">
                                    <p style="color: yellow">申请更新</p>
                                </c:when>
                                <c:when test="${gs:isOnApplyingRemove(product)}">
                                    <p style="color: yellow">申请下架</p>
                                </c:when>
                            </c:choose>

                        </div>
                    </td>

                    <td>
                        <c:if test="${gs:isOnApplyingAdd(product)}">
                            <div style="height: 30px">
                                <form action="refuseApplyNewGame.action">
                                    <input type="text" style="display:none;" name="applyId" value="${product.gameId}">
                                    <input class="button cancel" type="submit" value="拒绝">
                                </form>
                            </div>
                        </c:if>
                        <c:if test="${gs:isOnApplyingUpdate(product)}">
                            <div style="height: 30px">
                                <form action="refuseApplyUpdate.action">
                                    <input type="text" style="display:none;" name="applyId" value="${product.gameId}">
                                    <input class="button cancel" type="submit" value="拒绝">
                                </form>
                            </div>
                        </c:if>
                        <c:if test="${gs:isOnApplyingRemove(product)}">
                            <div style="height: 30px">
                                <form action="refuseApplyRemove.action">
                                    <input type="text" style="display:none;" name="applyId" value="${product.gameId}">
                                    <input class="button cancel" type="submit" value="拒绝">
                                </form>
                            </div>
                        </c:if>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>

<br>
<br>
</body>
</html>
