<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form2.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark bg-info">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="https://acornedu.co.kr/images/n_logo.png" alt="" width="200" height="50" class="d-inline-block align-text-center">
			</a>
			<div class="container mt-3">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
					</li>
					<li class="breadcrumb-item active">회원가입</li>
				</ol>
			</div>
		</div>
	</nav>
	<div class="d-flex justify-content-center container">
		<h3>회원 가입 폼 입니다.</h3>
	</div>
	<div class="d-flex justify-content-center container col-4">
		<form action="signup.jsp" method="post" id="signupForm">
			<div id="checkId">
				<label class="control-label" for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id"/>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
			</div>
			
			<div id="checkPw">
				<label class="control-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
				<div class="invalid-feedback">비밀번호를 확인하세요</div>
			</div>
			<div id="checkPw2">
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd2" id="pwd2"/>
			</div>
			
			<div id="checkEmail">
				<label class="control-label" for="email">이메일</label>
				<input class="form-control" type="text" name="email" id="email" v-on:input="input4" v-model="email"/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>
			<button class="btn btn-outline-primary" type="submit">가입</button>
		</form>
	</div>
	<script>
		let app4 = new Vue({
			el : "#checkEmail",
			data : {
				isIdValid:false,
				isPwdValid:false,
				isEmailValid:false,
				email:"",
				emailReg:/@/,
				arrEmail:['form-control']
			},
			method : {
				input4(){
					this.arrEmail.splice(1, 1);
					if(!emailReg.test(email)){
						this.arrEmail.push("is-invalid");
						this.isEmailValid=false;
					}else{
						this.arrEmail.push("is-valid");
						this.isEmailValid=true;
					}
				}
			}
		});
	</script>
	<script>
		let isIdValid = false;
		let isPwdValid = false;
		let isEmailValid = false;
		
		
		function checkPwd(){
			//일단 2개의 클래스를 모두 제거 한다음
			$("#pwd").removeClass("is-valid is-invalid");
			
			//1. 입력한 아이디를 읽어와서
			const pwd = $("#pwd").val();
			const pwd2 = $("#pwd2").val();
			
			//만일 비밀번호 입력란과 확인란이 다르다면
			if(pwd != pwd2){
				$("#pwd").addClass("is-invalid");
				isPwdValid = false;
			}else{//같다면
				$("#pwd").addClass("is-valid");
				isPwdValid = true;
			}
		}
		
		//#pwd와 #pwd2를 모두 선택해서 이벤트리스너 함수 등록
		$("#pwd, #pwd2").on("input", function(){
			checkPwd();
		});
		
		//id를 입력할 때마다 호출되는 함수 등록
		$("#id").on("input", function(){
			const self = this;
			     
			$(self).removeClass("is-valid is-invalid");

			//1. 입력한 아이디를 읽어와서
			const inputId = $(self).val();
			
			//2. 서버에 페이지 전환없이 전송을 하고 응답을 받는다.
			
			$.ajax({
				url:"checkid.jsp?inputId="+inputId,
				success:function(data){
					console.log(data);
					if(data.isExist){
						$(self).addClass("is-invalid");	
						isIdValid = false;
					}else{
						$(self).addClass("is-valid");
						isIdValid = true;
					}	
				}
			});
		});
		
		//폼에 submit 이벤트가 일어났을 때 실행할 함수 등록
		$("#signupForm").on("submit", function(){
			
			//아래의 코드는 아이디. 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행되도록 해야한다.
			//폼 전체의 유효성 여부
			const isFormValid = isIdValid && isPwdValid && isEmailValid;
			//폼이 유효하지 않으면
			if(!isFormValid){
				return false; //폼 전송 막기	
			}
		});
	</script>
</body>
</html>