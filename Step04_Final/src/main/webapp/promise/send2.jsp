<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//msg 라는 파라미터 명으로 전달되는 문자열을 읽어온다.
	String msg = request.getParameter("msg");
	//콘솔창에 출력하기
	System.out.println(msg);
	//응답
%>    
{"isSuccess":true}