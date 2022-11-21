<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String pwd = request.getParameter("pwd");
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
	dto.setPwd(pwd);
	boolean isSuccess = UsersDao.getInstance().pwdUpdate(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("비밀번호를 수정했습니다.");
			location.href="info.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="pwd_updateform.jsp";
		</script>
	<%} %>
</body>
</html>