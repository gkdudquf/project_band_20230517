<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오후 3:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



<div id="section" style="height: 1300px">
    <h2>모임전체리스트</h2>
    <section class="py-5">

        <c:choose>
            <c:when test="${groupList == null}">
                <h1>등록된 모임이 없습니다.</h1>
            </c:when>

            <c:otherwise>
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <c:forEach items="${groupList}" var="group">
                            <div class="col mb-5">
                                <div class="card h-100">
                                    <img src="${pageContext.request.contextPath}/upload/${group.storedFileName}" alt="" style="max-height: 250px;">
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <h5 class="fw-bolder">${group.groupName}</h5> <br>
                                        </div>
                                        <div style="text-align: left">
                                            모임지역: ${group.createMemberLocal} <br>
                                            모임소개: ${group.groupInfo}
                                        </div>

                                    </div>
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="/group/detail?id=${group.id}">View Details</a></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:otherwise>

        </c:choose>
    </section>
</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>

</script>
</html>