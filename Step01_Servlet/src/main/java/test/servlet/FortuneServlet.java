package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//3. 어떤 경로 요청을 처리할것인지 경로 설정(반드시 / 로 시작해야한다.)
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{//1. HttpServlet 클래스를 상속

	//2. service() 메소드 오버라이드
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//원하는 내용을 응답
		
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
		pw.println("<title>오늘의 운세 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		
		String[] fortunes = {"동쪽으로 가면 귀인을 만나요",
				"짬뽕국물 튀어요",
				"커피 쏟아요",
				"강화 성공해요",
				"넘어져요",
				"길에서 돈주워요"};
	
		Random ran = new Random();
		int ranNum = ran.nextInt(fortunes.length);
		
		pw.println("<p> 오늘의 운세:"+fortunes[ranNum]+"</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();//닫아주기
	}
}
