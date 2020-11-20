package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import user.vo.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = {
		"/user/view", "/user/update", "/user/delete", 
		"/user/writeReview", "/user/message",
		"/member/schedule",
		"/board/insert" ,"/point/*"
		,"/board/delete","/board/update"
		}) // web.xml에 등록하지 않아도 자동으로 등록된다.
public class CkkLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CkkLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//전처리
		HttpServletRequest httpReq = (HttpServletRequest)request;// 형변환 먼저 처리
		HttpSession session = httpReq.getSession();
		User memberLoggedIn = (User)session.getAttribute("memberLoggedIn");
		if(memberLoggedIn == null) {
			request.setAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			request.setAttribute("loc", httpReq.getContextPath());
			
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
					.forward(request,response);
			
			return;
		}
		
		chain.doFilter(request, response);
		//후처리
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
