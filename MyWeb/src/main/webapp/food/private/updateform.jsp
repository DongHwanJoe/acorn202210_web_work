<%@page import="food.dto.FoodDto"%>
<%@page import="food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)session.getAttribute("id");
	
	int num = Integer.parseInt(request.getParameter("num"));
	FoodDto dto = FoodDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/private/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	textarea{
		width: 768px;
		height: 300px;
	}
	#imageForm{
	   display: none;
	}
	#thumbnailImage{
	   border: 1px solid #cecece;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>수정 폼</h3>
		
		<a id="thumbnailLink" href="javascript:">
			<%if(dto.getImage() == null){%>
				<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
				  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
				  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
				</svg>
			<%}else{ %>
				<img id="thumbnailImage" src="${pageContext.request.contextPath }<%=dto.getImage()%>">
			<%} %>
		</a>
		
		<form action="update.jsp" method="post">
			<input type="hidden" name="thumbnail" id="thumbnail"
				value="<%=dto.getImage() == null ? "empty" : dto.getImage() %>" />
			
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<div>
				<label for="title">식당이름</label>
				<input type="text" name="title" id="title" value="<%=dto.getTitle() %>" />
			</div>
			
			<div class="mt-2">
				<label class="form-label" for="divfood">분류 선택</label>
		        <select class="dropdown" name="divfood" id="divfood">
		            <option value="<%=dto.getDivfood() %>" selected><%=dto.getDivfood() %></option>
		            <option value="일식">일식</option>
		            <option value="한식">한식</option>
		            <option value="중식">중식</option>
		            <option value="양식">양식</option>
		            <option value="기타">기타</option>
		        </select>
			</div>
			
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content"><%=dto.getContent() %></textarea>
			</div>
			<button class="btn btn-primary" type="submit" onclick="submitContents(this)">수정확인</button>
		</form>
		<a class="btn btn-danger" href="${pageContext.request.contextPath }/food/detail.jsp?num=<%=num %>">취소</a>
		
		<form id="imageForm" action="thumbnail_upload.jsp" method="post" enctype="multipart/form-data">
			썸네일 사진
			<input type="file" id="image" name="image" accept=".jpg, .png, .gif, .jpeg" />
			<button type="submit">업로드</button>
		</form>
	</div>
	
	<script>
		<%if(!writer.equals(dto.getWriter())){ %>
			alert("작성자만 수정할 수 있습니다.")
			location.href = "${pageContext.request.contextPath }/food/detail.jsp?num="+num;
		<%}%>
	</script>
	
	<!-- SmartEditor 에서 필요한 javascript 로딩  -->
	<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
	<script>
		var oEditors = [];
		
		//추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",   
			htParams : {
				bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
				fOnBeforeUnload : function(){
				   //alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
      
		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		}
		
		function showHTML() {
			var sHTML = oEditors.getById["content"].getIR();
			alert(sHTML);
		}
		   
		function submitContents(elClickedObj) {
			//SmartEditor 에 의해 만들어진(작성한글) 내용이 textarea 의 value 가 되도록 한다. 
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
			
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
			
			try {
				//폼 제출하기 
				elClickedObj.form.submit();
			} catch(e) {}
		}
		
		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
	
	<!-- gura_util.js 로딩 -->
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>
		//프로필 이미지 링크를 클릭하면 
		document.querySelector("#thumbnailLink").addEventListener("click", function(){
		   // input type="file" 을 강제 클릭 시킨다. 
		   document.querySelector("#image").click();
		});   
		
	      //프로필 이미지를 선택하면(바뀌면) 실행할 함수 등록
	      document.querySelector("#image").addEventListener("change", function(){
	         //ajax 전송할 폼의 참조값 얻어오기
	         const form=document.querySelector("#imageForm");
	         //gura_util.js 에 있는 함수를 이용해서 ajax 전송하기 
	         ajaxFormPromise(form)
	         .then(function(response){
	            return response.json();
	         })
	         .then(function(data){
	            console.log(data);
	            // input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
	            document.querySelector("input[name=thumbnail]").value=data.imagePath;
	            
	            // img 요소를 문자열로 작성한 다음
	            let img=`<img id="thumbnailImage" 
	               src="${pageContext.request.contextPath }\${data.imagePath}">`;
	            //id가 profileLink 인 요소의 내부(자식요소)에 덮어쓰기 하면서 html 형식으로 해석해 주세요. 라는 의미
	            document.querySelector("#thumbnailLink").innerHTML=img;
	         });
	      });
	</script>
</body>
</html>