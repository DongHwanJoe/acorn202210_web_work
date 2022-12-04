<%@page import="food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	String id = (String)session.getAttribute("id");
	
	FoodDao.getInstance().addDislikeCount(num);
	FoodDao.getInstance().decViewCount(num);
	
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/food/detail.jsp?num="+num);
%>