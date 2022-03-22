<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "ldg.mybatis.model.Items" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
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
		int itemID = 0;
		if(request.getParameter("itemID") != null) {
			itemID = Integer.parseInt(request.getParameter("itemID"));
		}
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
		List<Items> list = new ArrayList<Items>();
		list = test.itemView(itemID);
	%>
<t:subMenuBar />
	<div class = "container">
		<div class = "row">
			<table class = "table table-striped" style = "text-align : center; border : 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan = "3" style = "background-color : #eeeeee; text-align : center;">상품 세부정보</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style ="width:20%">상품 번호</td>
						<td colspan="2"><%= list.get(0).getItemID() %></td>
					</tr>
					<tr>
						<td>상품 이름</td>
						<td colspan="2"><%= list.get(0).getItemName() %></td>
					</tr>
					<tr>
						<td>상품 가격</td>
						<td colspan="2"><%= list.get(0).getItemPrice() %></td>
					</tr>
					<tr>
						<td>상품 설명</td>
						<td colspan="2" style = "min-height:200px; text-align:left"><%= list.get(0).getItemContent() %></td>
					</tr>
				</tbody>
			</table>
			<a href = "shoping.jsp" class="btn btn-primary">목록</a>
			
			<%
				if(userID != null && userID.equals("root")) {
			%>
					<a href = "update.jsp?itemID=<%=list.get(0).getItemID()%>" class = "btn btn-primary">수정</a>
					<a href = "deleteItemAction.jsp?itemID=<%=list.get(0).getItemID()%>" class = "btn btn-primary">삭제</a>
			<%
				}
			%>  
			
			<a href = "buyAction.jsp?itemID=<%=list.get(0).getItemID()%>" class = "btn btn-primary pull-right">구매하기</a>
		</div>
	</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>