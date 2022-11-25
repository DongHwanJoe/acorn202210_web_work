<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	//FileDto 객페를 생성해서
	FileDto dto = new FileDto();
	//위에서 계산된 startRowNum, endRowNum을 담아서
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
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath }/index.jsp">인덱스로 가기</a>
		<br />
		<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">업로드 하기</a>
		<h3>자료실 목록 보기</h3>
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
								<a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a>
							<%} %>
						</td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<script>
   
		function deleteConfirm(num){
			let isDelete = confirm("정말 삭제하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
		}
   </script>
</body>
</html>