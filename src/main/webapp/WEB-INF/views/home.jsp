<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>

	<c:if test="${user != null}">
		<span>${user.email} 님 환영합니다.</span>
	</c:if>
	<br>
	
	<a href="/user/regist">회원가입</a>
	<a href="/user/login">로그인</a>
	<br>
	
	<p>깃 테스트</p>
	
	
	
	
</body>
</html>
