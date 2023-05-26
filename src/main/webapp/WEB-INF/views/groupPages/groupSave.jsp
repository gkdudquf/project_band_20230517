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
    <div class="container">
        <h2>모임 생성하기</h2> <br>
    </div>
    <form style="width: 700px;" action="/group/save" method="post" class="container" enctype="multipart/form-data">
        <img id="uploadedImage" src="/resources/img/GroupSave.PNG" alt="" style="max-width: 500px; max-height: 200px;
             border-radius: 80px; display:block; margin:auto;"><br>
        <input type="file" name="groupProfileFile" multiple onchange="showImage(this);"> <br>

        <br>
        <h6>모임이름</h6>
        <input type="text" id="group_name" name="groupName" onblur="group_name_check()" class="form-control">
        <h6 id="name_check_result"></h6> <br>

        <h6>내 동네</h6>
        <input type="text" name="createdMemberLocal" value="${sessionScope.loginLocal}" readonly class="form-control">
        <br>

        <h6>모임 소개글</h6>
        <textarea name="groupInfo" id="group_info" cols="30" rows="10" class="form-control"></textarea> <br>

        <div class="row">
            <div class="col d-grid">
                <input type="submit" value="생성하기" class="btn btn-success">
            </div>
        </div>
    </form>
</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>
    const group_name_check = () => {
        const groupName = document.getElementById("group_name").value;
        const result = document.getElementById("name_check_result");
        $.ajax ({
            type: "post",
            url: "/group/groupNameCheck",
            data: {
              "groupName": groupName
            },
            success: function () {
                result.innerHTML = "사용가능한 모임이름입니다"
                result.style.color = "green";
            },
            error: function () {
                result.innerHTML = "중복된 모임이름입니다"
                result.style.color = "red";
            }
        });
    }

    function showImage(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                const imageElement = document.getElementById('uploadedImage');
                imageElement.src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</html>