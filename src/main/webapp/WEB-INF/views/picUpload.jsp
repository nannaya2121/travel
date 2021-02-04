<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Picture Upload</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" 
	  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" 
	  integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" 
	  crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/mine.css">
</head>
<body>
	
	
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
		
		
		<form action="picUploadProcess" method="post">
		
			<label>여행장소</label>
			<input class="col-5" type="text" name="title" placeholder="여행장소를 입력해주세요">
			
			
			<br>
			
			<label>사진등록</label>
			<img style="width: 300px; height: 300px;" id="picUpload">
			<input type="file" name="pic_content" multiple="multiple" onchange="preview(this, $('#picUpload'));">
			<br>
			
			<div>내용등록</div>
			<textarea rows="10" cols="111" name="text_content" placeholder="내용을 입력해주세요"></textarea>
			
			<br>
			
			<input class="btn btn-info" type="submit" value="등록하기">
			<a class="btn btn-dark" type="button" href="/">돌아가기</a>
		
		</form>
		
		
-----------------------------------------------------------------------------------<br>
<br>
-----------------------------------------------------------------------------------<br>
	여행장소<br>
	등록시간<br>
	유저<br>
	좋아요<br>
	사진<br>
	내용<br>
	등록하기<br>
	돌아가기<br>
	
	추후(지도서비스)
	
	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
	 	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
	 	crossorigin="anonymous"></script>
	 	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" 
		crossorigin="anonymous"></script>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" 
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" 
		crossorigin="anonymous"></script>
		
		
		
	 <script>
	        
	 function preview(input, target) {
		    if(input.files && input.files[0]){
		      var fileName= input.files[0].name;
		      var ext=fileName.substr(fileName.length-3, fileName.length);
		      var isCheck=false; 
		          if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
		          isCheck=true;               
		      }
		      if(isCheck==false){
		          alert("이미지 파일 아님");
		          jQuery(input).val("");
		          return;
		      }
		      var reader = new FileReader();
		      reader.readAsDataURL(input.files[0]);          
		      reader.onload = function(e) {
		        jQuery(target).attr('src', e.target.result);
		      }
		    }
		}


	 
	</script>
	
		
</body>
</html>
