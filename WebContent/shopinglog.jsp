<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
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
	<h2 style = "text-align : center">주문 목록</h2><br/>
	<div class = "container">
		<div class = "row">
			<table class = "table table-striped" style = "text-align : center; border : 1px solid #dddddd">
				<thead>
					<tr>
						<th style = "background-color : #eeeeee; text-align : center;">주문 번호</th>
						<th style = "background-color : #eeeeee; text-align : center;">회원 아이디</th>
						<th style = "background-color : #eeeeee; text-align : center;">상품 이름</th>
						<th style = "background-color : #eeeeee; text-align : center;">상품 가격</th>
						<th style = "background-color : #eeeeee; text-align : center;">주문 날짜</th>
					</tr>
				</thead>
				<tbody>
				<%
					ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
					List<Vw_order> list = new ArrayList<>();
					list = test.shopingLog();
					for(int i = 0; i < list.size(); i++) {
				%>
					<tr>
						<td><%= list.get(i).getOrderID() %></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getItemName() %></td>
						<td><%= list.get(i).getItemPrice() %></td>
						<td><%= list.get(i).getOrderDate() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>