<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- /include/navbar.jsp 내용 --%>
<%
	//이 navbar.jsp 페이지가 어디에 include 됐는지 읽어와 보기
	String thisPage = request.getParameter("thisPage"); // "index" | "game" | "study" | "file" | "cafe"
	
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
	request.setAttribute("dto", dto);
%>
<style>
   #profileImage{
      width: 30px;
      height: 30px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
</style>
<nav class="navbar navbar-expand-md navbar-dark bg-info">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
			<img src="https://acornedu.co.kr/images/n_logo.png" alt="" width="200" height="50" class="d-inline-block align-text-top">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 화면이 좁으면 숨겨지는 요소들은 아래의 div 안에 넣어두면 된다. -->
		<div class="collapse navbar-collapse justify-content-between" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link <%= thisPage.equals("file") ? "active" : "" %>" href="${pageContext.request.contextPath }/file/list.jsp">파일 목록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%= thisPage.equals("cafe") ? "active" : "" %>" href="${pageContext.request.contextPath }/cafe/list.jsp">글 목록</a>
				</li>
			</ul>
			<ul class="navbar-nav">
				<c:choose>
					<c:when test="${empty id }">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<c:choose>
								<c:when test="${empty dto.profile }">
									<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
									     <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
									     <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
									</svg>
								</c:when>
								<c:otherwise>
									<img id="profileImage" 
									src="${pageContext.request.contextPath }${dto.profile }">
								</c:otherwise>
							</c:choose>
						</li>
						<li class="nav-item">
							<div class="dropdown">
								<a class="nav-link pt-0 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								  <strong>${id }</strong>
								</a>
								
								<ul class="dropdown-menu">
								  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/private/info.jsp">회원정보</a></li>
								  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/private/study.jsp">공부하러 가기</a></li>
								  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/private/game.jsp">게임하러 가기</a></li>
								  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a></li>
								</ul>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
