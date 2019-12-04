<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SampleReport.aspx.cs" Inherits="SoftWareDesign.view.SampleReport" %>

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
                <li><a href="PaperReview.aspx" class="topnavli ">论文查重</a></li>
                <li><a href="AuthenticityQuery.aspx" class="topnavli ">查询真伪</a></li>
                <li><a class="topnavli  activenav" href="SampleReport.aspx">报告样例</a></li>
                <li><a class="topnavli  " href="CheckReport.aspx">查看报告</a></li>

            </ul>
        </div>
    </header>
    <div class="flashInfo">
    </div>
    <div class="signmain" style="height: 678.11px">
        <div class="signcenter">
        </div>
    </div>

    <footer class="copyright">
    </footer>
    <script src="../js/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>


</body>
</html>
