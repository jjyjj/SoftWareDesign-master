<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadFile.aspx.cs" Inherits="SoftWareDesign.admin.UploadFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">

    <title></title>


    <link href="../css/bootstrap.css" rel="stylesheet">

    <link href="../css/style.css" rel="stylesheet" />
</head>
<body>
    <header class="top">
        <div class="top_con">
            <div class="topimg pull-left"><a href="/" class="topimgsize"></a></div>
            <div class="topbtn pull-right">
                <a href="../index.aspx" class="btn_login">登录</a>
                <a href="Registered.aspx" class="btn_sign">注册</a>
            </div>
            <ul class="topnav pull-right">
                <li><a href="../index.aspx" class="topnavli ">首页</a></li>
                <li><a href="../view/PaperReview.aspx" class="topnavli ">论文查重</a></li>
                <li><a href="../view/AuthenticityQuery.aspx" class="topnavli ">查询真伪</a></li>
                <li><a class="topnavli  " href="../view/SampleReport.aspx">报告样例</a></li>
                <li><a class="topnavli  " href="../view/CheckReport.aspx">查看报告</a></li>

            </ul>
        </div>
    </header>
    <div class="flashInfo">
    </div>
    <div class="signmain" style="height: 680px">
        <div class="signcenter" style="margin: 80px auto">
            <div class="signinputA">
                <form id="w0" class="sign-form" method="post">
                    <input type="hidden" name="_csrf" value="Mkl3WGouOHRHGjsBX0xwHm16B2stZV0gSzEhCBx6UEFKZEQCE0kAJw==">
                    <div class="form-group field-signupform-username required">
                        <div class="form-group">
                            <label class="control-label" for="signupform-username">文章名</label><p class="help-block help-block-error"></p>
                            <input type="text" id="articleName" class="form-control" name="SignupForm[username]" placeholder="选填，请输入作者名字">
                        </div>

                    </div>
                    <div class="form-group field-signupform-password required">
                        <div class="form-group">
                            <label class="control-label" for="signupform-password">作者名</label><p class="help-block help-block-error"></p>
                            <input type="text" id="authorName" class="form-control" name="SignupForm[password]" placeholder="必填，请输入作者名字">
                        </div>
                    </div>

                    <div class="form-group field-signupform-email required">
                        <label class="control-label" for="signupform-password">选择文件</label><p class="help-block help-block-error"></p>
                        <div id="div-uploadAtricle">
                            <div class="row">
                                <div class="col-lg-8 col-sm-6 col-12">
                                    <div class="input-group">
                                        <input id="filePath" type="text" class="form-control" onkeydown="return false;" onpause="return false;" placeholder="请选择一个本地文件，仅支持word,且文件大小不超过9999M" />
                                        <label class="input-group-btn">
                                            <span class="btn btn-primary">
                                                <i class="glyphicon glyphicon-folder-open"></i>
                                                选择文件并上传
                                                            <input type="file" id="uploadFile" style="display: none;" />
                                            </span>
                                        </label>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="form-group field-signupform-captcha">
                    </div>




                </form>
            </div>
        </div>
    </div>



    <footer class="copyright">
    </footer>

    <script src="../js/jquery-1.9.1.min.js"></script>

    <script src="../css/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script>
        $('#uploadFile').change(function () {
            var filePath = $('#uploadFile').val();
            // 判断文件类型
            var type = (filePath.substr(filePath.lastIndexOf("."))).toLowerCase();
            if (type != ".docx") {
                alert("您上传文件的类型不符合(.docx)！请重新上传");
                return false;
            }
            else {
                if ($('#authorName').val() == "") {
                    alert("请填写论文作者");
                } else {
                    $('#filePath').val(getFileName(filePath));
                    var fileInput = document.querySelector("#uploadFile");
                    var file = fileInput.files.item(0);
                    // 使用FileReader读取文件。
                    var fileReader = new FileReader();
                    fileReader.addEventListener("load", function (ev) {
                        var type = (filePath.substr(filePath.lastIndexOf("."))).toLowerCase();
                        var str = $('#filePath').val()
                        str = str.substr(0, str.lastIndexOf(type));
                        $('#articleName').val(str);
                        var content = fileReader.result;
                        UploadFile($('#filePath').val(), $('#authorName').val(), content);

                    });
                    fileReader.readAsDataURL(file);
                }



            }
        });




        ///获取后缀
        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1);
        }



        //上传文件
        function UploadFile(articleName, authorName, content) {

            var filePath = $('#uploadFile').val();
            // 判断文件类型
            var type = (filePath.substr(filePath.lastIndexOf("."))).toLowerCase();


            $.ajax({
                type: "post",
                url: "Handler1.ashx",
                data: {
                    "articleName": articleName,
                    "authorName": authorName,
                    "content": content
                },
                dataType: "json",
                success: function (data) {
                    var result = JSON.parse(JSON.stringify(data));
                    if (result.Code == 1) {
                        alert(result.Message);

                    }
                },
                error: function (err) {
                    alert("上传文件出错，请重新上传");

                }

            });




        }

    </script>

</body>
</html>
