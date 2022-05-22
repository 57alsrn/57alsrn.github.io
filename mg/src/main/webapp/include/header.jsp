<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="session" />

<!DOCTYPE html>
<html>
<meta name = viewport charset="UTF-8" content="width=device-width">
<style>
section{
 /* background-color:#CCCCCC; */
 min-height:400px;
}
</style>

 
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="UTF-8">

<title>MG쇼핑몰</title>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">

  <a class="navbar-brand" href="${path}/index.jsp">MG Shop</a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">

    <span class="navbar-toggler-icon"></span>

  </button>



  <div class="collapse navbar-collapse" id="navbarsExample03">

    <ul class="navbar-nav mr-auto">

      <li class="nav-item active">

        <a class="nav-link" href="${path}/index.jsp">Home <span class="sr-only">(current)</span></a>

      </li>


		
      <li class="nav-item">

		<c:if test="${session == null}">
        <a class="nav-link" href="${path}/member_form.do">sign up</a>
		</c:if>
      </li>

		<c:if
			test="${session == 'admin'}">
	  <li class="nav-item">

        <a class="nav-link" href="${path}/member_list.do">MemberList</a>
		</c:if> 
      </li>
      <c:if test="${session == null}">
      <li class="nav-item">

        <a class="nav-link" href="${path}/login/login_form.jsp">Log in</a>

      </li>
      </c:if> 
      
      
  
  
  	  <c:if test="${session != null}">
      <li class="nav-item">

        <a class="nav-link" href="${path}/pd_form.do">상품 등록 </a>

      </li>
      </c:if>
      
      <c:if test="${session != null}">
      <li class="nav-item">

        <a class="nav-link" href="${path}/pd_list.do">상품목록 </a>

      </li>
      </c:if>

      <c:if test="${session != null}">
      <li class="nav-item">

        <a class="nav-link" href="${path}/logout.do">Log out </a>

      </li>
      
      </c:if>


	
    </ul>

	<br>
	<br>
	<c:if test="${session !=null }">
	<p style = "color:white;"> ${session}님 안녕하세요</p>
   	</c:if>
  </div>

</nav>



</head>



<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


	<header>
		
		
	</header>
</body>