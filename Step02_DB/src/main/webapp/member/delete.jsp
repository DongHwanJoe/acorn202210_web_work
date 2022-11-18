<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 회원 한 명의 정보를 삭제하기 ( 몇번 회원을 삭제할까 )
	
	//get 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다.
	int num = Integer.parseInt(request.getParameter("num"));
	//MemberDao 객체를 이용해서 삭제하고 성공여부를 리턴 받는다.	
	boolean isSuccess = MemberDao.getInstance().delete(num);
	
	//2. 응답하기 ( 무슨응답을 하면 적절할까? )
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				<%=num %>번 회원정보를 삭제했습니다.
				<br />
				<a href="${pageContext.request.contextPath }/member/list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				회원정보 삭제에 실패했습니다.
				<br />
				<a href="${pageContext.request.contextPath }/member/list.jsp">확인</a>
			</p>
		<%} %>
	</div>
</body>
</html>