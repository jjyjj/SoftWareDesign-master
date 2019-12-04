<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthenticityQuery.aspx.cs" Inherits="SoftWareDesign.view.AuthenticityQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" charset="UTF-8" content="width=device-width, initial-scale=1">

    <title></title>

    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <style>
        .faithcenter {
            padding-top: 120px;
            padding-bottom: 120px;
        }

        .modal.modal-normal .modal-header .close {
            color: #ffffff;
            opacity: 1;
        }

        .modal.modal-normal .modal-dialog {
            margin-top: 90px;
        }

        .modal-result {
            text-align: center;
            height: auto;
            padding-top: 20px;
            padding-bottom: 30px;
        }

            .modal-result h3 {
                font-size: 24px;
                margin: 20px 0;
            }

        .modal-result-text {
            color: #36363c !important;
            margin-top: 20px;
            margin-bottom: 12px;
        }

        .btn-long {
            width: 204px;
            height: 34px;
            line-height: 32px;
            font-size: 14px;
        }

        .faith-result-info {
            display: inline-block;
        }

            .faith-result-info li {
                font-size: 14px;
                text-align: left;
                color: #36363c;
                white-space: nowrap;
                font-weight: 100;
                font-family: "Microsoft YaHei" !important;
                line-height: 26px;
            }

        .ML10 {
            margin-left: 10px;
        }

        .MB20 {
            margin-bottom: 20px;
        }

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
</head>
<body>
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
                <li><a href="PaperReview.aspx" class="topnavli ">论文查重</a></li>
                <li><a href="AuthenticityQuery.aspx" class="topnavli activenav">查询真伪</a></li>

                <li><a class="topnavli " href="SampleReport.aspx">报告样例</a></li>
                <li><a class="topnavli  " href="CheckReport.aspx">查看报告</a></li>


            </ul>
        </div>
        <!--[if lt IE 9]>
        </div>
        <![endif]-->
    </header>
    <div class="flashInfo">
    </div>

    <div class="signmain">
        <div class="faithcenter">
            <h1>中工论文检测查询</h1>

            <p><span class="redcolor">论文编号非淘宝订单编号</span></p>

            <div class="signinputA">
                <form id="checkForm" class="sign-form faithform" action="/AuthenticityQuery" method="post">
                    <input type="hidden" name="_csrf" value="OEZzSXVUZWZNFT8QQDYtDGd1A3oyHwAyQT4lGQMADVNAa0ATDDNdNQ==">
                    <div class="form-group field-checkform-report_id required">

                        <div class="form-group has-feedback">
                            <input type="text" id="checkform-report_id" class="form-control" name="CheckForm[report_id]" placeholder="论文编号" autocomplete="off"><p class="help-block help-block-error"></p>
                            <!--<div class="faithinfo"><img src="/images/tool/shape.jpg" class="capimgsize"></div>-->
                        </div>
                    </div>
                    <div class="form-group field-checkform-captcha">
                        <div class="form-group">
                            <input type="text" id="checkform-captcha" class="form-control web-yan-input" name="CheckForm[captcha]" placeholder="验证码" autocomplete="off"><img id="checkform-captcha-image" src="../images/captcha.png" width="120px" height="50px" alt=""><p class="help-block help-block-error"></p>
                        </div>
                    </div>
                    <button type="submit" class="btn btnfaith">开始查询</button>
                </form>
            </div>
        </div>
    </div>



    <footer class="copyright">



        <span style="display: none"></span>

    </footer>

    <script src="../js/jquery-1.9.1.min.js"></script>

    <script src="../js/bootstrap.js"></script>

</body>

</html>
