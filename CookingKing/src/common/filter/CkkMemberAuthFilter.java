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

import user.member.model.service.UserService;
import user.vo.User;

/**
 * Servlet Filter implementation class MemberAuthFilter
 */
@WebFilter(urlPatterns = {
		"/user/view"
		
		})
public class CkkMemberAuthFilter implements Filter {

    /**
     * Default constructor. 
     */
    public CkkMemberAuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @실습문제: 로그인한 사용자가 본인의 상세보기를 요청하는지 검사. 그렇지 않은 경우, 돌려보내기
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 전처리
		HttpServletRequest httpReq = (HttpServletRequest)request;
		HttpSession session = httpReq.getSession();
		User memberLoggedIn = (User)session.getAttribute("memberLoggedIn");
		String userId = request.getParameter("userId");
		
		//로그인한 사용자의 아이디와 요청아이디가 같거나 관리자 인경우만 가능
		if(memberLoggedIn == null || userId == null 
				||!(userId.equals(memberLoggedIn.getUserId())
					|| UserService.USER_ADMIN.equals(memberLoggedIn.getCommGrade())	
						)
			) {
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
