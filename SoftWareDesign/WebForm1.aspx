<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SoftWareDesign.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery-1.9.1.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="file" id="fileSelecter">
            <button onclick="uploadFile()">上传</button>
        </div>
    </form>
    <script>
        function uploadFile() {
            var fileInput = document.querySelector("#fileSelecter");
            var file = fileInput.files.item(0);
            // 使用FileReader读取文件。
            var fileReader = new FileReader();
            fileReader.addEventListener("load", function (ev) {
                // 文件读取成功后调用此方法。
                // 通过 fileReader.result 即可获取到文件内容。
                // 文件读取成功后调用此方法。
                // 通过 fileReader.result 即可获取到文件内容。
                var result = fileReader.result;
                $.post("https://www.microanswer.cn/test/uploadBase64", {
                    base64Data: result
                }, function (response) {
                    // 服务器响应了我们的上传请求。
                });
            });
           
            // 将文件内容读取为 base64 内容。通过 fileReader.result 即可返回base64的数据内容。
            fileReader.readAsDataURL(file);
        }
    </script>
</body>
</html>
