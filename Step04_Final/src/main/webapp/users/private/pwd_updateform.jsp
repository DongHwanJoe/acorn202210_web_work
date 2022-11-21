<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>비밀번호 수정 폼 입니다.</h1>
		<form action="pwd_update.jsp" method="post">
			<div class="mb-2">
				<label class="form-label" for="pwd">변경 비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
			</div>
			<button class="btn btn-primary" type="submit">수정확인</button>
		</form>
		<a class="btn btn-danger" href="info.jsp">취소</a>
	</div>
</body>
</html>