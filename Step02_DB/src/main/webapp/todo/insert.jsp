<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	dto.setRegdate(regdate);
	
	boolean isSuccess = TodoDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<script>
				alert("<%=content %>을(를) 할 일 목록에 추가했습니다.");
				location.href="list.jsp";
			</script>
		<%}else{ %>
			<script>
				alert("목록 추가에 실패했습니다. 날짜형식 또는 내용 길이를 확인해주세요.");
				location.href="insertform.jsp";
			</script>
		<%} %>
	</div>
</body>
</html>