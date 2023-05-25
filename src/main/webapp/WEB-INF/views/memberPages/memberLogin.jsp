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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp"%>

<div id="section">
    <form style="margin: auto;" action="/member/login" method="post" class="login-form">
        <h2>로그인</h2> <br>
        <input type="text" id="login-user-email" name="memberEmail" placeholder="아이디" class="user-info"> <br>
        <input type="password" id="login-user-password" name="memberPassword" placeholder="비밀번호" class="user-info"> <br>
        <input type="submit" value="로그인" class="submit btn btn-success"> <br><br>
    </form>
</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>
    const login_check = () => {
        const email = document.getElementById("login-user-email").value;
        const password = document.getElementById("login-user-password").value;
        $.ajax ({
            type: "post",
            url: "/member/login",
            data: {
                "email": email,
                "password": password
            },
            success: function (res) {
                location.href = "/group/myGroupList";
            },
            error: function () {
                alert("이메일 혹은 비밀번호를 확인해주세요");
            }
        });
    }
</script>
</html>