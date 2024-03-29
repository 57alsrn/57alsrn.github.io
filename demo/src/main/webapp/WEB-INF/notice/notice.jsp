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

  //onLoad event
  $(function (){
    // noticeList();

  })



  function init(){

  }
  //공지 리스트
  function noticeList(pageNum) {
    pageNum = pageNum || 1;
    let pageSize = 10;
    let pagenumSize = 10;

    $.ajax({
      url       : "/noticeList.do"
      , type    : "get"
      , dataType: "text"
      , data    : {
        currentPage  : pageNum
        , pageSize   : pageSize
        , pagenumSize: pagenumSize

      }
      , success : function (data) {

        console.log(data)

      }
      , error   : function () {
        alert('등록실패')
      }


    })
  }
  function sList(){

    $('#sFrom').submit();

    return false;
    let sName = $('#sName').val();
    let sSelect = $('#sSelect').val();

    var data = {
      sName: sName,
      sSelect: sSelect
    };

    // URL 매개변수(query parameter) 생성
    var queryString = Object.keys(data).map(function(key) {
      return key + '=' + encodeURIComponent(data[key]);
    }).join('&');

    // GET 요청 보내기
    window.location.href = '/noticeSearch.do?' + queryString;
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
    <form id="sFrom" action="/noticeSearch.do" method="get">
      <div style="text-align: center">

        <select  id="sSelect"  name = sSelect>
          <option value = "title"> 제 목 </option>
          <%--          <option value = "pname"> 상품이름 </option>--%>
        </select>
        <input type = text id="sName" name = sName>

        <input class="btn btn-dark" type = submit  onclick="sList();" value ="검색하기">
        <br>

      </div>
    </form>
    <c:if test="${id.ADMIN eq 1}">
      <br>
    <div class="text-center">
      <input class="btn text-black bg-white btn-outline-secondary" onclick="location.href='/noticeReg.do'" value ="등록하기">
    </div>
    </c:if>
  </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
  <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>

</body>
</html>