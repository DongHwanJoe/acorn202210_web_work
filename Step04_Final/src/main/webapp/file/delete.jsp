<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 삭제할 파일 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//2. 해당 파일의 정보를 DB에서 읽어온다.
	FileDto dto = FileDao.getInstance().getData(num);
	
	//삭제 작업을 하기 전 로그인된 아이디와 글 작성자가 같은지 확인해서 같을때만 삭제하도록 한다.
	String id = (String)session.getAttribute("id");
	//만일 글 작성자와 로그인된 아이디가 같지 않으면
	if(!dto.getWriter().equals(id)){
		//금지된 요청이라고 에러 페이지를 응답한다.
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "다른 작성자의 파일은 삭제할 수 없습니다.");
		return;//메소드를 여기서 종료
	}
	
	//3. 파일 시스템에서 삭제한다. (webapp/upload 폴더에서 해당 파일을 삭제)
	String path = application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	//삭제할 파일의 전체 경로를 이용해서 File 객체 생성 후 해당 파일 삭제하기
	File f = new File(path);
	f.delete();
	//4. DB에서도 해당 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	//5. 응답하기
	String cPath=request.getContextPath();
	//파일 목록보기로 다시 리다일렉트 이동 시킨다.
   	response.sendRedirect(cPath+"/file/blist.jsp"); 
%>    