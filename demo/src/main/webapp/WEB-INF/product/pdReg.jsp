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
<style>
    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
</style>
<script>
    $(function(){
        init();

    });

    init = () => {

        $('.td2-num').on('keyup', function(e) {
            let keyCode = e.which;
            if (keyCode < 48 || keyCode > 57) {
                e.preventDefault();
                alert('숫자를 입력해주세요.')
            }
        });





    }
    pdReg = () =>{
        if(confirm('등록을 하시겠습니까?')){
            $('#pdRegForm').submit();
        }
        else{
            return false;
        }
    }


</script>

<body>
<table class="table table-hover">
    <form action = "/pdRegIns.do" method="post" id = "pdRegForm">
    <tr class="table-dark"><td>제목</td><td class=td2>
        <input type=text name="pTitle" size=100 ></td></tr>
    <tr class="table-dark"><td>상품명</td>
        <td class=td2><input type=text name="pName" id = "pName" size=100 ></td></tr>
    <tr class="table-dark"><td>가격</td>
        <td class=td2-num><input type=number name="pPrice" id="pPrice" size=5 ></td></tr>
    <tr class="table-dark"><td>수량</td>
        <td class=td2-num><input type=number name="pQuantity" id = "pQuantity" size=5 ></td></tr>
    <tr class="table-dark"><td>배송비</td>
        <td class=td2-num><input type=number name="pShipping" id = "pShipping" size=5 ></td></tr>
    <tr class="table-dark"><td>상품이미지</td>
        <td class=td2><input type=file name="pImgFile"  ></td></tr>
    <tr class="table-dark"><td>상품 설명</td>
        <td class=td2><textarea name="pDetail"  cols="50" wrap="hard" rows=15>
    </textarea></td></tr>



    <tr class="table-dark"><td colspan=2 align="center">
        <input onclick="pdReg();" value="상품등록" >
        <input type=reset value="다시작성" ></td>
    </tr>
    </form>
</table>
</body>
</html>
