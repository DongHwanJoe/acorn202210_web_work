<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB에서 불러온 회원목록이라고 가정
	List<MemberDto> list = new ArrayList<>();
	list.add(new MemberDto(1, "김구라", "노량진"));
	list.add(new MemberDto(2, "해골", "행신동"));
	list.add(new MemberDto(3, "원숭이", "상도동"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 입니다.</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>회원목록 입니다.</h1>
		<table class = "table">
			<thead>
				<tr class = "table-dark">
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			
			<tbody>
				<%for(MemberDto tmp:list){ %>
					<tr class = "table-info">
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getName() %></td>
						<td><%=tmp.getAddr() %></td>
					</tr>
				<%}%>
			</tbody>
		</table>
	</div>
</body>
</html>