<%@page import="java.util.List"%>
<%@page import="food.dto.FoodDto"%>
<%@page import="food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	final int PAGE_ROW_COUNT = 8;
	final int PAGE_DISPLAY_COUNT = 5;
	
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
	List<FoodDto> list = FoodDao.getInstance().getJapanese(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/japanese.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="일식" name="thisPage"/>
	</jsp:include>

	<div class="container">
		<div class="row mt-1">
			<div class="col-lg-6 col-sm-12 text-lg-start text-center">
				<h3>일식</h3>
			</div>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<a class="btn btn-primary text-lg-end text-center" href="${pageContext.request.contextPath }/food/private/insertform.jsp">새 글 작성</a>
			</div>
		</div>
		
		<div class="row row-cols-1 row-cols-md-4 g-4">
			<%for(FoodDto tmp:list){ %>
				<div class="col">
					<div class="card" style="width: 18rem;">
						<%if(tmp.getImage()==null){ %>
							<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" fill="currentColor" class="card-img-top" viewBox="0 0 16 16">
							  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
							  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
							</svg>
	          			<%}else{ %>
							<img id="thumbnailImage" width="200" height="200" class="card-img-top rounded" alt="thumbnail"
							src="${pageContext.request.contextPath }<%=tmp.getImage()%>">
	           			<%} %>
						
						<div class="card-body">
							<p class="card-text"><%=tmp.getDivfood() %></p>
							<h4 class="card-title"><strong><%=tmp.getTitle() %></strong></h5>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<p style="float: left;" class="mb-0">작성자</p>
								<p style="float: right;" class="mb-0">
									<strong><%=tmp.getWriter() %></strong>
								</p>
							</li>
		   					<li class="list-group-item">좋아요 <%=tmp.getLikeCount() %> &nbsp;&nbsp;&nbsp;싫어요 <%=tmp.getDislikeCount() %></li>
						</ul>
						<div class="card-body">
							<a href="detail.jsp?num=<%=tmp.getNum() %>" class="btn btn-primary" style="float: right;">상세보기</a>
						</div>
						<div class="card-footer text-muted">
						  	<p style="float: left;" class="mb-0">작성일</p>
							<p style="float: right;" class="mb-0">
								<strong><%=tmp.getRegdate() %></strong>
							</p>				
						</div>
					</div>
				</div>
			<%} %>
		</div>
		
		<nav>
			<ul class="pagination justify-content-center mt-3">
				<%if(startPageNum != 1){ %>
					<li class="page-item">
						<a class="page-link" href="japanese.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
					</li>
				<%} %>
				
				<%for(int i = startPageNum; i <= endPageNum; i++){ %>
					<li class="page-item <%=pageNum == i ? "active" : "" %>">
						<a class="page-link" href="japanese.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
				
				<%if(endPageNum < totalPageCount){ %>
					<li class="page-item">
						<a class="page-link" href="japanese.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
					</li>
				<%} %>
			</ul>
		</nav>
	</div>
</body>
</html>