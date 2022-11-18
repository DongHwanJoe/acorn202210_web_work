<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<nav class="mt-2">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
				</li>
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
				</li>
				<li class="breadcrumb-item active">항목 추가 페이지</li>
			</ol>
		</nav>
		<h1>항목 추가하기</h1>
		<form action="insert.jsp" method="post">
			<div class="row mb-1">
				<label for="content" class="col-sm-2 col-form-label">할 일</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="content" id="content" placeholder="20자까지 입력가능"/>
				</div>
			</div>
			<div class="row mb-1">
				<label for="regdate" class="col-sm-2 col-form-label">날짜</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="regdate" id="regdate" placeholder="yy-mm-dd 형식입력"/>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">추가</button>
		</form>
		<a href="list.jsp">돌아가기</a>
	</div>
</body>
</html>