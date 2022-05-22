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

#table table-hover{
width : 150px;
}

.td2{
text-align:left;
}

</style>






<br><br>
<div id=div1 align="center">
 <font size=5> 회원목록 </font>
</div> <br>

<div id=div2>

 <table class="table table-hover">
 <tr class="table-dark"><td>아이디</td><td>이름</td><td>전화번호</td><td>주소</td></tr>
 <c:forEach var="m"  items="${li}">

 <tr class="table-dark">
 <td><a href=${path}/delete.do?id=${m.id}> ${m.id}</a> </td>
 <td> ${m.name }</td>
  <td>${m.tel }</td>
 <td>${m.roadAddress } </td>
 </tr>
 
</c:forEach>


 </table>
 <form action = "${path}/member_list.do">
   <select name=ch1>
     <option value="name"> 이 름 </option>
     <option value="roadAddress"> 주 소 </option>
   </select>
   <input  type=text  name=ch2>
   <input  type=submit  value="검색하기" >
 </form>
 
</div>
<BR>


<c:import url="/include/footer.jsp" /> 