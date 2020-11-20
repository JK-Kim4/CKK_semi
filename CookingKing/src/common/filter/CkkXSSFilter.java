package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


/**
 * Servlet Filter implementation class CkkXSSFilter
 */

public class CkkXSSFilter implements Filter {
	 @SuppressWarnings("unused")
	 private Object filterConfig;

	 @Override
	 public void init(FilterConfig filterConfig) throws ServletException {
	  this.filterConfig = filterConfig;
	 }

	 @Override
	 public void destroy() {
	  this.filterConfig = null;
	 }

	 @Override
	 public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	  chain.doFilter(new RequestWrapper((HttpServletRequest) request), response);
	 }

}
