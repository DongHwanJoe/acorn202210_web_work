<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<nav class="mt-2">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
				</li>
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath }/users/private/info.jsp">회원정보</a>
				</li>
				<li class="breadcrumb-item active">비밀번호 수정</li>
			</ol>
		</nav>
		<h1>비밀번호 수정 폼</h1>
		<form action="pwd_update.jsp" method="post" id="myForm">
			<div class="mb-2">
				<label class="form-label" for="pwd">기존 비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="newPwd">변경 비밀번호</label>
				<input class="form-control" type="password" name="newPwd" id="newPwd"/>
			</div>
			<div class="mb-2">
				<label class="form-label" for="newPwd2">변경 비밀번호</label>
				<input class="form-control" type="password" id="newPwd2"/>
			</div>
			<button class="btn btn-primary" type="submit">수정확인</button>
			<button class="btn btn-info" type="reset">리셋</button>
		</form>
		<a class="btn btn-danger" href="info.jsp">취소</a>
	</div>
	<script>
		document.querySelector("#myForm").addEventListener("submit", function(event){
			let pwd1 = document.querySelector("#newPwd").value;
			let pwd2 = document.querySelector("#newPwd2").value;
			//새 비밀번호와 확인이 일치하지 않으면 폼 전송을 막는다.
			if(pwd1 != pwd2){
				alert("비밀번호를 확인하세요");
				event.preventDefault();//폼 제출 막기
			}
		});
	</script>
</body>
</html>