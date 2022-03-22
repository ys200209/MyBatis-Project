<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
<%@ page import = "user.User" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.util.Calendar" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 홈쇼핑 웹 사이트</title>
</head>
<body>

	<%
			String userID = request.getParameter("userID");
			String userPassword = request.getParameter("userPassword");
			String userName = request.getParameter("userName");
			String userGender = request.getParameter("userGender");
			String userEmail = request.getParameter("userEmail");
			
			
			if(userID == null || userPassword == null || userName == null || userEmail == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				if(userPassword.length() < 4) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('비밀번호 길이가 적당하지 않습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
					long result1 = test.InsertUser(userID, userPassword, userName, userGender, userEmail);
					int result2 = test.insertPoint(userID);
					if(result1 > 0 && result2 > 0) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('회원가입이 성공적으로 이루어졌습니다.')");
						script.println("location.href = 'login.jsp' ");
						script.println("</script>");
					} else {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('회원가입에 실패하였습니다. 아이디가 이미 존재하거나 \\n기재하지 않은 곳이 있는지 확인해주십시오.')");
							script.println("history.back()");
							script.println("</script>");
					}
				}
			}
			
	%>
</body>
</html>