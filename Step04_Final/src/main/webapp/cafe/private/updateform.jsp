<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)session.getAttribute("id");

	int num = Integer.parseInt(request.getParameter("num"));
	CafeDto dto = CafeDao.getInstance().getData(num);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
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
					<li class="breadcrumb-item">
						<a href="${pageContext.request.contextPath }/cafe/list.jsp">글 목록</a>
					</li>
					<li class="breadcrumb-item">
						<a href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=num %>">"<%=dto.getTitle() %>"</a>
					</li>
					<li class="breadcrumb-item active">글 수정하기</li>
				</ol>
			</div>
		</div>
	</nav>
	<div class="container">
		<h3>글 수정 폼입니다.</h3>
		<form action="update.jsp" method="post">
			<!-- 수정반영 시 필요한 글 번호를 input type="hidden"으로 전송되도록 한다 -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" value="<%=dto.getTitle() %>" />
			</div>
			<div>
				<label for="content">내용</label>
				<textarea name="content" id="content"><%=dto.getContent() %></textarea>
			</div>
			<button class="btn btn-primary" type="submit" onclick="submitContents(this)">수정확인</button>
			<a class="btn btn-danger" href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=num %>">취소</a>
		</form>
	</div>
	<script>
		<%if(!writer.equals(dto.getWriter())){ %>
			alert("작성자만 수정할 수 있습니다.")
			location.href = "${pageContext.request.contextPath }/cafe/detail.jsp?num="+num;
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
</body>
</html>