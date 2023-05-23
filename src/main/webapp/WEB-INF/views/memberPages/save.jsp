<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp"%>

<div id="section">
    <div class="container">
        <h2>회원가입</h2>
    </div>
    <form action="/member/save" method="post" onsubmit="return signup_check()" class="container">
        <label for="member_email">회원계정</label>
        <input type="text" id="member_email" name="memberEmail" onblur="email_check()" class="form-control">
        <h6 id="email-check-result"></h6>

        <label for="member_password">비밀번호</label>
        <div class="row">
            <div class="col-md-12">
                <div class="input-group">
                    <input type="password" id="member_password" name="memberPassword" onblur="password_check()" class="form-control">
                    <button onclick="change_input_type(event)" class="btn btn-success" id="button-addon2">비밀번호 보기</button>
                </div>
                <h6 id="password-check-result"></h6>
            </div>
        </div>



    </form>
</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>
    const email_check = () => {
        const memberEmail = document.getElementById("member_email").value;
        const emailResult = document.getElementById("email-check-result");

        $.ajax ({
            type: "post",
            url: "/member/emailCheck",
            data: {
                "memberEmail": memberEmail
            },
            success: function (res) {
                emailResult.innerHTML = "사용가능한 이메일입니다";
            },
            error: function () {
                emailResult.innerHTML = "중복된 이메일입니다";
                emailResult.style.color = "red";
            }

        })
    }

    const password_check = () => {
        const password = document.getElementById("member_password").value;
        const passwordResult = document.getElementById("password-check-result");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;

        if (password == exp) {
            passwordResult.innerHTML = "사용 가능한 비밀번호입니다";
        } else {
            passwordResult.innerHTML = "영문소문자/숫자 필수, 5~10자로 입력해주세요";
            passwordResult.style.color = "red";
        }
    }

    const change_input_type = () => {
        event.preventDefault();
        const passwordInput = document.getElementById("member_email");
        const passwordReInput = document.getElementById("password-Confirm");
    }
</script>
</html>
