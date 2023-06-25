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
    <link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css"/>
    <script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
    <title>mgKim</title>
</head>
<body>
<!-- Header-->
<header class="bg-dark py-2">
    <div class="container px-4 px-lg-2 my-2">
        <div class="text-left text-white">
            <h3 class="display-4 fw-bolder">List</h3>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5">
    <div>
        <div style="margin: 0 0 10px 90%;">
            <button type="button" class="btn btn-dark" onclick="location.href = '/pdReg.do'">등록하기</button>
        </div>

        <table class="table table-hover">
            <tr class="table-dark" style="text-align: center">
                <td>글번호</td>
                <td>제목</td>
                <td>상품이름</td>
                <td>가격</td>
                <td>수량</td>
                <td>배송비</td>
                <td>판매자</td>
                <td>이미지</td>
            </tr>

            <c:forEach var="m"  items="${li}">

                <tr class="table-light text-center">
                    <td>${m.L_CODE}</td>
                    <td>${m.L_TITLE}
                    <%--<a href=${path}/pd_detail.do?pcode=${m.pcode}> ${m.title } </a>--%>
                    </td>
                    <td>${m.PD_NAME }</td>
                    <td>${m.PD_PRICE }</td>
                    <td>${m.PD_AMOUNT }</td>
                    <td>${m.DL_PRICE }</td>
                    <td>${m.ID}</td>
                    <td><img src="${path}/product/files/${m.IMG}" width=35  height=35
                             onclick="window.open(this.src)"/></td>
                </tr>

            </c:forEach>

        </table>
        <div style="text-align: center">
            <form action = "${path}/pd_list.do">
                <select name = ch1>
                    <option value = "title"> 제 목 </option>
                    <option value = "pname"> 상품이름 </option>
                </select>
                <input type = text name = ch2>
                <button class="btn btn-dark">검색하기</button>

            </form>
        </div>

    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>

</body>
</html>
