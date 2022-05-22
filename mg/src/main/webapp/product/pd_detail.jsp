<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" 
          prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="session" />
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
<script>
  
  
  function delCk(pcode){
	  
	  if(confirm("정말로 삭제하시겠습니까?")==true){
		  //alert("pcode 확인: " + pcode);
		  location.href="${path}/pd_delete.do?pcode="+pcode ;
		  
	  }
	  else{
		  alert("취소완료");
		  return false;
	  } 
	}
	  
  
  
 
  function RP_CK(){
	  if(f1.content.value ==""){
		  alert("내용을 입력해주세요.")
		  return false;
	  }
	  else{
			  var rst = confirm("댓글을 등록할까요?");
			  if(rst==true){
			  alert("등록완료");
			  }
			  else{
				  alert("취소완료");
				  return false;
			  }    
		  }  
	  }
	  
  
</script>

<body>
 
<section>

<br><br>
<div id=div1 align="center">
 <font size=5> 상품 상세보기 </font>
</div> <br>

<div id=div2>

 <table class="table table-hover">
 <tr class="table-dark">
 	<td width=10%>제목</td>
 	<td width=15%>${m.title}</td>
 	<td width=25%>상품 설명</td>
 	<td rowspan = 6 width = 25%> <img src="${path}/product/files/${m.img}" width=170 height=250 /> </td>
    </tr>
  <tr class="table-dark"><td>상품명</td>
  <td>${m.pname}</td>
  <td rowspan=5 width = 25% style = "text-align:left;">${m.detail} </td></tr>
  <tr class="table-dark"><td>가격</td><td>${m.price}</td></tr>
  <tr class="table-dark"><td>수량</td><td>${m.quantity}</td></tr>
  <tr class="table-dark"><td>배송비</td><td>${m.shipping}원&nbsp;</td></tr>
  <tr class="table-dark"><td>판매자</td><td> ${m.userID}</td></tr>
  			
  <tr class="table-dark"><td colspan=4 align="center">
  
  <c:if test="${session == m.userID || session == 'admin' }">
  <input type=submit value="상품수정" onClick="location.href= '${path}/pd_modify.do?pcode=${m.pcode}';">
 
  	<input type=submit value="상품삭제" onClick = "delCk(${m.pcode})">
  
  </c:if>
  <input type = button value ="뒤로가기" onClick="location.href= '${path}/pd_list.do';"> </td>
  </tr>
    </table>
  
 	
 	

</div>
<BR>
		<!-- 댓글기능 시작 -->
			
			<c:forEach items="${li}" var="l">
				
					<div>
						<hr style="border:5px color= silver;" align = "left" width="100%">
						<p>&emsp;${l.userID}/&emsp;<fmt:formatDate value="${l.rdate}" pattern="yyyy-MM-dd" /></p>
						<p>&emsp;${l.content }</p>
						
						 <c:if test="${session == l.userID || session == 'admin' }">
						 
						 <form method="post" onSubmit = "return confirm('정말 삭제하시겠습니까?')"
						 action="${path}/pd_reply_delete.do?pcode=${m.pcode}">
						 <input type="hidden" name = "bno" value = "${l.bno}">
						 <p>&emsp;<input type=submit value="댓글삭제" onClick ="del_RP_Ck()"></p>
						 </form>
						 
 						 </c:if>
					</div>
				
			</c:forEach>
			<hr style="border:5px color= silver;" align = "left" width="100%">
		<div id = div2>

	<form  name = f1 onSubmit = "return RP_CK()"
	action="${path}/pd_reply.do?pcode=${m.pcode}">
	
		<p>
			<label>댓글 작성자</label> &nbsp;:&ensp;&ensp;${session}
		</p>
		<p>
			<textarea rows="5" cols="50" name="content"></textarea>
		</p>
		<p> 
			<input type="hidden" name="userID" value="${session}">
			<input type="hidden" name="pcode" value="${m.pcode}">
			<input type="submit" value="댓글 작성">
		</p>
	</form>
	

	
</div>
		<!-- 댓글기능 끝-->
	</section>
</body>
<c:import url="/include/footer.jsp" /> 