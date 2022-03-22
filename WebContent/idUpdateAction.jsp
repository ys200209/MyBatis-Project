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
	    userID = request.getParameter("userID");
	    String userUpdateID = request.getParameter("userUpdateID");
	    String userPassword = request.getParameter("userPassword");
	    
		if(userID == null || userUpdateID == null || userPassword == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			try {
				ShopingSessionRepositoryTest test = new ShopingSessionRepositoryTest();
				if(!test.SelectUserLogin(userID, userPassword).equals(userPassword)) { // 회원정보 변경전 본인확인용 로그인시도
					System.out.println("NullPointerException() 생성");
					throw new NullPointerException(); // 계정정보가 올바르지않다면 예외 발생
				}
				
				test.updateUserID(userID, userUpdateID); // 아이디변경 메서드 실행
				session.setAttribute("userID", request.getParameter("userUpdateID"));
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보가 성공적으로 변경되었습니다.')");
				script.println("location.href = 'userInfo.jsp' ");
				script.println("</script>");
				
			} catch(Exception e) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 이미 존재하거나 \\n입력하신 회원정보가 올바르지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
	%>
</body>
</html>