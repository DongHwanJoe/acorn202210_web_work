<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fortune.jsp</title>
</head>
<body>
<%
	
	String[] fortunes = {"동쪽으로 가면 귀인을 만나요",
			"짬뽕국물 튀어요",
			"커피 쏟아요",
			"강화 성공해요",
			"넘어져요",
			"길에서 돈주워요"};
	
	Random ran = new Random();
	int ranNum = ran.nextInt(fortunes.length);
%>
	<p>오늘의 운세: <%=fortunes[ranNum] %></p>
	<p>오늘의 운세: <%out.print(fortunes[ranNum]); %></p>
</body>
</html>