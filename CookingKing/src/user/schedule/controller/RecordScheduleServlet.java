package user.schedule.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import board.model.vo.Schedule;
import user.schedule.model.service.ScheduleService;

/**
 * Servlet implementation class RecordScheduleServlet
 */
@WebServlet("/member/recordschedule")
public class RecordScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecordScheduleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("year"));		
		System.out.println(request.getParameter("month"));		
	
	  
		String userComm = request.getParameter("userComm");
		String userId = request.getParameter("userId");
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		System.out.println("userId = " + userId + " " + "year = "+year + " : " +"month ="+ month);

		Map<String, Object> map = new ScheduleService().selectRecord(userId, userComm, year, month);

		
		
		System.out.println(map);
//		System.out.println("checkDate =" + checkDate);
//
		Gson gson = new Gson();
		String jsonStr = gson.toJson(map);
		System.out.println(jsonStr);
		
		//응답에 쓰기
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().append(jsonStr);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
