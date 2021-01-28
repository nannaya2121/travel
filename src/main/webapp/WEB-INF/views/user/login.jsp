<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>로그인</title>
</head>
<body>
		
		<h1>로그인</h1>
		
		<c:if test="${user == null}">
			<form action="/user/loginProcess" method="post">
					
					<span>이메일</span>
					<input type="email" name="email" placeholder="이메일을 입력하세요">
					
					<span>비밀번호</span>
					<input type="password" name="password" placeholder="비밀번호를 입력하세요">
					
					<button type="submit">로그인</button>
					<a href="/">돌아가기</a>
					
			</form>
		</c:if>
		
		<c:if test="${warn == false}">
			<p style="color: red;">아이디나 비밀번호를 다시 확인해주세요 </p>
		</c:if>
		
		<c:if test="${user != null}">
			<span>${user.email} 님 환영합니다.</span>
		</c:if>
		
		<a href="/">홈으로</a>
</body>
</html>
