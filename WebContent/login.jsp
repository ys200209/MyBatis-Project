<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%-- <t:subMenuBar userID="${userID}" />--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"  initial-scale = "1"> <!-- 어느 디바이스에서나 적용되는 부트스트랩 반응형 웹 메타 태그 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 홈쇼핑 웹 사이트</title>
</head>
<body>
<t:mainMenuBar userID="${userID}" />
	<div class = "container">
		<div class = "col-lg-4"></div> 
		<div class = "col-lg-4">
			 <div class = "jumbotron"  style= "padding-top : 20px;">
				<form method = "post" action = "loginAction.jsp" autocomplete="off">
					<h3 style = "text-align : center">로그인 화면</h3>
					<div class = "form-group">
						<input type = "text" class = " form-control" placeholder="아이디" name = "userID" maxlength = "20">
					</div>
					<div class = "form-group">
						<input type = "password" class = " form-control" placeholder="비밀번호" name = "userPassword" maxlength = "20">
					</div>
					<input type = "submit" class = "btn btn-primary form-control" value = "로그인">
				</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>