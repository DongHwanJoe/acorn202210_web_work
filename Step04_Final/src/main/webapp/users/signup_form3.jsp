<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form3.jsp</title>
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
		<form v-on:submit="onSubmit" action="signup.jsp" method="post" id="signupForm">
			<p>폼의 유효성 여부: <strong>{{isFormValid}}</strong></p>
			<div class="mb-2">
				<label class="control-label" for="id">아이디</label>
				<input 
					v-on:input="inputId" 
				 	v-model="id"
				 	v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}"
					class="form-control" type="text" name="id" id="id"/>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
			</div>
			
			<div class="mb-2">
				<label class="control-label" for="pwd">비밀번호</label>
				<input 
					v-on:input="inputPwd"
					v-model="pwd"
					v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}"
					class="form-control" type="password" name="pwd" id="pwd"/>
				<div class="invalid-feedback">비밀번호를 확인하세요</div>
			</div>
			<div class="mb-2">
				<label class="control-label" for="pwd2">비밀번호 확인</label>
				<input 
					v-on:input="inputPwd"
					v-model="pwd2"
					class="form-control" type="password" name="pwd2" id="pwd2"/>
			</div>
			
			<div class="mb-2">
				<label class="control-label" for="email">이메일</label>
				<input 
					v-on:input="inputEmail"
					v-model="email"
					v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}"
					class="form-control" type="text" name="email" id="email"/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>
			<button v-bind:disabled="!isFormValid" class="btn btn-primary" type="submit">가입</button>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script>
		new Vue({
			el:"#signupForm",
			data:{
				isIdValid:false,
				isPwdValid:false,
				isEmailValid:false,
				id:"",
				isIdDirty:false,
				email:"",
				isEmailDirty:false,
				pwd:"",
				pwd2:"",
				isPwdDirty:false
			},
			computed:{
				isFormValid(){
					let result = this.isIdValid && this.isPwdValid && this.isEmailValid;
					//함수에서 리턴해주는 값을 모델처럼 사용하면 된다.
					return result;
				}
			},
			methods:{
				onSubmit(e){
					//const isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
					if(!this.isFormValid){
						e.preventDefault();	
					}
				},
				
				inputId:function(){
					//아이디를 한번이라도 입력하면 error메시지를 띄운다
					this.isIdDirty = true;
					
					const reg = /^[a-z].{4,9}$/;
					const isMatch = reg.test(this.id);
					if(!isMatch){	
						this.isIdValid = false;
						return;
					}
					
					//Vue 객체의 참조값을 self에 담기
					const self = this;
					
					//서버에 전송하고 응답 받기
					fetch("checkid.jsp?inputId="+this.id)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						console.log(data);
						if(data.isExist){	
							self.isIdValid = false;
						}else{
							self.isIdValid = true;
						}
					});
				},
				
				inputPwd(){
					this.isPwdDirty = true;
					
					const reg = /[\W]/;
					
					if(!reg.test(this.pwd)){
						this.isPwdValid = false;
						return;
					}
					
					if(this.pwd != this.pwd2){
						this.isPwdValid = false;
					}else{
						this.isPwdValid = true;
					}
				},
				
				inputEmail(){
					this.isEmailDirty = true;
					
					const reg = /^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$/;
					if(!reg.test(this.email)){
						this.isEmailValid = false;
					}else{
						this.isEmailValid = true;
					}
				}
			}
		});
	</script>
</body>
</html>