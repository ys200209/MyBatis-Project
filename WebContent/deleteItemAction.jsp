<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "ldg.mybatis.model.Items" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 홈쇼핑 웹 사이트</title>
</head>
<body>
	<%
			try {
				int itemID = Integer.parseInt(request.getParameter("itemID"));
				String itemContent = request.getParameter("itemContent");
				ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
				if(test.deleteItems(itemID) <= 0) {
					throw new NullPointerException();
				}
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('상품을 성공적으로 삭제하였습니다. ')");
				script.println("location.href = 'shoping.jsp' ");
				script.println("</script>");
				
			} catch (Exception e) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('상품삭제에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
				e.printStackTrace();	
			}
			
	%>
</body>
</html>