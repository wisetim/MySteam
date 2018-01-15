<%--
  Created by IntelliJ IDEA.
  User: Tim
  Date: 2018/1/7
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>游戏上架申请</title>
    <link rel="stylesheet" href="assets/css/home.css">
    <link rel="stylesheet" href="assets/css/form.css">
    <link rel="stylesheet" href="assets/css/button.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/ctrl_filename.js"></script>
</head>
<body>
<%@include file="header_lib.jsp" %>

<div class="banner">
    <h1 align="center">DEVELOPER GAME APPLYING</h1>
    <%--<hr style="height:1px;border:none;border-top:1px ridge #51ff08;"/>--%>
</div>
<br>
<br>
<div align="center">
    <form action="newGameApplyCommitted.action" method="post" enctype="multipart/form-data">
        <table class="table-wrapper">
            <tr style="display: none">
                <td style="width: 400px">
                    <input type="text" name="game.developer.userId"
                           value="1"/>
                    <input type="text" name="coverName" id="coverName"
                           value=""/>
                    <input type="text" name="gameFileName" id="gameFileName"
                           value=""/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <input type="text" name="game.gameName" value="" placeholder="游戏名称"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px;">
                    <div class="select-wrapper">
                        <select name="game.type" title="游戏类型">
                            <option value="none">
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
                    <input type="text" name="game.price" value="" placeholder="初始定价"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <input type="text" name="game.version" value="" placeholder="当前版本"/>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <a class="upload" id="upload_cover">
                        <input type="file" name="gameCover" id="cover" onchange="updateCoverName()"/>
                        <p id="cover_name">点击这里上传封面</p>
                    </a>
                </td>
            </tr>
            <tr>
                <td style="width: 400px">
                    <a class="upload" id="upload_game_file">
                        <input type="file" name="gameFile" id="game_file" onchange="updateGameFileName()"/>
                        <p id="game_file_name">点击这里上传游戏文件</p>
                    </a>
                </td>
            </tr>
            <tr>
                <td style="width: 400px; height: 120px; resize: none" align="center">
                    <textarea name="game.introduction" placeholder="游戏介绍(140字内)" style="resize: none;"></textarea>
                </td>
            </tr>
            <tr>
                <td style="width: 400px" align="center">
                    <input class="button special" type="submit" name="cover" value="Submit"/>
                    <input class="button special" type="reset" name="cover"
                           value="Reset" onclick="reset()"/>
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
