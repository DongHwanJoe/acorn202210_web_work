<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> list = (List<String>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/WEB-INF/views/friend/list.jsp</title>
</head>
<body>
	<h3>친구 목록 입니다.</h3>
	<ul>
		<%for(String tmp:list){ %>
			<li><%=tmp %></li>
		<%} %>
	</ul>
</body>
</html>