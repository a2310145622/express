/**
 * 
 */
package cn.raoxianhua.dms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.raoxianhua.dms.service.IStaffService;
import cn.raoxianhua.dms.service.impl.StaffServiceImpl;
import cn.raoxianhua.dms.vo.Staff;



/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/settings")
public class StaffQueryServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IStaffService StaffService = new StaffServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();
		String sid = (String) session.getAttribute("sid_in_session");
		
		Staff query = StaffService.doQuery(sid);
		
		String msg = "";
		if (query != null) {
			req.setAttribute("sid", query.getSid());
			req.setAttribute("spwd", query.getSpwd());
			req.setAttribute("sname", query.getSname());
			req.setAttribute("snumber", query.getSnumber());
			req.setAttribute("slphone", query.getSlphone());
			req.setAttribute("sremark", query.getSremark());
			// 1. 请求重定向
			//resp.sendRedirect("setting.jsp");
			// 2. 请求转发
			req.getRequestDispatcher("settings.jsp").forward(req, resp);
			// RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
			// dispatcher.forward(request, response);
		} else {
			resp.sendRedirect(req.getHeader("Referer"));
		}
	}

}
