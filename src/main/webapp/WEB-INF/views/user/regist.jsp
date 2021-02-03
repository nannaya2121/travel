<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" 
	  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" 
	  integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" 
	  crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/mine.css">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>

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

		<%-- 회원가입 폼 --%>
		<div style="margin-top: 5%;" class="container col-sm-3">
		
			<h2 class="text-left text-dark">회원가입</h2>
			
			<form style="margin-top: 10%;" action="/user/registProcess" method="post">
					
					<div class="form-group">
					
						<span><b>아이디</b></span>
						<input class="form-control" type="text" id="email" name="email" placeholder="아이디 입력하세요">
						
						<button style="margin-top: 1%;" class="btn btn-outline-danger" type="button" id="idDuplicate">아이디 중복체크</button>
						<input type="hidden" id="idChecker">
						<span id="msg"></span>
						
					</div>
					
					
					
					<div style="margin-top: 5%;" class="form-group">
					
						<span><b>비밀번호</b></span>
						<input class="form-control" type="password" id="password" name="password"  placeholder="비밀번호를 입력하세요">
						
					</div>
					
					
					
					<div style="margin-top: 5%;" class="form-group">
					
						<span><b>비밀번호 확인</b></span>
						<input class="form-control" type="password" id="repassword" name="repassword" placeholder="비밀번호를 다시 입력하세요">
						
						<button style="margin-top: 1%;" class="btn btn-outline-danger" type="button" id="passCheck">비밀번호 중복체크</button>
						<input type="hidden" id="passChecker">
						<span id="passMsg"></span>
						
					</div>
					
					
					
					<div style="margin-top: 15%;" class="text-center">
					
						<button class="btn btn-primary" type="submit" id="registBtn">가입하기</button>
						<a class="btn btn-dark" href="/">돌아가기</a>
						
					</div>
					
			</form>
			
		</div>

<%-- 아이디 중복체크 --%>
<script> 

	var ccc = $('#idChecker').val();
	
		$("#idDuplicate").click(function(){
	
			var query = {email : $("#email").val()};
			
		 $.ajax({
				  url : "/user/idDuplicate",
				  type : "post",
				  
				  <%-- data에 {email : $("#email").val()},이렇게 써도 됨. --%>
				  data : query,
				  success : function(data) {
	  				
					  if($("#email").val()==''){
						  alert("아이디를 입력해주세요");
					  }else if(data == 1) {
					    $("#msg").text("사용 불가능한 아이디입니다.");
					    $("#msg").attr("style", "color:red");
					    $("#idDuplicate").attr("class", "btn btn-outline-danger");
					    $("#email").focus();
					   } else {
					    $("#msg").text("사용 가능한 아이디입니다.");
					    $("#msg").attr("style", "color:blue");
					    $("#idDuplicate").attr("class", "btn btn-outline-primary");
					    ccc = 1;
					    $("#idChecker").val(ccc);
					   }
	  				}
	 			});  // ajax 끝
			});
</script>

<%-- 비밀번호 중복체크 --%>
<script>

	var ppp = $('#passChecker').val();
	
	$("#passCheck").click(function(){
	
		
		var prePass = document.getElementById('password').value;
		var postPass = document.getElementById('repassword').value;
		
		if(prePass == ''){
			alert("비밀번호를 입력해주세요");
		}else if(postPass == ''){
			alert("비밀번호를 한 번 더 입력해주세요");
		}else if(prePass == postPass){
			$("#passMsg").text("비밀번호가 일치합니다.");
		    $("#passMsg").attr("style", "color:blue");
		    $("#passCheck").attr("class", "btn btn-outline-primary");
		    ppp = 1;
		    $("#passChecker").val(ppp);
		}else{
			$("#passMsg").text("비밀번호가 일치하지 않습니다.");
		    $("#passMsg").attr("style", "color:red");
		    $("#passCheck").attr("class", "btn btn-outline-danger");
		}
		
	});
	
</script>

<%-- 입력창에 빈 칸이 있을 시 경고 --%>
<script>

	$("#registBtn").click(function(){
		
		if($("#email").val() == ''){
			alert("이메일을 입력해주세요");
			return false;
		}
		
		if($("#password").val() == ''){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		if($("#repassword").val() == ''){
			alert("한번 더 비밀번호를 입력해주세요");
			return false;
		}
		
		if($("#idChecker").val() != 1){
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		
		if($("#passChecker").val() != 1){
			alert("비밀번호 중복체크를 해주세요");
			return false;
		}
		
	});

</script>
	

	 	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" 
		crossorigin="anonymous"></script>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" 
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" 
		crossorigin="anonymous"></script>
</body>
</html>
