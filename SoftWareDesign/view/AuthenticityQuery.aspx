<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuthenticityQuery.aspx.cs" Inherits="SoftWareDesign.view.AuthenticityQuery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta name="viewport" charset="UTF-8" content="width=device-width, initial-scale=1">

    <title></title>

    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <style>
        body {
            min-height: 1100px;
        }

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
            color: #36363c!important;
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
    <div class="faithwarning">
        <div class="faithlist">
            <p class="white20">如何识别假冒的检测论文？</p>
            <table class="table faithol">
                <tbody>
                    <tr>
                        <td>一：</td>
                        <td>比对库资源只有网络资源的均为假货，正品检测论文都是经过大数据量的本地库（9000万篇学术期刊和学位论文）详细比对生成，检测结果有详细的期刊和学位论文出处。假的检测论文用只有网络资源的检测论文坑害消费者，导致其论文最终没有通过审核。</td>
                    </tr>

                    <tr>
                        <td>二：</td>
                        <td>请认准中工这个名称，有的山寨检测论文用以Paper开头的其他名称迷惑消费者。</td>
                    </tr>
                </tbody>
            </table>
            <p class="white18">真诚希望您能够将此信息转告您的朋友和同学，以防被骗！</p>
        </div>
    </div>

    <div class="modal fade meng modal-normal" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog mengcharge">
            <div class="modal-content">
                <div class="modal-header check-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    检测论文真伪查询结果
           
                </div>
                <div class="modal-body mymod-body modal-result" id="checkReport">
                </div>
            </div>
        </div>
    </div>
    <footer class="copyright">
        <!--[if lt IE 9]>
        <div class="copyright">
        <![endif]-->


        <span style="display: none">

            <script>
                var _hmt = _hmt || [];
                (function () {
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?6eac42ccc7cb1da39d1b58de160ef339";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                })();
</script>
        </span>
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
    <script src="../js/yii.js"></script>
    <script src="../js/yii.validation.js"></script>
    <script src="../js/yii.captcha.js"></script>
    <script src="../js/yii.activeForm.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script type="text/javascript">jQuery(document).ready(function () {
    $('form#checkForm').on('beforeSubmit', function (e) {
        var url = $(this).attr('action');
        $.post(url, $(this).serialize(), function (data) {
            var result = ''; var buttonLink = '<button class="btn btn-green btn-long" data-dismiss="modal">确定</button>';
            if (data.status == 1) {
                result = '<h3 class="initgreen">恭喜，您查询的检测论文为正品！</h3><div class="text-center"><ul class="faith-result-info"><li>编号：' + data.ReportID + '</li><li>版本：' + data.CheckType + '</li><li>标题：' + data.Title + '</li><li>作者：' + data.Author + '</li><li>字数：' + data.ContentLength + '</li><li>总体相似度：' + data.Score + '%</li><li>提交时间：' + data.UploadTime + '</li></ul></div>' + buttonLink;
            } else {
                result = '<h3 class="red1">您查询的检测论文是假货！</h3><div class="modal-result-text">' + data.ReportID + '</div>' + buttonLink;
            }
            $('#checkform-captcha').val('');
            changeCaptcha();
            $('#checkReport').html(result);
            $("#resultModal").modal();
        }, 'json');
        return false;
    }).on('submit', function (e) {
        e.preventDefault();
    });

    function changeCaptcha() {
        $('#checkform-captcha-image').click();
    }
    jQuery('#checkform-captcha-image').yiiCaptcha({ "refreshUrl": "\/site\/captcha?refresh=1", "hashKey": "yiiCaptcha\/site\/captcha" });
    jQuery('#checkForm').yiiActiveForm([{ "id": "checkform-report_id", "name": "report_id", "container": ".field-checkform-report_id", "input": "#checkform-report_id", "error": ".help-block.help-block-error", "validate": function (attribute, value, messages, deferred, $form) { value = yii.validation.trim($form, attribute, []); yii.validation.required(value, messages, { "message": "论文编号不能为空" }); yii.validation.regularExpression(value, messages, { "pattern": /^\w+$/i, "not": false, "message": "论文编号是无效的", "skipOnEmpty": 1 }); } }, { "id": "checkform-captcha", "name": "captcha", "container": ".field-checkform-captcha", "input": "#checkform-captcha", "error": ".help-block.help-block-error", "validate": function (attribute, value, messages, deferred, $form) { yii.validation.captcha(value, messages, { "hash": 661, "hashKey": "yiiCaptcha/site/captcha", "caseSensitive": false, "message": "验证码不正确" }); } }], []);
});</script>
</body>

</html>
