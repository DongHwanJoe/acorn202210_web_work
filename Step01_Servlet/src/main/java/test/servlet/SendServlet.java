package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")
public class SendServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 *  요청과 관련된 정보를 얻어낼 때는 HttpServletRequest 객체를 활용하면 된다.
		 */
		
		//"msg" 라는 파라미터 명으로 전달되는 문자열을 읽어와서 msg라는 지역 변수에 담기
		// 해당 파라미터 명으로 전달되는 정보가 없으면 null이 리턴된다.
		String msg = req.getParameter("msg");
		
		//콘솔창에 출력해보기
		System.out.println("msg:"+msg);
		
		//응답하기
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		resp.setContentType("text/html; charset=utf-8");

		//클라이언트의 웹브라우저에 문자열을 출력할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw = resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset = \"utf-8\">");
		pw.println("<title>메시지 전송 결과 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>메시지 전송 완료</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();//닫아주기
	}
}
