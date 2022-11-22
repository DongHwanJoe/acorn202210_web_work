<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/game.jsp</title>
</head>
<body>
	<h1>게임 페이지 입니다.</h1>
	<p><%=id %> 님 열심히 게임해요!!</p>
	<a href="${pageContext.request.contextPath }/index.jsp">인덱스로 가기</a>
</body>
</html>