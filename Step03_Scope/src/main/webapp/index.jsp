<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath }/fortune">오늘의 운세</a></li>
			<li><a href="${pageContext.request.contextPath }/member">회원 한 명의 정보 보기</a></li>
			<li><a href="${pageContext.request.contextPath }/friend/list">친구 목록 보기</a></li>
			<li><a href="test/play.jsp">놀러가기</a></li>
		</ul>
	</div>
	<form action="${pageContext.request.contextPath }/test/save.jsp" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..." />
		<button type="submit">닉네임 기억 시키기</button>
	</form>
	<br />
	<form action="${pageContext.request.contextPath }/test/save" method="post">
		<input type="text" name="nick" placeholder="닉네임 입력..." />
		<button type="submit">닉네임 기억 시키기</button>
	</form>
	
</body>
</html>