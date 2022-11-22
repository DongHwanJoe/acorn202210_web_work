<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 회원의 정보를 읽어와서
	String id = (String)session.getAttribute("id");
	String email = request.getParameter("email");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	//2. DB에 수정 반영하고
	boolean isSuccess = UsersDao.getInstance().update(dto);
	//3. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("수정했습니다.")
			location.href = "info.jsp";
		<%}else{%>
			alert("수정실패")
			location.href = "updateform.jsp";
		<%} %>
	</script>
</body>
</html>