<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/food/private/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	textarea{
		width: 768px;
		height: 300px;
	}
</style>
</head>
<body>
	<div class="container">
		<h3>새 글 작성 폼입니다.</h3>
		<form action="insert.jsp" method="post">
			<div class="col-3">
				<label class="form-label" for="title">가게이름</label>
				<input class="form-control" type="text" name="title" id="title" />
			</div>
			
			<div>
				<label class="form-label" for="divfood">분류 선택</label>
		        <select name="divfood" id="divfood">
		            <option value="" selected>선택</option>
		            <option value="일식">일식</option>
		            <option value="한식">한식</option>
		            <option value="중식">중식</option>
		            <option value="양식">양식</option>
		            <option value="기타">기타</option>
		        </select>
			</div>
			
			<div>
				<label class="form-label" for="content">내용</label>
				<textarea name="content" id="content" rows="10"></textarea>
			</div>
			<button class="btn btn-primary" type="submit" onclick="submitContents(this)">등록</button>
		</form>
	</div>
	
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
</body>
</html>