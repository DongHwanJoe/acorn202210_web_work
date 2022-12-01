<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		
		<div class="row">
			<div class="card col-md-6 col-lg-3">
				<img src="https://img.freepik.com/premium-vector/flat-icon-with-file-exchange-flat-digital-vector-illustration-cloud-storage-icon-data-storage_100456-7438.jpg?w=740" class="card-img-top" alt="파일목록">
				
				<div class="card-body">
					<h5 class="card-title">파일 목록</h5>
					<p class="card-text">파일 업로드 및 다운로드를 할 수 있는 공간이에요</p>
					<a href="${pageContext.request.contextPath }/file/list.jsp" class="btn btn-primary">파일목록 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-6 col-lg-3">
				<img src="https://img.freepik.com/free-photo/hand-holding-megaphone-marketing-announcement-campaign_53876-129003.jpg?w=740&t=st=1669606544~exp=1669607144~hmac=4549f72f824842ebfb870d2918a1e4b1e2832a60b59f3718ce2bef5a7fd2a9a7" class="card-img-top " alt="글 목록">
				
				<div class="card-body">
					<h5 class="card-title">글 목록</h5>
					<p class="card-text">글을 작성하여 사람들과 커뮤니케이션을 할 수 있는 공간이에요</p>
					<a href="${pageContext.request.contextPath }/cafe/list.jsp" class="btn btn-primary">글 목록 보러가기</a>
				</div>
			</div>
			
			<div class="card col-md-6 col-lg-3">
				<img src="https://www.ystreet.co.kr/forUser/img/628dbe6878991.png" class="card-img-top" alt="게임하기">
				
				<div class="card-body">
					<h5 class="card-title">게임 페이지</h5>
					<%if(id == null){ %>
						<p class="card-text">
							회원전용 공간이에요. 이용하려면 로그인 해주세요 
						</p>
						<a href="${pageContext.request.contextPath }/users/loginform.jsp" class="btn btn-primary">로그인 하러가기</a>
					<%}else{ %>
						<p class="card-text">게임 페이지에요</p>
						<a href="${pageContext.request.contextPath }/private/game.jsp" class="btn btn-primary">게임하러가기</a>
					<%} %>
				</div>
			</div>
			
			<div class="card col-md-6 col-lg-3">
				<img src="https://img.freepik.com/free-vector/exams-concept-illustration_114360-2754.jpg?w=740&t=st=1669606441~exp=1669607041~hmac=f97593ff93f7ac0776aea2634ff6e1aed0d6c4a74b80336a149d9211d9af81c4" class="card-img-top" alt="공부하기">
				
				<div class="card-body">
					<h5 class="card-title">공부 페이지</h5>
					<%if(id == null){ %>
						<p class="card-text">
							회원전용 공간이에요. 이용하려면 로그인 해주세요 
						</p>
						<a href="${pageContext.request.contextPath }/users/loginform.jsp" class="btn btn-primary">로그인 하러가기</a>
					<%}else{ %>
						<p class="card-text">공부 페이지에요</p>
						<a href="${pageContext.request.contextPath }/private/study.jsp" class="btn btn-primary">공부하러가기</a>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>