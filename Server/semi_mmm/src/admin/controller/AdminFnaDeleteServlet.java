package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.model.service.AdminService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminFnaDeleteServlet
 */
@WebServlet(name = "AdminFnaDelete", urlPatterns = { "/adminFnaDelete" })
public class AdminFnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFnaDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null || !((Member)session.getAttribute("member")).getMemberId().equals("admin")) {
			System.out.println("뒤로가기");
			RequestDispatcher rd = ((HttpServletRequest)request).getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			((HttpServletRequest)request).setAttribute("msg", "관리자 계정만 접근이 가능합니다.");
			((HttpServletRequest)request).setAttribute("loc", "/");
			rd.forward(request, response);
		}
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		int result = new AdminService().adminFnaDelete(qnaNo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		request.setAttribute("loc", "/adminFnaList");
		
		if (result > 0) {
			request.setAttribute("msg", "F&A를 삭제하였습니다.");
		} else {
			request.setAttribute("msg", "F&A 삭제에 실패하였습니다.");
		}
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
