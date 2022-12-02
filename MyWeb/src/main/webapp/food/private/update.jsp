<%@page import="food.dao.FoodDao"%>
<%@page import="food.dto.FoodDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String divfood = request.getParameter("divfood");
	String content = request.getParameter("content");
	String image = request.getParameter("thumbnail");
	
	FoodDto dto = new FoodDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setDivfood(divfood);
	dto.setContent(content);
	
	if(!image.equals("empty")){
		dto.setImage(image);
	}
	
	boolean isSuccess = FoodDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/private/update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){ %>
			alert("수정했습니다.")
			location.href = "${pageContext.request.contextPath }/food/detail.jsp?num="+<%=num %>;
		<%}else{%>
			alert("수정실패")
			location.href = "updateform.jsp?num="+<%=num %>;
		<%} %>
	</script>
</body>
</html>