<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 내용을 추출해서
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//CafeDto에 담고
	CafeDto dto = new CafeDto();
	dto.setTitle(title);
	dto.setContent(content);
	
	//글 작성자는 로그인 된 아이디(세션영역에 저장된 id)
	String writer = (String)session.getAttribute("id");
	dto.setWriter(writer);
	
	//DB에 저장하기
	boolean isSuccess = CafeDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				새 글을 저장했습니다.
				<a href="${pageContext.request.contextPath }/cafe/list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				글 저장에 실패했습니다.
				<a href="insertform.jsp">다시 작성하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>