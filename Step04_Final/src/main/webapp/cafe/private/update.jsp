<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	CafeDto dto = new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
</head>
<body>
	<script>
	 
		<%if(isSuccess){ %>
			alert("수정했습니다.")
			location.href = "${pageContext.request.contextPath }/cafe/detail.jsp?num="+<%=num %>;
		<%}else{%>
			alert("수정실패")
			location.href = "updateform.jsp?num="+<%=num %>;
		<%} %>
	</script>
</body>
</html>