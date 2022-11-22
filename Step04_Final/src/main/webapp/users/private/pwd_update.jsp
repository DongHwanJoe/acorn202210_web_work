<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");	
	
	String pwd = request.getParameter("pwd");
	String newPwd = request.getParameter("newPwd");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	
	UsersDao dao = UsersDao.getInstance();
	
	boolean isSuccess = dao.updatePwd(dto);
	
	if(isSuccess){
		session.removeAttribute("id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("비밀번호를 수정했습니다. 다시 로그인 해주세요");
			location.href="${pageContext.request.contextPath }/users/loginform.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패!");
			location.href="pwd_updateform.jsp";
		</script>
	<%} %>
</body>
</html>