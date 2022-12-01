<%@page import="food.dao.FoodDao"%>
<%@page import="food.dto.FoodDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String)session.getAttribute("id");
	
	FoodDto dto = new FoodDto();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setWriter(writer);
	
	//DB에 저장하기
	boolean isSuccess = FoodDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/private/insert.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				새 가게를 등록했습니다.
				<a href="${pageContext.request.contextPath }/food/list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
				등록에 실패했습니다.
				<a href="insertform.jsp">다시 작성하기</a>
			</p>
		<%} %>
	</div>
</body>
</html>