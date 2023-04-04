<%--
  Created by IntelliJ IDEA.
  User: mingu
  Date: 2023/03/03
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%--jstl 추가--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%--헤더 추가--%>
<%@include file ="../include/header.jsp" %>
<%--URL을 이용해 비로그인으로 부정 접속을 막기위해 세션 검사--%>
<%
    HttpSession sessionChk = request.getSession(false);
    if (sessionChk == null || sessionChk.getAttribute("id") == null) {
        response.sendRedirect("/"); // 메인 페이지로 리다이렉트
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon"
          href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">
    <title>mgKim</title>
    <%--    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>--%>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>


    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
</head>
<style>

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
