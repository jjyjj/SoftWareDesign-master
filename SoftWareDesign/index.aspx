<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SoftWareDesign.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/home2018.css" rel="stylesheet" />
</head>
<body>
    <header class="top">
        <!--[if lt IE 9]>
        <div class="top">
        <![endif]-->
        <div class="top_con">
            <div class="topimg pull-left"><a href="/" class="topimgsize"></a></div>
            <div class="topbtn pull-right">
                <a href="#" class="btn_login">登录</a>
                <a href="view/Registered.aspx" class="btn_sign">注册</a>
            </div>
            <ul class="topnav pull-right">
                <li><a class="topnavli " href="#">首页</a></li>
                <li><a class="topnavli " href="view/PaperReview.aspx">论文查重</a></li>
                <li><a class="topnavli " href="view/AuthenticityQuery.aspx">查询真伪</a></li>
                <li><a class="topnavli " href="view/SampleReport.aspx">报告样例</a></li>
                  <li><a class="topnavli  " href="view/CheckReport.aspx">查看报告</a></li>

            </ul>
        </div>
        <!--[if lt IE 9]>
        </div>
        <![endif]-->
    </header>
    <div class="bg_grey report_banner">
        <div class="major-area">
            <div class="majorarea-auto clearfix">
                <div class="p-rel pull-left">
                    <img src="./images/Download/major.png">
                </div>
                <div class="login-area pull-left">


                    <div class="login-wrapper">
                        <img src="./images/Download/login-book.png" class="loginbook-img" />
                        <div class="login-form-tit">
                            <h4>马上登录</h4>
                            <div class="form-dividing-line">
                                <div class="paper-staples-1 p-rel">
                                    <div class="left-circle"></div>
                                    <div class="staple"></div>
                                    <div class="right-circle"></div>
                                </div>
                                <div class="paper-staples-2 p-rel">
                                    <div class="left-circle"></div>
                                    <div class="staple"></div>
                                    <div class="right-circle"></div>
                                </div>
                                <div class="paper-staples-3 p-rel">
                                    <div class="left-circle"></div>
                                    <div class="staple"></div>
                                    <div class="right-circle"></div>
                                </div>
                            </div>
                        </div>
                        <form id="w0" class="login-form" method="post">
                            <div class="form-group field-loginform-username required">
                                <p class="help-block help-block-error"></p>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </div>
                                    <input type="text" id="loginform-username" class="form-control" name="LoginForm[username]" tabindex="1" placeholder="用户名" />
                                </div>
                            </div>
                            <div class="form-group field-loginform-password required">

                                <p class="help-block help-block-error"></p>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <span class="glyphicon glyphicon-lock"></span>
                                    </div>
                                    <input type="password" id="loginform-password" class="form-control" name="LoginForm[password]" tabindex="2" placeholder="密码" />
                                </div>

                            </div>

                            <div class="form-group">
                                <div class=" col-sm-10">
                                    <div class="checkbox">
                                        <label style="color: #CCCCCC">
                                            <input type="checkbox" id="remeberMe" />记住我
                                        </label>

                                        <a href="#" style="color: #CCCCCC; margin-left: 35px">忘记密码</a>

                                    </div>
                                </div>
                            </div>


                            <div class="form-group MT30">
                                <input type="button" value="登录" class="btn bg_green defaultBtn login" tabindex="3" id="login" />
                            </div>
                            <div class="form-group MT30">
                                <a href="view/Registered.aspx" class="btn bg_green defaultBtn ">免费注册</a>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <footer class="footer fontF-Yahei">
        <!--[if lt IE 9]>
        <div class="footer">
        <![endif]-->


        <div class="copyright">
            <p>


                <span style="display: none"></span>
            </p>
        </div>
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

    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/yii.js"></script>
    <script src="js/yii.validation.js"></script>
    <script src="js/yii.activeForm.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/slideMove.js"></script>
    <script src="js/login.js"></script>


    <script type="text/javascript">
     
        $('#login').click(function () {
            var name = $('#loginform-username').val();
            var pwd = $('#loginform-password').val();
            var checkState = $('#remeberMe').is(':checked')
            $.ajax({
                type: "post",
                url: "ashx/Login.ashx",
                data: {
                    "name": name,
                    "pwd": pwd,
                    "checkState": checkState
                },

                dataType: "json",
                success: function (data) {
                    var jsonobj = JSON.parse(JSON.stringify(data));
                    if (jsonobj[0] == null) {
                        alert("该用户不存在，请确认账号信息")
                    } else {
                         alert("登陆成功")
                        window.location.href = 'view/PaperReview.aspx';
                    }
                },
                error: function (err) {
                    alert("账号信息有误，请重新输入");

                }
            });

        })
    </script>
</body>
</html>
