<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	TodoDto dto = new TodoDto(num, content, regdate);
	
	boolean isSuccess = TodoDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("<%=num %>번 목록의 정보를 수정했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="updateform.jsp?num=<%=num %>";
		</script>
	<%} %>
</body>
</html>