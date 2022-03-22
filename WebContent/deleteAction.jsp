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
		String userPassword = request.getParameter("userPassword");
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		try {
			ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
			if(!test.SelectUserLogin(userID, userPassword).equals(userPassword)) {
				throw new NullPointerException();
			}
			long result = test.deleteUser(userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원탈퇴가 성공적으로 이루어졌습니다.')");
			session.invalidate();
			script.println("location.href = 'login.jsp' ");
			script.println("</script>");
			
		} catch (Exception e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>