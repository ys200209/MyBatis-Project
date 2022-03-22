<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "ldg.mybatis.model.User" %>
<%@ page import = "ldg.mybatis.model.Vw_order" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"  initial-scale = "1"> <!-- 어느 디바이스에서나 적용되는 부트스트랩 반응형 웹 메타 태그 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 홈쇼핑 웹 사이트</title>
</head>
<body>
<t:subMenuBar />
	<h2 style = "text-align : center">회원 정보들</h2>
	<%
		ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
		List<User> userList = new ArrayList<>();
		List<Object> sum = new ArrayList<>();
		userList = test.selectUserList(); // 회원의 개인정보를 가져오는 리스트
		sum = test.sumOrderPrice(userList); // 회원의 구매총액을 가져오는 리스트
		String max = test.maxSumPrice(); // 가장 많이 구매한 유저의 아이디를 가져오는 메서드
	%>
	<div class = "container">
		<div class = "col-4"></div> 
			 <div class = "jumbotron"  style= "padding-top : 20px;">

			<% if(max != null) { %>
				<br/><h3 style = "text-align : center">가장 많이 구매한 유저</h3>
					<h3 style = "text-align : center">아이디 : <%= max %> </h3><br/>
			<% } else { %>
				<br/><h3 style = "text-align : center">어떠한 회원도 상품을 구매하지 않았습니다.</h3>
			<% } %>
					</div>
					<table class = "table table-bordered" style = "text-align : center; border : 1px solid #dddddd">
						<thead>
							<tr>
								<th style = "background-color : #eeeeee; text-align : center;">회원 아이디</th>
								<th style = "background-color : #eeeeee; text-align : center;">회원 이름</th>
								<th style = "background-color : #eeeeee; text-align : center;">회원 성별</th>
								<th style = "background-color : #eeeeee; text-align : center;">회원 이메일</th>
								<th style = "background-color : #eeeeee; text-align : center;">가입 날짜</th>
								<th style = "background-color : #eeeeee; text-align : center;">구매 총액</th>
							</tr>
						</thead>
						<tbody>
							<%
								for(int i = 0; i < userList.size(); i++) {
							%>
								<tr>
									<td><%= userList.get(i).getUserID() %></td>
									<td><%= userList.get(i).getUserName() %></td>
									<td><%= userList.get(i).getUserGender() %></td>
									<td><%= userList.get(i).getUserEmail() %></td>
									<td><%= userList.get(i).getUserJoin() %></td>
									<td><%= sum.get(i) %></td>
								</tr>
							<%	} %>
					</tbody>
				</table>
		<div class = "col-4"></div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>