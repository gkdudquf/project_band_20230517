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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../component/header.jsp"%>

<div id="section">
    <table style="margin: auto">
        <tr>
            <th>이름</th>
            <td>${member.memberName}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${member.memberMobile}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${member.memberName}</td>
        </tr>
        <tr>
            <th>닉네임</th>
            <td>${member.memberNickname}</td>
        </tr>
        <tr>
            <th>사는 지역</th>
            <td>${member.memberLocal}</td>
        </tr>
    </table>
</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>

</script>
</html>