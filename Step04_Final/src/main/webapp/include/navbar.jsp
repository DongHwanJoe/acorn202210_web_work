<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar.jsp 내용 --%>
<%
	//이 navbar.jsp 페이지가 어디에 include 됐는지 읽어와 보기
	String thisPage = request.getParameter("thisPage"); // "index" | "game" | "study" | "file" | "cafe"
	
	String id = (String)session.getAttribute("id");
	UsersDto dto = UsersDao.getInstance().getData(id);
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
					<%if(id == null){ %>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
						</li>	
					<%}else{ %>
						<li>
							<%if(dto.getProfile()==null){ %>
								<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
								     <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								     <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
								</svg>
	               			<%}else{ %>
								<img id="profileImage" 
								src="${pageContext.request.contextPath }<%=dto.getProfile()%>">
	               			<%} %>
						</li>
						<li class="nav-item">
							<a class="nav-link pt-0" href="${pageContext.request.contextPath }/users/private/info.jsp">
								<strong><%=id %></strong>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link pt-1" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
						</li>
						<li class="nav-item">
							<div class="dropdown">
								<a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								  Dropdown link
								</a>
								
								<ul class="dropdown-menu">
								  <li><a class="dropdown-item" href="#">Action</a></li>
								  <li><a class="dropdown-item" href="#">Another action</a></li>
								  <li><a class="dropdown-item" href="#">Something else here</a></li>
								</ul>
							</div>
						</li>
					<%} %>
			</ul>
		</div>
	</div>
</nav>
