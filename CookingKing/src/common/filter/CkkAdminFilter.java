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
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter(urlPatterns = {
			"/admin/*"
		})
public class CkkAdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CkkAdminFilter() {
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
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpSession session = httpReq.getSession();
		User memberLoggedIn = (User)session.getAttribute("memberLoggedIn");
		
		
		if(memberLoggedIn == null 
				|| !"AD".equals(memberLoggedIn.getCommGrade())) {
			request.setAttribute("msg", "경로가 잘못되었습니다.");
			request.setAttribute("loc", httpReq.getContextPath());
			
			//파일 위치 경로 정할때 절대 경로로 해야한다.
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request,response);
			
			return;
		}
		
		
		chain.doFilter(request, response);
		// 후처리
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
