<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 회원 한 명의 정보를 삭제하기 ( 몇번 회원을 삭제할까 )
	
	//get 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다.
	int num = Integer.parseInt(request.getParameter("num"));
	//MemberDao 객체를 이용해서 삭제하고 성공여부를 리턴 받는다.	
	MemberDao.getInstance().delete(num);
	
	//2. 응답하기 ( 무슨응답을 하면 적절할까? )
	
	/*
		요청을 한 클라이언트의 웹브라우저엑 새로운 경로로 요청을 다시하라고 강요하는 응답을 HttpServletResponse 객체를
		이용해서 할 수 있다.(리다일렉트 응답)
		리다일렉트 응답은 "새로운 경로로 요청을 다시 하라고 강요" 하는 응답이다.
		절대 경로로 사용하는 것이 좋다.
		이것 자체가 응답이기 때문에 아래의 html 형식의 문자열은 의미가 없다.(삭제해도 무관)
	*/
	
	//java code 영역에서 context path는 HttpServletRequest 객체의 메소드를 이용해서 얻어내야 한다.
	String cPath = request.getContextPath();
	
	response.sendRedirect(cPath+"/member/list.jsp");
%>
