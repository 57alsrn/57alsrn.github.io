<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" 
          prefix="c" %>   

<c:import url="/include/header.jsp" /> 

<style type="text/css">
table, tr {
  text-align:center;
}

#div2, #div1 {
  width:90%;
  margin:0 auto;
  text-align:center; 
}

table, th, tr ,td {
  border : 1px  solid;
}

table{
  width : 100% ;
}

#td1 {
 width : 100px;
}

.td2{
text-align:left;
}

</style>


<body>
<section>

<br><br>
<div id=div1 align="center">
 <font size=5> 상품 목록보기 </font>
</div> <br>

<div id=div2>

 <table class="table table-hover">
 <tr class="table-dark"><td>글번호</td><td>제목</td><td>상품이름</td>
 <td>가격</td><td>수량</td><td>배송비</td><td>판매자</td><td>이미지</td></tr>

 <c:forEach var="m"  items="${li}">

 <tr class="table-dark">
 <td>${m.wnum}</td>
 <td><a href=${path}/pd_detail.do?pcode=${m.pcode}> ${m.title } </a></td>
 <td>${m.pname }</td>
 <td>${m.price }</td>
 <td>${m.quantity }</td>
 <td>${m.shipping }</td>
 <td>${m.userID}</td>
 <td><img src="${path}/product/files/${m.img}" width=35  height=35 
 onclick="window.open(this.src)"/></td>
 </tr> 
 
</c:forEach>

 </table>
 <form action = "${path}/pd_list.do">
 	<select name = ch1>
 		<option value = "title"> 제 목 </option>
 		<option value = "pname"> 상품이름 </option> 
 	</select>
 	<input type = text name = ch2>
 	<input type = submit value ="검색하기">
 </form>
</div>
<BR>
</section>
</body>
<c:import url="/include/footer.jsp" /> 
