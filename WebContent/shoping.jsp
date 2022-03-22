<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "ldg.mybatis.model.Items" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width"  initial-scale = "1"> <!-- 어느 디바이스에서나 적용되는 부트스트랩 반응형 웹 메타 태그 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>JSP 홈쇼핑 웹 사이트</title>
<style type="text/css">
		a, a:hover{
			color : #000000;
			text-decoration : none;
		}
</style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
<t:subMenuBar />
	<div class = "container">
		<div class = "row">
		<form autocomplete="off">
		<p style = "text-align:right"><b>검색하기</b> : <input type="text" name="searchItem" placeholder="상품명">
		<input type="submit" value="검색"></p>
		</form>
			<table class = "table table-striped" style = "text-align : center; border : 1px solid #dddddd">
				<thead>
					<tr>
						<th style = "background-color : #eeeeee; text-align : center;">상품 번호</th>
						<th style = "background-color : #eeeeee; text-align : center;">상품 이름</th>
						<th style = "background-color : #eeeeee; text-align : center;">상품 가격</th>
						<th style = "background-color : #eeeeee; text-align : center;">구매 선택</th>
					</tr>
				</thead>
				<tbody>
				
				<%
					List<Items> list = new ArrayList<Items>();
					ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
					String searchItem = request.getParameter("searchItem");
					list = test.shopingList(searchItem);
				
					for(int i = 0; i < list.size(); i++) {
						%>
					<tr>
						<td><%= list.get(i).getItemID() %></td>
						<td><%= list.get(i).getItemName() %></td>
						<td><%= list.get(i).getItemPrice() %></td>
						<td><a href = "itemview.jsp?itemID=<%= list.get(i).getItemID() %>" class = "btn btn-primary">구매하기</a></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<%
			if(userID.equals("root")) {
			%>
			<a href = "itemupdate.jsp" class = "btn btn-primary pull-right">상품 추가</a>
			<%
			}
			%>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>