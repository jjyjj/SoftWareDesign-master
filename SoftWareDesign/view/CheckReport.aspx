<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckReport.aspx.cs" Inherits="SoftWareDesign.view.CheckReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title></title>


    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
</head>
<body  >

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
                <li><a href="AuthenticityQuery.aspx" class="topnavli ">查询真伪</a></li>
                <li><a class="topnavli" href="SampleReport.aspx">报告样例</a></li>
                <li><a class="topnavli  activenav" href="CheckReport.aspx">查看报告</a></li>

            </ul>
        </div>
        <!--[if lt IE 9]>
        </div>
        <![endif]-->
    </header>
    <div class="flashInfo">
    </div>
    <div class="signmain"style="height:678.11px">
        <div class="signcenter">

            <ul id="myTab" class="nav  nav-tabs   " style="height: auto; width: 75%; margin: auto;">
                <li class="active"><a href="#home" data-toggle="tab" style="color: black; font-size: large;">查看报告</a>
                </li>
                <li><a href="#details" data-toggle="tab" style="color: black; font-size: large">检测历史</a>
                </li>
            </ul>



            <form role="form" id="test-for" enctype="multipart/form-data">

                <div id="myTabContent" class="tab-content " style="height: auto; width: 75%; margin: auto;">

                    <div class="tab-pane fade in active " id="home">
                        <div class="form-horizontal" role="form" style="height: auto; margin: 20px auto;">
                            <div class="form-group">
                                <div class="col-sm-4 col-lg-offset-8">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="请输入论文标题" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button">search</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th><span>标题</span></th>
                                    <th>重复率</th>
                                    <th>提交状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="text-align: center">

                                        <label>
                                            <input type="checkbox">
                                        </label>

                                    </td>
                                    <td><span>撒旦</span></td>
                                    <td><span>23.78%</span></td>
                                    <td><span>检测完成</span></td>
                                    <td><a href="#">查看</a>|<a href="#">删除</a>|<a href="#">下载</a></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">

                                        <label>
                                            <input type="checkbox">
                                        </label>

                                    </td>
                                    <td><span>撒旦</span></td>
                                    <td><span>23.78%</span></td>
                                    <td><span>检测完成</span></td>
                                    <td><a href="#">查看</a>|<a href="#">删除</a>|<a href="#">下载</a></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">

                                        <label>
                                            <input type="checkbox">
                                        </label>

                                    </td>
                                    <td><span>撒旦</span></td>
                                    <td><span>23.78%</span></td>
                                    <td><span>检测完成</span></td>
                                    <td><a href="#">查看</a>|<a href="#">删除</a>|<a href="#">下载</a></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">

                                        <label>
                                            <input type="checkbox">
                                        </label>

                                    </td>
                                    <td><span>撒旦</span></td>
                                    <td><span>23.78%</span></td>
                                    <td><span>检测完成</span></td>
                                    <td><a href="#">查看</a>|<a href="#">删除</a>|<a href="#">下载</a></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td style="text-align: center">

                                        <label>
                                            <input type="checkbox"><span>全选</span>
                                        </label>

                                    </td>
                                    <td><a href="#">批量删除</a></td>
                                    <td>
                                        <ul class="pagination">
                                            <li><a href="#">&laquo;</a></li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a href="#">&raquo;</a></li>
                                        </ul>
                                    </td>
                                </tr>

                            </tfoot>
                        </table>

                    </div>
                    <div class="tab-pane fade" id="details">
                        2
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




    <footer class="copyright">
        <!--[if lt IE 9]>
        <div class="copyright">
        <![endif]-->


        <span style="display: none"></span>
        <!--[if lt IE 9]>
        </div>
        <![endif]-->
    </footer>
  
    <script src="../js/jquery-1.9.1.min.js"></script>
 
    <script src="../js/bootstrap.js"></script>
    

</body>
</html>
