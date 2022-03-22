<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page import = "ldg.mybatis.model.Vw_order" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
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
<t:subMenuBar />
	<h2 style = "text-align : center">내정보</h2>
	<%
		ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
		int point = test.Point(userID);
	%>
	<div class = "container">
		<div class = "col-4"></div> 
			 <div class = "jumbotron"  style= "padding-top : 1px;">
				<br/><h3 style = "text-align : center">아이디 : <%= session.getAttribute("userID")  %></h3>
				  <h3 style = "text-align : center">적립된 포인트 : <%= point  %></h3>  
					<h3 style = "text-align : center">개인정보 변경하기</h3><br/>
					<div class = "form-group">
						<p  style="text-align : center"><a href="idUpdate.jsp" style="margin-right:15px">아이디 변경</a>
						<a href="pwUpdate.jsp" style="margin-left:15px">비밀번호 변경</a></p>
					</div>
					</div>
					<h3 style = "text-align : center">내가 주문한 상품들</h3><br/>
					<table class = "table table-bordered" style = "text-align : center; border : 1px solid #dddddd">
						<thead>
							<tr>
								<th style = "background-color : #eeeeee; text-align : center;">주문 번호</th>
								<th style = "background-color : #eeeeee; text-align : center;">상품 이름</th>
								<th style = "background-color : #eeeeee; text-align : center;">상품 가격</th>
								<th style = "background-color : #eeeeee; text-align : center;">주문 날짜</th>
							</tr>
						</thead>
						<tbody>
							<%
								
								List<Vw_order> list = new ArrayList<>();
								list = test.myBuyList(userID);
								for(int i = 0; i < list.size(); i++) {
							%>
								<tr>
									<td><%= list.get(i).getOrderID() %></td>
									<td><%= list.get(i).getItemName() %></td>
									<td><%= list.get(i).getItemPrice() %></td>
									<td><%= list.get(i).getOrderDate() %></td>
								</tr>
							<%
								}
							%>
					</tbody>
				</table>
		<div class = "col-4"></div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>