<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" 
	  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" 
	  integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" 
	  crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/mine.css">
</head>
<body class="backImage">


		<%-- 상단 네비바 --%>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark d-flex">
		
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
		


		
		

		<%-- 로그인 폼 --%>
		<div class="container col-sm-2 loginWhoreBackgroundColor">
			<p>&emsp;</p>
			<h2 class="text-center text-light">Travel Login</h2>
			<p class="topLoginBottomLine">&emsp;</p>
			
			<form action="/user/loginProcess" method="post">
				
				<div class="form-group">
					<label class="text-light" for="email"><b>아이디</b></label>
					<input type="text" class="form-control" name="email" placeholder="아이디를 입력하세요">
				</div>
				
				<div class="form-group">
					<label class="text-light" for="password"><b>비밀번호</b></label>
					<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요" >
				</div>
				
				<div class="form-group form-check">
					<label class="form-check-label text-light">
						<input class="form-check-input" type="checkbox" name="remember"> 아이디 기억하기
					</label>
				</div>
				
				<c:if test="${warn == false}">
					<p style="color: red;">아이디나 비밀번호를 다시 확인해주세요 </p>
				</c:if>
				
				<button type="submit" class="btn btn-info loginBtn">로그인</button>
				<a class="btn btn-secondary loginBtn" href="/">홈으로</a>
			</form>
		</div>
		
		
		


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
