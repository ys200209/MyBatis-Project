<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "java.io.PrintWriter" %>
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
				String itemName = request.getParameter("itemName");
				String itemPrice = request.getParameter("itemPrice");
				String itemContent = request.getParameter("itemContent");
				if(itemName == null || itemPrice == null || itemContent == null ) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('제대로 입력을 해주세요.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
					Long result = test.insertItems(itemName, itemPrice, itemContent);
					if(result <= 0) { 
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('상품추가에 실패하였습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('상품을 성공적으로 추가하였습니다.')");
						script.println("location.href = 'shoping.jsp' ");
						script.println("</script>");
					}
				}				
			}
	%>
</body>
</html>