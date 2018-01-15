<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 2018/1/11
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="gt" uri="http://mysteam.com/tag/type" %>
<%@ taglib prefix="gs" uri="http://mysteam.com/tag/state" %>
<c:set var="gameType" value="${requestScope.updatedGame.type}"/>
<html>
<head>
    <title>游戏上架申请</title>
    <link rel="stylesheet" href="assets/css/home.css">
    <link rel="stylesheet" href="assets/css/form.css">
    <link rel="stylesheet" href="assets/css/button.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/ctrl_filename.js"></script>
    <script type="text/javascript">
        window.onload=function(){
            var type = "${gameType}";
            var gameTypes = document.getElementById("gameTypes").options;
            if (type === "动作") {
                gameTypes[1].selected = true;
            } else if (type === "益智") {
                gameTypes[2].selected = true;
            } else if (type === "冒险") {
                gameTypes[3].selected = true;
            }
        }
    </script>
</head>
<body>
<%@include file="header_lib.jsp" %>

<div class="banner">
    <h1 align="center">DEVELOPER GAME APPLYING</h1>
</div>
<br>
<br>
<div align="center">
    <form action="updateGameApplyCommitted.action" method="post" enctype="multipart/form-data">
        <table class="table-wrapper">
            <tr style="display: none">
                <td style="width: 400px">
                    <input type="text" name="game.gameId"
                           value="${requestScope.updatedGame.gameId}">
                    <input type="text" name="game.state"
                           value="${requestScope.updatedGame.state}">
                    <input type="text" name="game.originId"
                    value="${requestScope.updatedGame.originId}">
                    <input type="text" name="coverName" id="coverName"
                           value=""/>
                    <input type="text" name="gameFileName" id="gameFileName"
                           value=""/>
                    <%--<input type="text" name="game.developer.userId"--%>
                           <%--value="${sessionScope.user.userId}">--%>
                    <input type="text" name="game.developer.userId"
                           value="1">
                </td>
            </tr>
            <tr>
                <td style="width: 400px;" align="center">
                    <div>
                        <div class="cover">
                            <img src="showCover.action?gameId=${requestScope.updatedGame.gameId}&onSale=${true}">
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <input type="text" name="game.gameName"
                           value="${requestScope.updatedGame.gameName}" placeholder="游戏名称"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px;">
                    <div class="select-wrapper">
                        <select name="game.type" id="gameTypes" title="游戏类型">
                            <option>
                                - 游戏类型 -
                            </option>
                            <option value="动作">
                                动作
                            </option>
                            <option value="益智">
                                益智
                            </option>
                            <option value="冒险">
                                冒险
                            </option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <input type="text" name="game.price"
                           value="${requestScope.updatedGame.price}" placeholder="初始定价"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <input type="text" name="game.version"
                           value="${requestScope.updatedGame.version}" placeholder="当前版本"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <a class="upload" id="upload_cover">
                        <input type="file" name="gameCover" id="cover" onchange="updateCoverName()"/>
                        <p id="cover_name">点击这里上传新封面</p>
                    </a>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <a class="upload" id="upload_game_file">
                        <input type="file" name="gameFile" id="game_file" onchange="updateGameFileName()"/>
                        <p id="game_file_name">点击这里上传新游戏文件</p>
                    </a>
                </td>
            </tr>
            <tr>
                <td style="width: 400px; height: 120px; resize: none" align="center">
                    <textarea name="game.introduction" placeholder="游戏介绍(140字内)"
                              style="resize: none;">${requestScope.updatedGame.introduction}</textarea>
                </td>
            </tr>
            <tr>
                <td style="width: 400px" align="center">
                    <input class="button special" type="submit" name="cover" value="更新"/>
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
