<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" 
          prefix="c" %>   

<c:import url="/include/header.jsp" /> 
<style type="text/css">
table, tr{
  text-align:center;
  margin: auto;
}
table{
  width:300px; 
  height:150px;
}
#td1{
  width: 100px;
}
.td2{
  text-align:left;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	jQuery.ajaxSetup({cache:false});
	$(document).ready(function(){
		var path = "${pageContext.request.contextPath}"
		$("#idBtn").click(function(){
			var query={
				id : $('#id').val(),
				pwd: $('#pwd').val()
			}
			if(f1.id.value == ""){
				alert("아이디 입력은 필수입니다.");
				f1.id.focus();
				return false;
			}
			if(f1.pwd.value == ""){
				alert("암호 입력은 필수입니다.");
				f1.id.focus();
				return false;
			}
			$.ajax({
				type: 'get',
				url : path + "/login_formOk.do",
				data: query,
				success: function(data){
					if(data == 1){
						alert("로그인 성공");
						location.href="${path}/index.jsp";
						
					}else{
						alert("로그인 실패");
						$('#id').val('');
						$('#pwd').val('');
						$('#id').focus();
					}
				}
			})
		})
	}); 

</script>
<body>
<section>
<br><br>
<div align="center"><font size=5> <b>로그인</b> </font></div> <br>
<div>
<form name="f1">
<table border=1>
 <tr><td>아이디</td>
 	 <td class=td2>
     	&nbsp;<input type="text" name="id" id="id" size=20 >
     </td>
 </tr>
 <tr><td>암호</td>
     <td class=td2>
       &nbsp;<input type="password" name="pwd" id="pwd" size=20 >
     </td></tr>
 <tr>
  <td colspan=2 align="center">
    <input type="button" id="idBtn" value="로그인" >
  </td>
  </tr>
 </table>
</form>
</div>
<br>
</section>
</body>
<c:import url="/include/footer.jsp" /> 
