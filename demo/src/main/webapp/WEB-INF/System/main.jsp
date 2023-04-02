<%--
  Created by IntelliJ IDEA.
  User: mingu
  Date: 2023/03/03
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
    <title>mgKim</title>
    <%--    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>--%>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>--%>

    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<style>
    /* 로그인 폼을 감싸는 div 요소 스타일 */
    .login-form {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f4f4f4;
        box-shadow: 0px 0px 10px #ccc;
    }

    /* 로그인 폼 제목 스타일 */
    .login-form h2 {
        text-align: center;
        margin-top: 0;
    }

    /* 입력 폼 요소 스타일 */
    .login-form div input[type="text"],
    .login-form div input[type="password"] {
        display: block;
        width: 100%;
        margin-bottom: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    .container {
        display: flex;
        justify-content: center;
    }

    /*.modal {*/
    /*    display: none; !* 모달 창 숨기기 *!*/
    /*    position: fixed; !* 위치 고정 *!*/
    /*    z-index: 1; !* 화면 상단에 표시 *!*/
    /*    left: 0;*/
    /*    top: 0;*/
    /*    width: 100%;*/
    /*    height: 100%;*/
    /*    overflow: auto; !* 스크롤바 표시 *!*/
    /*    background-color: rgba(0, 0, 0, 0.4); !* 흐릿한 배경 *!*/
    /*}*/

    .modal-content {
        background-color: #fefefe; /* 모달 내용 배경 */
        margin: 15% auto; /* 모달 창 상단 여백 */
        padding: 20px;
        border: 1px solid #888;
        width: 40%; /* 모달 창 너비 */
    }

    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<script>
    $(function () {
        init();

    });

    function init() {

    }
    function logOut(){
        if(confirm('정말로 로그아웃 하시겠습니까?')){
            window.location.href = "/logout.do"
        }
        else{
            return false;
        }
    }
</script>

<body>

<c:if test="${id != null}">
    <div>
        <p>아이디 : ${id.ID}</p> <br>
        <p>비밀번호 : ${id.PW}</p> <br>
        <p>사용자 이름 :${id.NAME}</p> <br>
    </div>
    <button type="button" class="btn btn-light" onclick="logOut()">로그아웃</button>
</c:if>


</body>

</html>
