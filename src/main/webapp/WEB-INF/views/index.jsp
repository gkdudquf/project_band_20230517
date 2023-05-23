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
<%@include file="component/header.jsp"%>

<div id="section" class="container">
    <div id=mainLeft>
        <img src="/resources/img/band_index.png" alt="">
    </div>
    <div id="mainRight">
        <h1>모임이 쉬워진다!</h1>
        <h1>우리끼리 밴드</h1>
        <h4>당신의 모임도 BAND로 시작하세요.</h4> <br>
        <form action="/member/login" method="post" class="login-form">
            <h2>로그인</h2> <br>
            <input type="text" id="login-user-email" name="loginUserEmail" placeholder="아이디" class="user-info">
            <h6 id="email-check-result"></h6>
            <input type="password" id="login-user-password" name="loginUserPassword" placeholder="비밀번호" class="user-info">
            <h6 id="password-check-result"></h6>
            <input type="button" value="로그인" class="submit btn btn-success" onclick="login_check()"> <br><br>
            <div class="go-save">
                <a href="/member/save" onclick="goSave()">회원가입</a>
            </div>
        </form>
    </div>
</div>
<%@include file="component/footer.jsp"%>
</body>
<script>
    const login_check = () => {
        const email = document.getElementById("login-user-email").value;
        const emailResult = document.getElementById("email-check-result");
        const password = document.getElementById("login-user-password").value;
        const passwordResult = document.getElementById("password-check-result");

        $.ajax ({
            type: "post",
            url: "/member/login",
            data: {
                "email": email,
                "password": password
            },
            success: function (res) {
                console.log(res);
                location.href = "/member/mypages?email=" + email;
            },
            error: function () {
                alert("이메일 혹은 비밀번호를 확인해주세요");
            }
        });
    }

    const goSave = () => {
        location.href = "/member/save"
    }
</script>
</html>
