<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	TodoDao.getInstance().delete(num);
	
	String cPath = request.getContextPath();
	
	response.sendRedirect(cPath+"/todo/list.jsp");
%>
