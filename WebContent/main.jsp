<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"  initial-scale = "1"> <!-- 어느 디바이스에서나 적용되는 부트스트랩 반응형 웹 메타 태그 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 홈쇼핑 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
<t:mainMenuBar userID="${userID}" />

<br/><h2 style = "text-align : center">데이터베이스 홈쇼핑 사이트</h2><br/>
<%
	if(userID == null) {
%>
	<h3 style = "text-align : center">어서오세요 <a href="login.jsp">로그인</a>후 서비스를 이용하실 수 있습니다.</h3><br/>
		
<% } else { %>
	<% if(userID.equals("root")) { %>
		<h3 style = "text-align : center">관리자 계정입니다.</h3><br/>
	<%	} else { %>
	<h3 style = "text-align : center">회원 계정으로 로그인하였습니다.</h3><br/>
	<%	} %>
<%
	}
%>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>