<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<nav class="mt-2">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
				</li>
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
				</li>
				<li class="breadcrumb-item active">회원 추가 페이지</li>
			</ol>
		</nav>
		<h1>회원 추가 폼 입니다.</h1>
		<form action="${pageContext.request.contextPath }/member/insert.jsp" method="post">
			<div class="mb-3">
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" />
			</div>
			<div class="mb-3">
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" />
			</div>
			<button class="btn btn-primary" type="submit">추가</button>
		</form>
		<a href="${pageContext.request.contextPath }/member/list.jsp">돌아가기</a>
	</div>
</body>
</html>