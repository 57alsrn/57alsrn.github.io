<%--
  Created by IntelliJ IDEA.
  User: mingu
  Date: 2023/04/09
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
</head>
<body>
<table class="table table-hover">
    <tr class="table-dark"><td>제목</td><td class=td2>
        <input type=text name="title" size=20 ></td></tr>
    <tr class="table-dark"><td>상품명</td>
        <td class=td2><input type=text name="pname" size=15 ></td></tr>
    <tr class="table-dark"><td>가격</td>
        <td class=td2><input type=number name="price" size=5 ></td></tr>
    <tr class="table-dark"><td>수량</td>
        <td class=td2><input type=number name="quantity" size=5 ></td></tr>
    <tr class="table-dark"><td>배송비</td>
        <td class=td2><input type=number name="shipping" size=5 ></td></tr>
    <tr class="table-dark"><td>상품이미지</td>
        <td class=td2><input type=file name="imgFile"  ></td></tr>
    <tr class="table-dark"><td>상품 설명</td>
        <td class=td2><textarea name="detail"  cols="50" wrap="hard" rows=15>
    </textarea></td></tr>



    <tr class="table-dark"><td colspan=2 align="center">
        <input type=submit value="상품등록" >
        <input type=reset value="다시작성" ></td>
    </tr>
</table>
</body>
</html>
