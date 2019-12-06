<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaperReview.aspx.cs" Inherits="SoftWareDesign.view.PaperReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title></title>


    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />

    <link href="../css/bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../css/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
</head>
<body>
    <style type="text/css">
        /*闪动new小图标*/
        .topnavli {
            position: relative;
        }

        .new {
            position: absolute;
            top: 6px;
            right: 8px;
            width: 16px;
            height: 18px;
        }
    </style>
    <header class="top">
        <!--[if lt IE 9]>
        <div class="top">
        <![endif]-->
        <div class="top_con">
            <div class="topimg pull-left"><a href="/" class="topimgsize"></a></div>
            <div class="topbtn pull-right">
                <a href="../index.aspx" class="btn_login">登录</a>
                <a href="Registered.aspx" class="btn_sign">注册</a>
            </div>
            <ul class="topnav pull-right">
                <li><a href="../index.aspx" class="topnavli ">首页</a></li>
                <li><a href="PaperReview.aspx" class="topnavli activenav">论文查重</a></li>
                <li><a href="AuthenticityQuery.aspx" class="topnavli ">查询真伪</a></li>
                <li><a class="topnavli " href="SampleReport.aspx">报告样例</a></li>
                <li><a class="topnavli  " href="CheckReport.aspx">查看报告</a></li>

            </ul>
        </div>
        <!--[if lt IE 9]>
        </div>
        <![endif]-->
    </header>
    <style>
       
    </style>
    <div class="signmain">
        <div style="height: 1000px; width: 80%; margin: auto;">


            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="../images/Download/2019071418.jpg" alt="First slide" style="height: 250px; width: 100%" />
                    </div>
                    <div class="item">
                        <img src="../images/Download/2019071419.jpg" class="img" style="height: 250px; width: 100%" />
                    </div>
                    <div class="item">
                        <img src="../images/Download/2019102802.jpg" class="img" style="height: 250px; width: 100%" />
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                    <span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
                </a>
                <a class="carousel-control right" href="#myCarousel"
                    data-slide="next">
                    <span aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span>
                </a>
            </div>

            <div class="row" style="margin: auto">
                <div class="col-lg-3  ">占位，不知道这里放什么</div>
                <div class="col-lg-8 ">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab" style="color: black; font-size: large">论文检测</a>
                        </li>
                        <li><a href="#details" data-toggle="tab" style="color: black; font-size: large">报告详情</a>
                        </li>
                        <li><a href="#ios" data-toggle="tab" style="color: black; font-size: large">报告下载</a></li>

                    </ul>
                    <br />


                    <form role="form" id="test-for" enctype="multipart/form-data">
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade in active " id="home">

                                <div class="form-group">
                                    <label for="articleName">文章名称:</label>
                                    <input type="text" class="form-control" id="articleName" placeholder="请输入名称" />
                                </div>
                                <div class="form-group">
                                    <label for="authorName">作者名字:</label>
                                    <input type="text" class="form-control" id="authorName" placeholder="请输入作者名字" />
                                </div>
                                <div class="form-group">
                                    <label for="articleConten">请选择提交方式:</label>
                                    <input type="radio" name="optionsRadios" id="copyAtricle" value="粘贴文本" checked style="margin-left: 20px" />粘贴文本
                                    <input type="radio" name="optionsRadios" id="uploadAtricle" value="单文件上传" style="margin-left: 20px" />单文件上传
                                    <input type="radio" name="optionsRadios" id="uploadAtricles" value="多文件上传" style="margin-left: 20px" />多文件上传
                                   <div id="div-copyAtricle">
                                       <div style="float: right"><span style="color: #8B8682">当前字数为</span><span id="count" style="color: red; font-size: 20px">0</span>字</div>
                                       <textarea class="form-control" rows="15" id="textareaContent"></textarea>

                                   </div>
                                    <div id="div-uploadAtricle" style="display: none">
                                        <div class="row">
                                            <div class="col-lg-8 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <input id="filePath" type="text" class="form-control" onkeydown="return false;" onpause="return false;" placeholder="请选择一个本地文件，仅支持word,且文件大小不超过9999M" />
                                                    <label class="input-group-btn">
                                                        <span class="btn btn-primary">
                                                            <i class="glyphicon glyphicon-folder-open"></i>
                                                            选择文件
                                                            <input type="file" id="uploadFile" style="display: none;" />
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" id="isUseMyHouse" />自建库
                                        </label>
                                        <label>
                                            <a href="#">点击创建</a>
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input id="testing" type="button" name="name" value="进行检测" class="btn btn-default" style="width: 150px" />
                                </div>
                                <div class="form-group">
                                    <span style="color: dimgrey">郑重申明：本站系统遵守相关保密规定，全站使用HTTPS加密协议,绝不收录和泄露您送检文档的任何信息，请放心检测！</span>
                                </div>

                            </div>
                            <style>
                                .hr {
                                    height: 1px;
                                    border: none;
                                    border-top: 1px dashed #000000;
                                }
                            </style>
                            <div class="tab-pane fade" id="details">
                                <div style="height: auto;">
                                    <fieldset id="">
                                        <legend>基本信息</legend>
                                        <div class="row jumbotron">
                                            <div class="col-lg-8 " style="border-right: 0.2px solid black">
                                                <label>
                                                    论文标题：
                                                </label>
                                                <span id="spanArticleName">叔本华人生的智慧读书笔记</span><br />
                                                <label>
                                                    检测时间：
                                                </label>
                                                <span id="spanCheckTime">2019-12-02 08:51:21</span><br />
                                                <label>
                                                    送检人：
                                                </label>
                                                <span id="userName">1</span><br />
                                                <label>
                                                    报告编号：
                                                </label>
                                                <span>2cd43943-c496-42e6-a1da-28c405ef5071</span><br />
                                            </div>
                                            <div class="col-lg-4">
                                                <label>
                                                    对比论文:
                                                </label>
                                                <div>
                                                    <span>对比论文</span>
                                                    <span>对比论文</span>
                                                    <span>对比论文</span>

                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                                <hr class="hr" />
                                <div style="height: auto;">
                                    <fieldset id="">
                                        <legend>报告结果</legend>
                                        <div class="row">
                                            <div class="col-lg-12 ">
                                                <span class="label label-info" style="font-size: 20px">总文字复制比：80%</span>
                                                <span class="label  label-danger" style="font-size: 20px">总文字复制比：80%</span>
                                                <span class="label  label-success" style="font-size: 20px">总文字复制比：80%</span>
                                                <div class="jumbotron">
                                                    <ul class="nav nav-justified">
                                                        <li>
                                                            <label>总字数:</label><span>1,024</span></li>
                                                        <li>
                                                            <label>重复字数：</label>800</li>
                                                        <li>
                                                            <label>疑似相似句子总数：</label><span>80</span></li>
                                                        <li>
                                                            <label>最长单句重复字数：</label>50</li>
                                                    </ul>
                                                </div>

                                                <div class="jumbotron">
                                                    <div class="row">
                                                        <div class="col-lg-5" id="userStrDiv">
                                                            <span class="userStr"></span>
                                                        </div>
                                                        <div class="col-lg-5" id="systemStrDiv">
                                                            <span class="systemStr"></span>
                                                        </div>
                                                        <div class="col-lg-1" id="numStrDiv">
                                                            <span class="numStr"></span>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="ios">
                                <div class="form-horizontal" role="form" style="margin-top: 100px">
                                    <div class="form-group">
                                        <label for="firstname" class="col-sm-2 control-label">报告编号：</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="请输入报告编号" />
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button">立即下载</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </form>
                    <script>
                        $(function () {
                            $('#myTab li:eq(1) a').tab('show');

                        });
                    </script>

                </div>
            </div>
        </div>
    </div>




    <footer class="copyright">
        <!--[if lt IE 9]>
        <div class="copyright">
        <![endif]-->


        <span style="display: none;"></span>
        <!--[if lt IE 9]>
        </div>
        <![endif]-->

    </footer>
    <script type="text/javascript">
        function openWin(u, w, h) {
            var l = (screen.width - w) / 2;
            var t = (screen.height - h) / 2;
            var s = 'width=' + w + ', height=' + h + ', top=' + t + ', left=' + l;
            s += ', toolbar=no, scrollbars=no, menubar=no, location=no, resizable=no';
            open(u, 'oWin', s);
        }
    </script>
    <script src="../js/jquery-1.9.1.min.js"></script>

    <script src="../js/bootstrap.js"></script>


    <script>
        //点击radio进行切换
        $("[name=optionsRadios]").change(function () {
            var state = $("[name=optionsRadios]:checked").val();
            if (state == "粘贴文本") {
                $('#div-copyAtricle').show();
                $('#div-uploadAtricle').hide();
                $('#textareaContent').val('');
                $('#count').html('0')
            }
            if (state == "单文件上传") {
                $('#div-copyAtricle').hide();
                $('#div-uploadAtricle').show();
            }

        })
        //实时计算文本框内字数
        $('#textareaContent').keyup(function () {
            var lenInput = $('#textareaContent').val().length;
            $('#count').html(lenInput)

        })
        //上传文件
        $('#uploadFile').change(function () {
            var filePath = $('#uploadFile').val();
            // 判断文件类型
            var type = (filePath.substr(filePath.lastIndexOf("."))).toLowerCase();
            if (type != ".docx") {
                alert("您上传文件的类型不符合(.docx)！请重新上传");
                return false;
            }
            else {
                $('#filePath').val(getFileName(filePath));

                var fileInput = document.querySelector("#uploadFile");
                var file = fileInput.files.item(0);
                // 使用FileReader读取文件。
                var fileReader = new FileReader();
                fileReader.addEventListener("load", function (ev) {

                    var content = fileReader.result;
                    UploadFile($('#filePath').val(), content);
                    $('#div-copyAtricle').show();
                    $('#div-uploadAtricle').hide();
                    var type = (filePath.substr(filePath.lastIndexOf("."))).toLowerCase();
                    var str = $('#filePath').val()
                    str = str.substr(0, str.lastIndexOf(type));
                    $('#articleName').val(str);
                });
                fileReader.readAsDataURL(file);

            }
        });

        //进行论文检测
        $('#testing').click(function () {
            var articleName = $('#articleName').val();//论文名字
            var authorName = $('#authorName').val();//作者名字
            var isUseMyHouse = $("#isUseMyHouse").is(':checked');
            $.ajax({
                type: "post",
                url: "../ashx/TestingPaper.ashx",
                data: {
                    "articleName": articleName,
                    "authorName": authorName,
                    "isUseMyHouse": isUseMyHouse,
                    "content": $("#textareaContent").val().toString()
                },
                dataType: "json",
                success: function (data) {
                    var reslut = JSON.parse(JSON.stringify(data));
                    if (reslut.Code == 0) {
                        alert(reslut.Message);
                        window.location.href = '../index.aspx';

                    }
                    else {

                        var myDate = new Date;
                        var year = myDate.getFullYear(); //获取当前年
                        var mon = myDate.getMonth() + 1; //获取当前月
                        var date = myDate.getDate(); //获取当前日
                        var h = myDate.getHours();//获取当前小时数(0-23)
                        var m = myDate.getMinutes();//获取当前分钟数(0-59)
                        var s = myDate.getSeconds();//获取当前秒
                        var week = myDate.getDay();
                        var weeks = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];


                        $('#spanArticleName').text(articleName);
                        $('#userName').text(getCookie("userName"));
                        $("#checkTime").text(year + "年" + mon + "月" + date + "日" + weeks[week] + "    " + h + ":" + m + ":" + s);
                        for (var i = 0; i < reslut.length; i++) {
                            for (var j = 0; j < reslut[i].useStr.length; j++) {

                                var userStr = "<span class='userStr'>" + reslut[i].useStr[j] + "</span><hr />"
                                var systemStr = "<span class='userStr'>" + reslut[i].systemStr[j] + "" + "<span style='margin-left:20px;color:red' >" + reslut[i].num[j] + "</span></span> <hr />"

                                $('#userStrDiv').append(userStr);
                                $('#systemStrDiv').append(systemStr);


                            }
                        }

                    }

                },
                error: function (err) {
                    alert("发生未知错误，请重新检测")


                }
            });
            $('#articleName').val("");
            $('#filePath').val("");
            $('#authorName').val("");
            $('#textareaContent').val("");
            //$('#myTab li:eq(1) a').tab('show');
        })


        ///获取后缀
        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1);
        }
        ///使用FileReader读取文件。
        function ReadFile($fileName) {
            var fileInput = document.querySelector("'" + $fileName + "'");
            var file = fileInput.files.item(0);
            // 使用FileReader读取文件。
            var fileReader = new FileReader();
            fileReader.addEventListener("load", function (ev) {

                var result = fileReader.result;
                tj(result);


            });
            fileReader.readAsDataURL(file);
        }
        function getCookie(name) {
            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

            if (arr = document.cookie.match(reg))

                return unescape(arr[2]);
            else
                return null;
        }

        //上传文件
        function UploadFile(articleName, content) {

            var filePath = $('#uploadFile').val();
            // 判断文件类型
            var type = (filePath.substr(filePath.lastIndexOf("."))).toLowerCase();


            $.ajax({
                type: "post",
                url: "../ashx/UploadFile.ashx",
                data: {
                    "articleName": articleName,
                    "content": content
                },
                dataType: "json",
                success: function (data) {
                    var jsonobj = JSON.parse(JSON.stringify(data));
                    $("#textareaContent").val(jsonobj)
                },
                error: function (err) {
                    alert("上传文件出错，请重新上传");

                }
            });



        }



        function getMyName() {
            var myName ="<%=Session["userName"]%>";
            return myName
        }  </script>
</body>

</html>
