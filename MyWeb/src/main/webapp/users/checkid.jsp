<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//inputid 라는 파라미터명으로 전달되는 문자열 읽어고기
	String inputId = request.getParameter("inputId");
	// dto 의 null 여부 확인
	UsersDto dto = UsersDao.getInstance().getData(inputId);
%>    
<%-- 만일 null이면 이미 존재하지 않는 아이디(회원가입이 가능한 아이디) --%>
<%if(dto == null){ %>
	{"isExist" : false}
<%}else{ %><%-- null 이 아니면 존재하는 아이디(회원가입이 불가능한 아이디) --%>
	{"isExist" : true}
<%} %>