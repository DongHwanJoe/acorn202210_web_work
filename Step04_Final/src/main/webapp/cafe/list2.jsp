<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = (String)session.getAttribute("id");

	final int PAGE_ROW_COUNT = 5;
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
	int totalRow = CafeDao.getInstance().getCount();
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount;
	}
	
	CafeDto dto = new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	List<CafeDto> list = CafeDao.getInstance().getList(dto);
	
	//JSTL + EL 을 테스트하기 위해서 필요한 값을 request 영역에 담기
	//list라는 키값으로 request scope에 담기
	request.setAttribute("list", list);
	//페이징 처리에 필요한 값을 request scope에 담기
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("totalPageCount", totalPageCount);
	//아래의 jsp 페이지에서 java code를 모두 EL과 JSTL을 활용한 코드로 바꾸기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list2.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="cafe" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<div class="row mt-1">
			<div class="col-lg-6 col-sm-12 text-lg-start text-center">
				<h3>카페 글 목록 입니다.</h3>
			</div>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<a class="btn btn-primary text-lg-end text-center" href="${pageContext.request.contextPath }/cafe/private/insertform.jsp">새 글 작성</a>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr class="table-dark">
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr class="table-secondary">
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>
							<a href="detail.jsp?num=${tmp.num }">${tmp.title }</a>
						</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-center">
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="list2.jsp?pageNum=${startPageNum - 1 }">Prev</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum == i ? 'active':'' }">
						<a class="page-link" href="list2.jsp?pageNum=${i }">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list2.jsp?pageNum=${endPageNum + 1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>