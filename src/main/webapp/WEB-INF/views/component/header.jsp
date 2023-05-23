<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-23
  Time: 오전 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="header" class="container">
    <ul>
        <li>
            <button type="button" class="btn btn-outline-dark" onclick="goIndex()">BAND</button>
        </li>
        <li class="login-name" id="login-area"></li>
    </ul>


</div>
<script>
    const goIndex = () => {
        location.href = "/";
    }

    const loginArea = document.getElementById("login-area");
    const loginNickname = '${sessionScope.loginNickname}';
    if (loginNickname.length != 0) {
        loginArea.innerHTML = loginNickname + "님 환영해요!" +
            "<a href='member/mypage'>mypage</a>" +
            "<a href='member/logout'>logout</a>";
    } else {
        loginArea.innerHTML = "<a href='/member/save'>회원가입</a>";

    }

</script>