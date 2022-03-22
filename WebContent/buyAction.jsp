<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
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
			
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if (userID == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요')");
				script.println("location.href = 'login.jsp' ");
				script.println("</script>");
			} else {
				try {
					int itemID = Integer.parseInt(request.getParameter("itemID"));
					ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
					test.buyAction(userID, itemID);
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('상품을 구매하였습니다.')");
					script.println("location.href = 'shoping.jsp' ");
					script.println("</script>");
				} catch(Exception e) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('상품구입에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
			}
	%>
</body>
</html>