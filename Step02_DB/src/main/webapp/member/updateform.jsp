<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	MemberDto dto = MemberDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
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
				<li class="breadcrumb-item active">회원정보 수정 페이지</li>
			</ol>
		</nav>
		<h1>회원정보 수정 폼 입니다.</h1>
		<form action="update.jsp" method="post">
			<!-- 
				disabled 된 input 요소는 폼을 제출했을 때 전송이 안 되기 때문에
				input type="hidden" 요소를 이용해서 회원의 번호가 폼을 제출했을 때 전송되도록 한다.
			 -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
			<div class="mb-2">
				<label class="form-label" for="num">번호</label>
				<input class="form-control" type="text" id="num" value="<%=dto.getNum() %>" disabled/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="name">이름</label>
				<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName() %>"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="addr">주소</label>
				<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr() %>"/>
			</div>
			<button class="btn btn-primary btn-sm" type="submit">수정확인</button>
			<button class="btn btn-danger btn-sm" type="reset">취소</button>
		</form>
		<a href="${pageContext.request.contextPath }/member/list.jsp">돌아가기</a>
	</div>
</body>
</html>