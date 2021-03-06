package center.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import center.model.service.CenterService;
import center.model.vo.Center;
import common.Utils;

/**
 * Servlet implementation class CenterListServlet
 */
@WebServlet("/center/list")
public class CenterListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CenterListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int numPerPage = 15; //한페이지당 표시되는 리스트 수
		int cPage = 1;//요청한 페이지
		
		try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			
		}
		
		List<Center> list = new CenterService().selectCenterList(cPage, numPerPage);
		
		int totalContents = new CenterService().selectCenterCount();
		String url = request.getRequestURI();
		String pageBar = Utils.getPageBarHTML(cPage, numPerPage, totalContents, url);
	
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
		RequestDispatcher reqDispatcher = request.getRequestDispatcher("/WEB-INF/views/center/CenterList.jsp");
		reqDispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
