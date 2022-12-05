<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@page import="food.dto.FoodDto"%>
<%@page import="food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	FoodDto dto = FoodDao.getInstance().getData(num);
	
	FoodDao.getInstance().addViewCount(num);
	
	String id = (String)session.getAttribute("id");
	UsersDto dto2 = UsersDao.getInstance().getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	#list{
		padding-left: 0px;
	}
	#profileImage{
		width: 30px;
		height: 30px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#main{
		text-align:start; 
		border-top:2px solid #111; 
		border-bottom:2px solid #111;"
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-info">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/images/text111.png" alt="" width="200" height="50" class="d-inline-block align-text-top">
			</a>
			<div class="container mt-3">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
					</li>
					<li class="breadcrumb-item active"> <strong><%=dto.getTitle() %></strong></li>
				</ol>
			</div>
		</div>
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
						<%if(dto2.getProfile()==null){ %>
							<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							     <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							     <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
               			<%}else{ %>
							<img id="profileImage" 
							src="${pageContext.request.contextPath }<%=dto2.getProfile()%>">
               			<%} %>
					</li>
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link pt-0 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							  <strong><%=id %></strong>
							</a>
							
							<ul class="dropdown-menu">
							  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/private/info.jsp">회원정보</a></li>
							  <li><a class="dropdown-item" href="#">임시</a></li>
							  <li><a class="dropdown-item" href="#">임시</a></li>
							  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a></li>
							</ul>
						</div>
					</li>
				<%} %>
		</ul>
	</nav>
	
	<div class="container mt-2">
		<div class="container row">
			<div class="col-4">
				<%if(dto.getImage() == null){ %>
					<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" fill="currentColor" class="card-img-top" viewBox="0 0 16 16">
					  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
					  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
					</svg>
	   			<%}else{ %>
					<img id="thumbnailImage" width="200" height="200" class="card-img-top rounded" src="${pageContext.request.contextPath }<%=dto.getImage()%>">
	   			<%} %>
			</div>
			<div class="col-8">
				<div><strong><%=dto.getDivfood() %></strong></div>
				<div>
					<h4><strong><%=dto.getTitle() %></strong></h4>
				</div>
				
				<div>
					<div style="float:left;">작성자 <%=dto.getWriter() %> | &nbsp;</div>
					<div style="float:left;">작성일 <%=dto.getRegdate() %> | &nbsp;</div>
					<div> 조회수 <%=dto.getViewCount() %></div>
				</div>
				
				<div>
					<div style="float:left;">좋아요 <%=dto.getLikeCount() %> | &nbsp;</div>
					<div>싫어요 <%=dto.getDislikeCount() %></div>
				</div>
			</div>
		</div>
		
		<div id="main" class="mt-2 mb-2">
			<div>
				<%=dto.getContent() %>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="container btn-group justify-content-between" id="list">
			<div class="btn-group" role="group" aria-label="Basic outlined example">
				<a type="button" class="btn btn-outline-primary" href="${pageContext.request.contextPath }/index.jsp">목록으로</a>
			</div>
		    
			<%-- 만일 글 작성자가 로그인 된 아이디와 같다면 수정, 삭제 링크를 제공한다. --%>
			<div class="btn-group" role="group" aria-label="Basic outlined example">
				<%if(dto.getWriter().equals(id)){ %>
					<a type="button" class="btn btn-outline-primary" href="private/updateform.jsp?num=<%=dto.getNum() %>">수정</a>
					<a type="button" class="btn btn-outline-primary" href="javascript:" onclick="deleteConfirm()">삭제</a>
				<%}else{ %>
			        <a type="button" class="btn btn-outline-primary" href="private/like.jsp?num=<%=dto.getNum() %>">좋아요</a>
					<a type="button" class="btn btn-outline-primary" href="private/dislike.jsp?num=<%=dto.getNum() %>">싫어요</a>
				<%} %>
			</div>
		</div>
	</div>
	<script>
			function deleteConfirm(){
				const isDelete = confirm("이 글을 삭제하시겠습니까?");
				if(isDelete){
					location.href = "private/delete.jsp?num=<%=dto.getNum() %>";
				}
			}
		</script>
</body>
</html>