<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	String id = (String)session.getAttribute("id");
	String writer = CafeDao.getInstance().getData(num).getWriter();
	
	CafeDao.getInstance().delete(num);
	
	if(!writer.equals(id)){ 
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "작성자만 삭제할 수 있습니다.");
		return;
	}
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/cafe/list.jsp");
%>