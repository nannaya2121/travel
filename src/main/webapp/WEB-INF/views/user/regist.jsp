<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
		
		<h1>회원가입</h1>
		
		<form action="/user/registProcess" method="post">
				
				<span>이메일</span>
				<input type="email" id="email" name="email" placeholder="이메일을 입력하세요">
				<button type="button" id="idDuplicate">이메일 중복체크</button>
				<input type="hidden" id="idChecker"><br>
				
				
					<span> 중복여부 </span><span id="msg"></span>
					<br>
				
				<span>비밀번호</span>
				<input type="password" id="password" name="password"  placeholder="비밀번호를 입력하세요">
				<br>
				
				<span>비밀번호 확인</span>
				<input type="password" id="repassword" name="repassword" placeholder="비밀번호를 다시 입력하세요">
				<button type="button" id="passCheck">비밀번호 중복체크</button>
				<input type="hidden" id="passChecker"><br>
				
				<span>확인결과</span>	<span id="passMsg"></span>
				
				
				<br>
				<button type="submit" id="registBtn">가입하기</button>
				<a href="/">돌아가기</a>
				
		</form>

<script> 

var ccc = $('#idChecker').val();

	$("#idDuplicate").click(function(){

		var query = {email : $("#email").val()};
 
	 $.ajax({
			  url : "/user/idDuplicate",
			  type : "post",
			  data : query,
			  success : function(data) {
  
			   if(data == 1) {
				    $("#msg").text("사용 불가능한 이메일입니다.");
				    $("#msg").attr("style", "color:red");
				    $("#email").focus();
				   } else {
				    $("#msg").text("사용 가능한 이메일입니다.");
				    $("#msg").attr("style", "color:blue");
				    ccc = 1;
				    $("#idChecker").val(ccc);
				   }
  				}
 			});  // ajax 끝
		});
</script>

<script>

var ppp = $('#passChecker').val();

$("#passCheck").click(function(){

	
	var prePass = document.getElementById('password').value;
	var postPass = document.getElementById('repassword').value;
	
	if(prePass == postPass){
		$("#passMsg").text("비밀번호가 일치합니다.");
	    $("#passMsg").attr("style", "color:blue");
	    ppp = 1;
	    $("#passChecker").val(ppp);
	}else{
		$("#passMsg").text("비밀번호가 일치하지 않습니다.");
	    $("#passMsg").attr("style", "color:red");
	}
	
});
</script>

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
	

</body>
</html>
