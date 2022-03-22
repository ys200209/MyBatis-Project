<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "ldg.mybatis.model.Items" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 홈쇼핑 웹 사이트</title>
</head>
<body>
	<%
			String userID = null;
			int itemID = 0;
			if (session.getAttribute("userID") != null && request.getParameter("itemID") != null) {
				userID = (String) session.getAttribute("userID");
				itemID = Integer.parseInt(request.getParameter("itemID"));
			}
			
			try {
				String itemName = request.getParameter("itemName");
				int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
				String itemContent = request.getParameter("itemContent");
				ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
				if(test.updateItems(itemID, itemName, itemPrice, itemContent) <= 0) {
					throw new NullPointerException();
				}
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'shoping.jsp' ");
				script.println("</script>");
				
			} catch (Exception e) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('상품수정에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
				e.printStackTrace();	
			}
	%>
</body>
</html>