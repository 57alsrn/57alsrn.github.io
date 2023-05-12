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
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <title>mgKim</title>
</head>

<script>
  var pageNum = 1 ;  //현재 페이지 번호
  var pageSize = 10;
  var pagenumSize = 10;

  //onLoad event
  $(function (){
    init();


  })

  function init(){
    noticeList(pageNum);
  }
  function noticeList(pageNum) {
    pageNum = pageNum || 1;

    $.ajax({
      url       : "/notice.do"
      , type    : "post"
      , dataType: "text"
      , data    : {
        currentPage  : pageNum
        , pageSize   : pageSize
        , pagenumSize: pagenumSize

      }
      , success : function (data) {
        console.log(data);

      }
      , error   : function () {
        alert('등록실패')
      }


    })
  }

</script>

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
<section class="py-5">
  <div>
    <table class="table table-hover">
      <tr class="table-dark" style="text-align: center">
        <td style="width: 15%">글번호</td>
        <td style="width: 60%">제목</td>
        <td style="width: 25%">등록일</td>

      </tr>

      <c:forEach var="l"  items="${li}">

        <tr class="table-light text-center">
          <td>${l.NOT_CODE}</td>
<%--          <td><a href=${path}/pd_detail.do?pcode=${m.pcode}> ${m.title } </a></td>--%>
          <td>${l.NOT_TITLE }</td>
          <td>${l.DAY }</td>

<%--          <td><img src="${path}/product/files/${m.img}" width=35  height=35--%>
<%--                   onclick="window.open(this.src)"/></td>--%>
        </tr>

      </c:forEach>

    </table>
    <div style="text-align: center">
      <form action = "${path}/pd_list.do">
        <select  name = ch1>
          <option value = "title"> 제 목 </option>
          <option value = "pname"> 상품이름 </option>
        </select>
        <input type = text name = ch2>
        <input class="btn btn-dark" type = submit value ="검색하기">

      </form>
      <br>
      <c:if test="${id.ADMIN eq 1}">
        <input class="btn text-black bg-white btn-outline-secondary" onclick="location.href='/noticeReg.do'" value ="등록하기">
      </c:if>
    </div>

  </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
  <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>

</body>
</html>
