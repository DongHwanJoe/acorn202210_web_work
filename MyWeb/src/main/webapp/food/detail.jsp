<%@page import="food.dto.FoodDto"%>
<%@page import="food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	FoodDto dto = FoodDao.getInstance().getData(num);
	
	FoodDao.getInstance().addViewCount(num);
	
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	#thumbnailImage{
	   width: 150px;
	   height: 150px;
	   border: 1px solid #cecece;
	   border-radius: 50%;
	}
	#list{
		padding-left: 0px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="container row">
			<div class="col-4">
				<%if(dto.getImage() == null){ %>
					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
					  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
					  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
					</svg>
	   			<%}else{ %>
					<img id="thumbnailImage" src="${pageContext.request.contextPath }<%=dto.getImage()%>">
	   			<%} %>
			</div>
			<div class="col-8">
				<div>분류 <strong><%=dto.getDivfood() %></strong></div>
				<div>식당이름 <strong><%=dto.getTitle() %></strong></div>
			</div>
		</div>
		<div class="container row">
			<div>작성자 <%=dto.getWriter() %></div>
			
			<div>조회수 <%=dto.getViewCount() %></div>
			
			<div>좋아요 <%=dto.getLikeCount() %></div>
			
			<div>싫어요 <%=dto.getDislikeCount() %></div>
			
			<div>작성일 <%=dto.getRegdate() %></div>
		</div>
		
		<div><%=dto.getContent() %></div>
	</div>
	
	<div class="container">
		<div class="container btn-group justify-content-between" id="list">
			<div class="btn-group" role="group" aria-label="Basic outlined example">
				<a type="button" class="btn btn-outline-primary" href="list.jsp">목록으로</a>
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