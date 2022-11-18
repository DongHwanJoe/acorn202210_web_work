<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	TodoDto dto = TodoDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
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
					<a href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
				</li>
				<li class="breadcrumb-item active">항목 수정 페이지</li>
			</ol>
		</nav>
		<h1>할 일 목록 수정하기</h1>
		<form action="update.jsp" method="post">
			<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
			<div class="row mb-1">
				<label for="num" class="col-sm-2 col-form-label">번호</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="num" value="<%=dto.getNum() %>" disabled />
				</div>
			</div>
			<div class="row mb-1">
				<label for="content" class="col-sm-2 col-form-label">할 일</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="content" id="content" value="<%=dto.getContent() %>" />
				</div>
			</div>
			<div class="row mb-1">
				<label for="regdate" class="col-sm-2 col-form-label">날짜</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" />
				</div>	
			</div>
			<button type="submit" class="btn btn-primary">수정확인</button>
			<button type="reset" class="btn btn-danger">취소</button>
		</form>
		<a href="list.jsp">돌아가기</a>
	</div>
</body>
</html>