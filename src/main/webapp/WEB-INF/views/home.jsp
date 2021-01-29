<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" 
	  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" 
	  integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" 
	  crossorigin="anonymous">
</head>
<body>
	
	
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top d-flex">
		
				<a class="navbar-brand" href="/">Travel</a>
			  
			<ul class="navbar-nav ml-auto">
			
				<c:if test="${user == null}">
			
					<li class="nav-item">
						<a class="nav-link" href="/user/regist">회원가입</a>
					</li>
					
					<li class="nav-item">
						<a class="nav-link" href="/user/login">로그인</a>
					</li>
				
				</c:if>
				
				<c:if test="${user != null}">
					<li class="p-2 ml-auto">
							<span class="" style="color: white">${user.email} 님 환영합니다.</span>
					</li>
					
					<li class="nav-item">
						<a class="nav-link btn btn-outline-info" href="/user/logOut">로그아웃</a>
					</li>
				</c:if>
				
			</ul>
		
		</nav>
		
	
	
	
	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
	 	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
	 	crossorigin="anonymous"></script>
	 	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" 
		crossorigin="anonymous"></script>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" 
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" 
		crossorigin="anonymous"></script>	
</body>
</html>
