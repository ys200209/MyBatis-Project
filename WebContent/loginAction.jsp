<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "java.io.PrintWriter" %>
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
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			if (userID != null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 로그인 중입니다.')");
				script.println("location.href = 'main.jsp' ");
				script.println("</script>");
			}
			ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
			userID = request.getParameter("userID");
			String userPassword = request.getParameter("userPassword");
			try {
				String result = test.SelectUserLogin(userID, userPassword);
				System.out.println("result = " + result);
				System.out.println("userPassword = " + userPassword);
				if(result.equals(userPassword)) { 
					session.setAttribute("userID", userID);
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
				else {
					throw new NullPointerException();
				}
			} catch( NullPointerException e) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			
	%>
</body>
</html>