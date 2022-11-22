<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	FileDto dto = FileDao.getInstance().getData(num);
	
	String orgFileName = dto.getOrgFileName();
	String saveFileName = dto.getSaveFileName();
	
	String path = application.getRealPath("/upload") + File.separator+saveFileName;
	File f = new File(path);
	
	String writer = (String)session.getAttribute("id");
	
	if(writer.equals(dto.getWriter())){
		f.delete();
		FileDao.getInstance().delete(num);
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/file/list.jsp");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/delete.jsp</title>
</head>
<body>
	<script>
		<%if(!writer.equals(dto.getWriter())){ %>
			alert("작성자가 업로드한 파일만 삭제할 수 있습니다.")
			location.href = "${pageContext.request.contextPath }/file/list.jsp";
		<%}%>
	</script>
</body>
</html>