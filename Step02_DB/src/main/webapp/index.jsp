<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%-- /include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://cdn.pixabay.com/photo/2017/12/17/19/08/bridge-3024773__340.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://cdn.pixabay.com/photo/2017/11/12/13/37/forest-2942477__340.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="https://cdn.pixabay.com/photo/2015/03/03/05/56/avenue-656969_960_720.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	
	<%-- /include/footer.jsp 페이지를 포함 시켜서 이부분은 footer.jsp 페이지가 응답하도록 한다. --%>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>