<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/play.jsp</title>
</head>
<body>
	<%
		/*
			HttpSession 객체에 "nick" 이라는 키 값으로 저장된 값이 있는지 읽어와 본다. 없으면 null이 리턴된다.
			(session scope에 "nick"이라는 키 값으로 저장된 문자열이 있는지 읽어와 본다.)
		*/
		String nick = (String)session.getAttribute("nick");
		
		//60초 동안 다시 요청을 하지 않으면 자동으로 삭제
		session.setMaxInactiveInterval(60);
	%>
	<h3>노는 페이지 입니다.</h3>
	<%if(nick == null || nick.equals("")){ %>
		<p>session 영역(scope)에 "nick"이라는 키 값으로 저장된 값이 없습니다.</p>
	<%}else{ %>
		<p>
			<strong><%=nick %></strong> 님 놀러 오셨네요? 신나게 놀다 가세요!
			<a href="logout.jsp">세션에 저장된 nick 삭제(로그아웃)</a>
		</p>
	<%} %>
</body>
</html>