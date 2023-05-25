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
    <div class="container" id="container">
        <h2>회원가입</h2> <br>
    </div>
    <form style="width: 700px;" action="/member/save" method="post" id="signup_form" onsubmit="return signup_check()" class="container">
        <h6>회원계정</h6>
        <input type="text" id="member_email" name="memberEmail" onblur="email_check()" class="form-control">
        <h6 id="email_check_result"></h6>
        <br>

        <h6>비밀번호</h6>
        <div class="row">
            <div class="col-md-12">
                <div class="input-group">
                    <input type="password" id="member_password" name="memberPassword" onblur="password_check()" class="form-control">
                    <button onclick="change_input_type(event)" class="btn btn-success" id="button-addon2">비밀번호 보기</button>
                </div>
                <h6 id="password_check_result"></h6>
            </div>
        </div>
        <br>

        <h6>비밀번호 확인</h6>
        <input type="password" id="password_confirm" name="passwordConfirm" onblur="password_confirm1()" class="form-control">
        <h6 id="password_confirm_result"></h6>

        <br>


        <h6>닉네임</h6>
        <div class="row">
            <div class="col-md-12">
                <div class="input-group">
                    <input type="text" id="member_nickname" name="memberNickname" class="form-control">
                    <input type="button" onclick="nickname_check()" class="btn btn-success" value="중복확인">
                </div>
                <h6 id="nickname_check_result"></h6>
            </div>
        </div>
        <br>

        <h6>이름</h6>
        <input type="text" id="member_name" name="memberName" onblur="name_check()" class="form-control">
        <h6 id="name_check_result"></h6>
        <br>

        <h6>거주지</h6>
        <input type="text" id="member_local" name="memberLocal" onblur="local_check()" class="form-control">
        <h6 id="local_check_result"></h6>
        <br>

        <h6>전화번호</h6>
        <input type="text" id="member_mobile" name="memberMobile" onblur="mobile_check()" class="form-control">
        <h6 id="mobile_check_result"></h6>
        <br>

        <div class="row">
            <div class="col d-grid">
                <input type="submit" value="가입하기" class="btn btn-success">
            </div>
        </div>
    </form>
</div>

<%@include file="../component/footer.jsp"%>
</body>
<script>
    const email_check = () => {
        const memberEmail = document.getElementById("member_email").value;
        const emailResult = document.getElementById("email_check_result");

        $.ajax ({
            type: "post",
            url: "/member/emailCheck",
            data: {
                "memberEmail": memberEmail
            },
            success: function (res) {
                emailResult.style.color = "green";
                emailResult.innerHTML = "사용가능한 이메일입니다";
                return true;
            },
            error: function () {
                emailResult.style.color = "red";
                emailResult.innerHTML = "중복된 이메일입니다";
                return false;
            }

        })
    }



    const password_check = () => {
        const password = document.getElementById("member_password").value;
        const passwordResult = document.getElementById("password_check_result");
        const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{5,10}$/;

        if (password.length == 0) {
            passwordResult.style.color = "red";
            passwordResult.innerHTML = "필수 입력 항목입니다";
            return false;
        }
        else if (password.match(exp)) {
            passwordResult.style.color = "green";
            passwordResult.innerHTML = "사용 가능한 비밀번호입니다";
            return true;
        } else {
            passwordResult.style.color = "red";
            passwordResult.innerHTML = "영문소문자/숫자 필수, 5~10자로 입력해주세요";
            return false;
        }
    }

    const password_confirm1 = () => {
        const password = document.getElementById("member_password").value;
        const passwordConfirm = document.getElementById("password_confirm").value;
        const checkResult = document.getElementById("password_confirm_result");

        if (passwordConfirm == password) {
            checkResult.style.color = "green";
            checkResult.innerHTML = "일치합니다";
            return true;
        } else {
            checkResult.style.color = "red";
            checkResult.innerHTML = "일치하지 않습니다";
            return false;
        }
    }

    const change_input_type = () => {
        event.preventDefault();
        const passwordInput = document.getElementById("member_password");
        const passwordReInput = document.getElementById("password_confirm");

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            passwordReInput.type = "text";
            event.target.innerText = "비밀번호 숨기기";
        } else {
            passwordInput.type = "password";
            passwordReInput.type = "password";
            event.target.innerText = "비밀번호 보기";
        }
        return false;
    }

    const nickname_check = () => {

        const memberNickname = document.getElementById("member_nickname").value;
        const result = document.getElementById("nickname_check_result");
        $.ajax ({
            type: "post",
            url: "/member/nicknameCheck",
            data: {
                "memberNickname": memberNickname
            },
            success: function () {
                result.style.color = "green";
                result.innerHTML = "사용가능한 닉네임입니다";
            },
            error: function () {
                result.style.color = "red";
                result.innerHTML = "중복된 닉네임입니다"
            }
        })
    }


    const name_check = () => {
        const memberName = document.getElementById("member_name").value;
        const nameResult = document.getElementById("name_check_result");

        if (memberName.length == 0) {
            nameResult.style.color = "red";
            nameResult.innerHTML = "필수입력입니다";
            return false;
        } else {
            nameResult.innerHTML = "";
            return true;
        }
    }

    const local_check = () => {
        const memberLocal = document.getElementById("member_local").value;
        const localResult = document.getElementById("local_check_result");

        if (memberLocal.length == 0) {
            localResult.style.color = "red";
            localResult.innerHTML = "필수입력입니다";
            return false;
        } else {
            localResult.innerHTML = "";
            return true;
        }
    }

    const mobile_check = () => {
        const memberMobile = document.getElementById("member_mobile").value;
        const mobileResult = document.getElementById("mobile_check_result");
        const exp = /^\d{3}-\d{4}-\d{4}$/;

        if (memberMobile.length == 0) {
            mobileResult.style.color = "red";
            mobileResult.innerHTML = "필수입력입니다";
            return false;
        } else if (memberMobile.match(exp)) {
            mobileResult.innerHTML = "";
            return true;
        } else {
            mobileResult.style.color = "red";
            mobileResult.innerHTML = " 010-0000-0000 형식으로 입력해주세요";
            return false;
        }
    }

    const signup_check = () => {
        const memberEmail = document.getElementById("member_email");
        const memberPassword = document.getElementById("member_password");
        const passwordConfirm = document.getElementById("password_confirm");
        const memberNickname = document.getElementById("member_nickname");
        const memberName = document.getElementById("member_name");
        const memberLocal = document.getElementById("member_local");
        const memberMobile = document.getElementById("member_mobile");


        if(memberEmail.value.length === 0){
            memberEmail.focus();
            return false;
        }

        if (!password_check()) {
            memberPassword.focus();
            return  false;
        }

        if (!password_confirm1()) {
            passwordConfirm.focus();
            return  false;
        }

        if(memberNickname.value.length === 0){
            memberEmail.focus();
            return false;
        }


        if (!name_check()) {
            memberName.focus();
            return  false;
        }

        if (!local_check()) {
            memberLocal.focus();
            return  false;
        }

        if (!mobile_check()) {
            memberMobile.focus();
            return  false;
        }
        document.getElementById("signup_form").submit();
    }

</script>
</html>