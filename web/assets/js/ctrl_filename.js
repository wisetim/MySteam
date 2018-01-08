function updateCoverName() {
    var filePath = document.getElementById("cover").value;
    if (filePath.indexOf("jpg") !== -1 || filePath.indexOf("png") !== -1) {
        var arr = filePath.split('\\');
        var fileName = arr[arr.length - 1];
        document.getElementById("cover_name").innerHTML = "";
        document.getElementById("cover_name").innerHTML = fileName;

        document.getElementById("coverName").value="";
        document.getElementById("coverName").value=fileName;
    } else {
        document.getElementById("cover_name").innerHTML = "";
        document.getElementById("cover_name").innerHTML = "您上传的不是jpg、png文件！";

        document.getElementById("coverName").value="";
    }
}

function updateGameFileName() {
    var filePath = document.getElementById("game_file").value;
//            这里留给以后规定文件类型
//            if (filePath.indexOf("jpg") !== -1 || filePath.indexOf("png") !== -1) {
    var arr = filePath.split('\\');
    var fileName = arr[arr.length - 1];
    document.getElementById("game_file_name").innerHTML = "";
    document.getElementById("game_file_name").innerHTML = fileName;

    document.getElementById("gameFileName").value=fileName;
//            }
}

function reset() {
    resetCoverName();
    resetGameFileName();
}

function resetCoverName() {
    document.getElementById("cover_name").innerHTML = "";
    document.getElementById("cover_name").innerHTML = "点击这里上传封面";

    document.getElementById("coverName").value="";
}

function resetGameFileName() {
    document.getElementById("cover_name").innerHTML = "";
    document.getElementById("cover_name").innerHTML = "点击这里上传游戏文件";

    document.getElementById("gameFileName").value="";
}