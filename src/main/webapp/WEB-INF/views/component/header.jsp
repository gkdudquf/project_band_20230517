<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-23
  Time: 오전 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="/resources/js/bootstrap.bundle.min.js"></script>
<div id="header" class="container">
    <ul>
        <c:choose>
            <c:when test="${sessionScope.loginNickname == null}">
                <li class="index-btn">
                    <button type="button" class="btn btn-outline-dark" onclick="goIndex()">BAND</button>
                </li>
            </c:when>
            <c:otherwise>
                <li class="index-btn">
                    <button type="button" class="btn btn-outline-dark" onclick="goMyGroupList()">BAND</button>
                </li>
            </c:otherwise>
        </c:choose>

        <div class="login-name">
        <c:choose>
            <c:when test="${sessionScope.loginNickname == null}">
                <a href='/member/save'>회원가입</a>
            </c:when>
            <c:otherwise>
                <div class="dropdown">
                    <i class="bi bi-person-circle" type="button" data-bs-toggle="dropdown" aria-expanded="false"></i>
                    <ul class="dropdown-menu" style="position: relative; z-index: 2;">
                        <li><a class="dropdown-item" href="/member/myInfo">내 정보</a></li>
                        <li><a class="dropdown-item" href="#">내가 쓴 글</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">소모임</a></li>
                        <li><a class="dropdown-item" href="/group/list">전체모임</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/member/logout">로그아웃</a></li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
        </div>
    </ul>


</div>
<script>
    const goIndex = () => {
        location.href = "/";
    }

    const goMyGroupList = () => {
        location.href = "/group/myGroupList";
    }


</script>