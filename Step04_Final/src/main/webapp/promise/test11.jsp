<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test11.jsp</title>
</head>
<body>
	<input type="text" name="msg" id="msg" placeholder="메시지 입력..." />
	<button id="sendBtn">전송</button>
	<button id="sendBtn2">전송2</button>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>
		/*
			input 요소에 문자열을 입력하고 전송버튼을 누르면 입력한 문자열이 send.jsp페이지로
			전송되록한다.
			단, 페이지 전환 없이
		*/
		
		document.querySelector("#sendBtn2").addEventListener("click", function(){
			/*
				ajaxInputPromise(요청주소, input요소의 참조값)
				- 해당 input 요소에 입력한 문자열이 요청주소로 자동 전송된다.
				- ajaxInputPromise() 함수는 fetch() 함수가 리턴한 Promise이므로
				  fetch() 함수의 사용법과 동일하다.
			*/
			ajaxInputPromise("send2.jsp", document.querySelector("#msg"))
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
			})
		});
		
		document.querySelector("#sendBtn").addEventListener("click", function(){
			//입력한 내용을 읽어온다.
			let msg = document.querySelector("#msg").value;
			//fetch 함수를 호출하면서 GET 방식 파라미터로 send.jsp 페이지를 요청하면서 전달한다.
			fetch("send2.jsp?msg="+msg)
			.then(function(response){
				console.log(response);
				//서버에서 응답된 문자열이 json 형식이면 response.json() 함수를 호출해서 리턴 해준다.
				return response.json();
			})
			.then(function(data){ 
				console.log(data);
				console.log(data.isSuccess);
			});
		});
	</script>
</body>
</html>