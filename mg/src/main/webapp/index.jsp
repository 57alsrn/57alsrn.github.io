<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" 
          prefix="c" %>   



<c:import url="/include/header.jsp" /> 

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>쇼핑몰</title>

</head>

<body>
<section>
<br><br>
<b>
<h2>&emsp;MG Shop에 오신것을 환영합니다.</h2>
</b>
<p><br>
<c:if test="${session == null}">
<p>&emsp;중고거래는 쉽고 편리하게 MS Shop에서! </p>
<p>&emsp;처음 오신 고객님께서는 회원가입 후 로그인하여 주시기 바랍니다.<br></p>
</c:if>

<c:if test="${session != null}">
&emsp;안녕하세요? 쉽고 편리한 중고거래! MS Shop입니다. <br>
&emsp;허위매물 및 불건전한 내용을 게시하실 경우, 경고없이 삭제될 수 있으며 <br>
&emsp;이용에 제한을 받으실 수 있음을 알려드립니다.<br>
&emsp;그럼 즐거운 쇼핑 하시기를 바랍니다.<br>
</c:if>
</p>


</section>
</body>
</html>
<c:import url="/include/footer.jsp" /> 