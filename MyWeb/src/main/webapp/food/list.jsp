<%@page import="java.util.List"%>
<%@page import="food.dto.FoodDto"%>
<%@page import="food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	final int PAGE_ROW_COUNT = 5;
	final int PAGE_DISPLAY_COUNT = 4;
	
	int pageNum = 1;
	
	String strPageNum = request.getParameter("pageNum");
	if(strPageNum != null){
		pageNum = Integer.parseInt(strPageNum);
	}
	
	int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	int startPageNum = 1 +((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	int totalRow = FoodDao.getInstance().getCount();
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount;
	}
	
	FoodDto dto = new FoodDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	List<FoodDto> list = FoodDao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
   #thumbnailImage{
      width: 100px;
      height: 100px;
      border: 1px solid #cecece;
      border-radius: 50%;
   }
</style>
</head>
<body>
	<div class="container">
		<div class="row mt-1">
			<div class="col-lg-6 col-sm-12 text-lg-start text-center">
				<a href="${pageContext.request.contextPath }/index.jsp">인덱스로</a>
				<h3>글 목록 입니다.</h3>
			</div>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<a class="btn btn-primary text-lg-end text-center" href="${pageContext.request.contextPath }/food/private/insertform.jsp">새 글 작성</a>
			</div>
		</div>
		
		<div class="row">
			<%for(FoodDto tmp:list){ %>
				<div class="card col-md-6 col-lg-3">
					<%if(tmp.getImage()==null){ %>
						<svg id="thumbnailImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						     <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						     <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
          			<%}else{ %>
						<img id="thumbnailImage" class="card-img-top" alt="thumbnail"
						src="${pageContext.request.contextPath }<%=tmp.getImage()%>">
           			<%} %>
					
					<div class="card-body">
						<h5 class="card-title"><%=tmp.getTitle() %></h5>
						<p class="card-text"><%=tmp.getDivfood() %></p>
						<p class="card-text"><%=tmp.getLikeCount() %></p>
						<p class="card-text"><%=tmp.getDislikeCount() %></p>
						<a href="detail.jsp?num=<%=tmp.getNum() %>" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			<%} %>
		</div>
		
		<nav>
			<ul class="pagination justify-content-center">
				<%if(startPageNum != 1){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
					</li>
				<%} %>
				
				<%for(int i = startPageNum; i <= endPageNum; i++){ %>
					<li class="page-item <%=pageNum == i ? "active" : "" %>">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
				
				<%if(endPageNum < totalPageCount){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
					</li>
				<%} %>
			</ul>
		</nav>
	</div>
</body>
</html>