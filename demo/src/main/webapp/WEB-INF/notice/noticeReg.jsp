<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%--헤더 추가--%>
<%@include file ="../include/header.jsp" %>
<%--URL을 이용해 비로그인으로 부정 접속을 막기위해 세션 검사--%>
<% HttpSession sessionChk = request.getSession(false);
  if (sessionChk == null || sessionChk.getAttribute("id") == null || sessionChk.getAttribute("admin").equals("0")) {
    response.sendRedirect("/"); // 메인 페이지로 리다이렉트
  }
%>
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
  <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
  <title>mgKim</title>
</head>

<body>
<!-- Header-->
<header class="bg-dark py-2">
  <div class="container px-4 px-lg-2 my-2">
    <div class="text-left text-white">
      <h3 class="display-4 fw-bolder">Notice</h3>
    </div>
  </div>
</header>
<!-- Section-->
<form action="/noticeSubmit.do" method="post" >
  <table class="table table-hover">
    <tr class="table-light"><td>제목</td><td class=td2>
      <input type=text name="title" size=100 ></td></tr>
    <tr class="table-light"><td>내용</td>
      <td class=td2><textarea name="content"  cols="50" wrap="hard" rows=15>
    </textarea></td></tr>
    <tr class="table-dark"><td colspan=2 align="center">
      <input type="hidden" name="id" value="${id.ID}">
      <input type=submit value="등록하기" >
      <input type=reset value="다시작성" ></td>
    </tr>
  </table>
</form>

<!-- Footer-->
<footer class="py-5 bg-dark">
  <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>

</body>
</html>
