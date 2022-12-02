<%@page import="food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	String id = (String)session.getAttribute("id");
	String writer = FoodDao.getInstance().getData(num).getWriter();
	
	if(!writer.equals(id)){ 
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "작성자만 삭제할 수 있습니다.");
		return;
	}
	
	FoodDao.getInstance().delete(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/food/list.jsp");
%>