

$(function () {

    $('#w0').yiiActiveForm(
        [
            {
                "id": "loginform-username", "name": "username", "container": ".field-loginform-username", "input": "#loginform-username", "error": ".help-block.help-block-error",
                "validate": function (
                    attribute, value, messages, deferred, $form) {
                    yii.validation.required(value, messages, { "message": "用户名不能为空" });
                }
            },
            {
                "id": "loginform-password", "name": "password", "container": ".field-loginform-password", "input": "#loginform-password", "error": ".help-block.help-block-error",
                "validate": function (attribute, value, messages, deferred, $form) { yii.validation.required(value, messages, { "message": "密码不能为空" }); }
            }
        ], []);
    checkLogin();
    $('#loginform-username').blur(function () {
        checkLogin();
    })
    $('#loginform-password').blur(function () {
        checkLogin();
    })
    function checkLogin() {
        if ($("#loginform-username").val() != "" && $("#loginform-password").val() != "") {
            $('#login').attr("disabled", false);
        }
        else {
            $('#login').attr("disabled", true);

        }
    }

    $(".resi").click(function () {
        $(".res").text("注册成功，请返回首页登录!")
    });



})


