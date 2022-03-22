<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "ldg.mybatis.repository.session.ShopingSessionRepositoryTest" %>
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
		String userPassword = request.getParameter("userPassword");
		String userUpdatePassword = request.getParameter("userUpdatePassword");
		String userPasswordCheck = request.getParameter("userPasswordCheck");
		
		if(userPassword == null || userUpdatePassword == null || userPasswordCheck == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			if(request.getParameter("userUpdatePassword").length() < 4) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호 길이가 적당하지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				try {
					ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
					if(!test.SelectUserLogin(userID, userPassword).equals(userPassword)){
						throw new NullPointerException();
					}
					
					test.updateUserPassword(userID, userUpdatePassword, userPasswordCheck);
					
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원정보가 성공적으로 변경되었습니다.')");
					script.println("location.href = 'userInfo.jsp' ");
					script.println("</script>");
					
				} catch(Exception e) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력한 정보가 일치하지 않습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>