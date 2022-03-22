<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page import = "ldg.mybatis.model.Items" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
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
		String userID = (String) session.getAttribute("userID");
		int itemID = 0;
		if(request.getParameter("itemID") != null) {
			itemID = Integer.parseInt(request.getParameter("itemID"));
		}
		ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
		List<Items> items = new ArrayList<>();
		items = test.itemView(itemID);
	%>
<t:subMenuBar />
	<div class = "container">
		<div class = "col-lg-4"></div> 
		<div class = "col-lg-4">
			 <div class = "jumbotron"  style= "padding-top : 20px;">
				<form method = "post" action = "updateAction.jsp?itemID=<%= itemID %>&" autocomplete="off">
					<h3 style = "text-align : center">상품 정보 수정</h3>
					<div class = "form-group">
						<input type = "text" class = " form-control" placeholder="상품 이름" name = "itemName" maxlength = "20" autocomplete="off" value = "<%= items.get(0).getItemName() %>" >
					</div>
					<div class = "form-group">
						<input type = "text" class = " form-control" placeholder="상품 가격" name = "itemPrice" maxlength = "20" autocomplete="off" value = "<%= items.get(0).getItemPrice() %>">
					</div>
					<div class = "form-group">
						<input type = "text" class = " form-control" placeholder = "상품 설명" name = "itemContent" maxlength = "512" style = "height : 150px" autocomplete="off" value = "<%= items.get(0).getItemContent() %>">
					</div>
					<input type = "submit" class = "btn btn-primary form-control" value = "상품 재등록">
				</form>
			</div>
		</div>
		<div class = "col-lg-4"></div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>