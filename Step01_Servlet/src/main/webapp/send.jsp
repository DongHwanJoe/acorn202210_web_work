<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String msg = request.getParameter("msg");
	
	//콘솔창에 출력해보기
	System.out.println("msg:"+msg);
	%>
	<div class="container">
		<p>메시지 전송 결과 페이지</p>
	</div>
</body>
</html>