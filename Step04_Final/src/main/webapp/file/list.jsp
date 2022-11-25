<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	
	//한 페이지에 몇개씩 표기할 것인지
	final int PAGE_ROW_COUNT = 5;
	//하단 페이지를 몇개씩 표기할 것인지
	final int PAGE_DISPLAY_COUNT = 5;
	
	//보여줄 페이지의 번호의 초기값을 1로 지정
	int pageNum = 1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와본다.
	String strPageNum = request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어오면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 저장
		pageNum = Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	//전체 글의 개수
	int totalRow = FileDao.getInstance().getCount();
	//전체 페이지의 개수 구하기
	int totalPageCount = (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 개수보다 크게 계산됐다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum = totalPageCount; // 보정해준다.
	}
	
	//FileDto 객페를 생성해서
	FileDto dto = new FileDto();
	//위에서 계산된 startRowNum, endRowNum을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//파일 목록을 select 해온다.
	List<FileDto> list = FileDao.getInstance().getList(dto);
	
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<style>
	.icon-link{
		font-size: 24px;
	}
	
	.icon-link svg{
		width: 30px;
      	height: 30px;
		/* transform을 적용할 때 0.4초 동안 변화 되도록 적용*/
		transition: transform 0.4s ease-out;
	}
	
	.icon-link svg:hover{
		/* 원본 크기의 1.2배로 확대*/
		transform: scale(1.2);
	}
</style>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="file" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<div class="row mt-1">
			<div class="col-lg-6 col-sm-12 text-lg-start text-center">
				<h3>파일 목록 보기</h3>
			</div>
			<div class="col-lg-6 col-sm-12 text-lg-end text-center">
				<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp" class="icon-link">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
					  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
					  <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
					</svg>
					<span class="visually-hidden">파일 추가</span>
				</a>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
				<tr class="table-dark">
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th class="text-center">파일삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(FileDto tmp:list){ %>
					<tr class="table-secondary">
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td><%=tmp.getTitle() %></td>
						<td>
							<a href="download.jsp?num=<%=tmp.getNum() %>">
								<%=tmp.getOrgFileName() %>
							</a>
						</td>
						<td><%=tmp.getFileSize() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td class="text-center">
							<%if(tmp.getWriter().equals(id)){ %>
								<a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
										<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
										<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
									</svg>
									<span class="visually-hidden">항목삭제</span>
								</a>
							<%} %>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-center">
				<%-- 
					startPageNum이 1이 아닌 경우에만 Prev 링크를 제공한다,
				 --%>
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
				
				<%--
					마지막 페이지 번호가 전체 페이지의 개수보다 작으면 Next 링크를 제공한다.
				 --%>
				<%if(endPageNum < totalPageCount){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
					</li>
				<%} %>
			</ul>
		</nav>
	</div>
	<script>
		function deleteConfirm(num){
			let isDelete = confirm("정말 삭제하시겠습니까?");
			if(isDelete){
				location.href="${pageContext.request.contextPath }/file/private/delete.jsp?num="+num;
			}
		}
   </script>
   
   <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>