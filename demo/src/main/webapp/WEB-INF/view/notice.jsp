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
  <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
  <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
  <title>mgKim</title>
</head>

<script>
  //페이징 설정
  var pageNum = 1; // 현재 페이지 번호
  var pageSize = 10; // 페이지 크기
  var totalCnt;


  $(function (){
    init();
  })


  // 초기화 함수 - 페이지 버튼과 첫 번째 페이지 데이터 조회
  function init() {
    // 전체 데이터 건수를 조회하는 Ajax 요청
    $.ajax({
      url: "/noticeCnt.do",
      type: "POST",
      success: function(cnt) {

        totalCnt = $('#cnt').val();
        console.log(totalCnt)
        // 페이지 버튼 생성 함수 호출
        createPageButtons(totalCnt);
        console.log(totalCnt);
        // 첫 번째 페이지 데이터 조회 함수 호출
        getPageData();
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  }
  // 페이지 버튼을 생성하는 함수
  function createPageButtons(totalCnt) {


    // 전체 데이터 건수를 페이지 크기로 나눈 결과를 올림하여 총 페이지 수 계산
    var totalPages = Math.ceil(totalCnt / pageSize);

    // 페이지 버튼 생성
    var buttonsHtml = "";
    for (var i = 1; i <= totalPages; i++) {
      buttonsHtml += "<button class='page-button' data-page='" + i + "'>" + i + "</button>";
    }
    $("#page-buttons").html(buttonsHtml);

    // 페이지 버튼 클릭 이벤트 처리
    $(".page-button").click(function() {
      // 클릭한 버튼의 페이지 번호를 변수에 저장하고 데이터 조회 함수 호출
      pageNum = $(this).data("page");
      getPageData();
    });
  }

  // 페이지 번호에 따라 데이터를 조회하는 함수
  function getPageData() {
    $.ajax({
      url: "/notice.do",
      type: "POST",
      data: {
        pageNum: pageNum,
        pageSize: pageSize
      },
      success: function(data) {
        // 조회한 데이터를 화면에 출력
        $("#data-container").html(data);
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
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
    <!-- 페이징 UI -->
    <div class="row pt-3 ps-3 pe-3 mb-3 bg-white">
      <ul class="pagination justify-content-center" id="pagination"></ul>
    </div>

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
    <input type="hidden"id="cnt" value="${cnt}">
  </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
  <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>

</body>
</html>
