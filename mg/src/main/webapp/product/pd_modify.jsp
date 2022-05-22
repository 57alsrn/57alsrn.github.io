<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" 
          prefix="c" %>   

<%@ taglib prefix="fmt" 
     uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/include/header.jsp" /> 


<style type="text/css">
table, tr {
  text-align:center;
}

#div2, #div1 {
  width:70%;
  margin:0 auto;
  text-align:center; 
}

table, th, tr ,td {
  border : 1px  solid;
}

table{
  width : 100% ;
  height : 250px ;
}

#td1 {
 width : 100px;
}

.td2{
text-align:left;
}

</style>

<script>
  
	  function formCk(){
			if (f1.title.value ==""){
				alert("제목을 입력해 주세요.")  
				return  false;
			}  
			if (f1.pname.value ==""){
				alert("상품명을 입력해 주세요.")  
				return  false;
			} 
			if (f1.price.value ==""){
				alert("가격을 입력해 주세요.")  
				return  false;
			} 
			if (f1.quantity.value ==""){
				alert("수량을 입력해 주세요.")  
				return  false;
			} 
			if (f1.shipping.value ==""){
				alert("배송비를 입력해 주세요.")  
				return  false;
			} 
			
			if (f1.detail.value ==""){
				alert("상품설명을 입력해 주세요.")  
				return  false;
			}   
	
	  
  } 
  
 
</script>

<section>

<fmt:formatNumber var="price" value="${m.price}" type="number"/><br>

<br>
<div id=div1 align="center">
 <font size=5> 쇼핑몰 상품 수정 </font>
</div> <br>

<div id=div2>
 
<form name="f1"  onSubmit="return  formCk()"
      action="${path}/pd_UpdateOK.do"  method="post"
      enctype="multipart/form-data">

 <input type="hidden" name="pcode" value="${m.pcode}">  
<table class="table table-hover">
 <tr class="table-dark"><td width=20%>제목</td><td class=td2 width=45%>
    <input type=text name="title" size=20 value="${m.title}" ></td>
    <td rowspan=8 width=35%> <img src="${path}/product/files/${m.img}" width=170 height=250 /> </td></tr>
 <tr class="table-dark"><td>상품명</td>
    <td class=td2><input type=text name="pname" size=15  value="${m.pname}" ></td></tr>
  <tr class="table-dark"><td>가격</td>
    <td class=td2><input type=number name="price" size=5  value="${m.price}" > &nbsp; (원)</td></tr>
  <tr class="table-dark"><td>수량</td>
    <td class=td2><input type=number name="quantity" size=5  value="${m.quantity}" ></td></tr>
  <tr class="table-dark"><td>배송비</td>
    <td class=td2><input type=number name="shipping" size=5  value="${m.shipping}" ></td></tr>
 <tr class="table-dark"><td>파일사이즈</td>
    <td class=td2>  ${m.imgsize} </td></tr>
 <tr class="table-dark"><td>저장날짜</td>
    <td class=td2>
    
    <fmt:formatDate value="${m.rdate}"
         pattern="yyyy-MM-dd"/>
     
    </td></tr>
  <tr class="table-dark"><td>상품이미지</td>
    <td class=td2 colspan=2><input type=file name="imgFile"  ></td></tr>
  <tr class="table-dark"><td>상품 설명</td>
    <td class=td2 colspan=2><textarea name="detail"  cols="50" wrap="hard" rows=15>
    </textarea></td></tr>
    
 <tr><td colspan=3 align="center">
  <input type=submit value="상품수정" >
  <input type = button value ="뒤로가기" onClick="location.href= '${path}/pd_list.do';"></td>
  </tr>
 </table>
 
</form>
</div>
<BR>
</section>

<c:import url="/include/footer.jsp" /> 