<%--
  Created by IntelliJ IDEA.
  User: mingu
  Date: 2023/04/04
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>

<head>
    <meta charset="UTF-8">

    <title>mgkim</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="../../static/css/styles.css" rel="stylesheet" />

</head>
<style>
    @media (max-width: 991px) {
        .form-inline.ml-auto {
            display: none;
        }
    }

</style>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../../../static/js/scripts.js"></script>
<script>

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
<!-- 네비게이션 바 추가 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand ml-3" href="/main.do">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="/notice.do">Notice</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/pdList.do">List</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/test.do">Test</a>
            </li>

        </ul>
        <!-- 검색창 추가 -->
        <form class="form-inline ml-auto">
            <input style="width : 350px" class="form-control mr-sm-4" id="sSearchBar" type="search" placeholder="검색어를 입력해주세요." aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <!-- 장바구니와 로그인 버튼 추가 -->
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Cart</a>
            </li>
            <li class="nav-item">
                <a class="nav-link mx-2" href="#" id="myPage" >My page</a>
            </li>
            <li class="nav-item">
                <a class="nav-link mx-2" href="#" id="logOut" onclick="logOut()">Log out</a>
            </li>
        </ul>
    </div>
</nav>
<!-- 부트스트랩 CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>