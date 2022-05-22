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
  width:60%;
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

<br><br>
<div id=div1 align="center">
 <font size=5> 쇼핑몰 상품등록 </font>
</div> <br>

<div id=div2>
 
<form name="f1"  onSubmit="return  formCk()"
	  action="${path}/pd_formOk.do"  method="post"
      enctype="multipart/form-data">


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
 
</form>
</div>
<BR>
</section>

<c:import url="/include/footer.jsp" /> 