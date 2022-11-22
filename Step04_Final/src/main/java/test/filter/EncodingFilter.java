package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//   "/*"  는 이 프로젝트에 오는 모든 요청에 대해 필터링을 하겠다는 의미
// Step04_Final/ 하위의 모든 요청

@WebFilter("/*")
public class EncodingFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 만일 인코딩 설정이 되지 않았다면
		if(request.getCharacterEncoding() == null) {
			//POST 방식 전송했을 때 한글 깨짐 방지
			request.setCharacterEncoding("utf-8");
		}
		
		//2. 요청의 흐름 이어가기
		chain.doFilter(request, response);
	}

}
