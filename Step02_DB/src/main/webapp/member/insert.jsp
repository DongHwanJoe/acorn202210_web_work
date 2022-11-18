<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1. 폼 전송되는 회원의 이름과 주소를 읽어온다.
		2. MemberDao에 MemberDto를 전달하면 DB에 저장 후 작업의 성공여부를 리턴하는 insert() 메소드를 만든다.
		   회원 번호는 시퀀스를 이용해서 들어가도록 한다.
		3. 위에서 추출한 회원의 이름과 주소를 MemberDto 객체에 담는다.
		4. MemberDao 객체를 이용해서 MemberDto 객체에 담긴 회원 정보를 DB에 저장한다.
		5. 작업의 성공 여부를 클라이언트에게 응답한다.
	*/
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	boolean isSuccess = false;
	
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	MemberDao dao = MemberDao.getInstance();
	
	isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-5">
		<%if(isSuccess){ %>
			<p class="alert alert-success">
				<strong><%=name %></strong>의 회원정보를 추가했습니다.
				<br />
				<a class="alert-link" href="${pageContext.request.contextPath }/member/list.jsp">회원정보로 돌아가기</a>
				<br />
				<a class="alert-link" href="${pageContext.request.contextPath }/member/insertform.jsp">다른 회원정보 추가</a>
			</p>
		<%}else{ %>
			<p class="alert alert-danger">
				회원정보 추가에 실패했습니다.
				<br />
				<a class="alert-link" href="${pageContext.request.contextPath }/member/list.jsp">회원정보로 돌아가기</a>
				<br />
				<a class="alert-link" href="${pageContext.request.contextPath }/member/insertform.jsp">다른 회원정보 추가</a>
			</p>
		<%} %>
	</div>
</body>
</html>