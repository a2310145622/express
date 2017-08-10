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

/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/doStaffModify")
public class SModifyServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IStaffService StaffService = new StaffServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("UTF-8");

		String sid = req.getParameter("sid");
		String spwd = req.getParameter("spwd");
		String sname = req.getParameter("sname");
		String snumber = req.getParameter("snumber");
		String slphone = req.getParameter("slphone");
		String sremark = req.getParameter("sremark");
		
		int modify = StaffService.doModify(sid, spwd,sname,snumber,slphone,sremark);
		
		HttpSession session = req.getSession();
		String msg = "";
		if (modify > 0) {
			msg = "用户信息修改成功！";
			session.setAttribute("msg", msg);
			// 1. 请求重定向
			resp.sendRedirect("queryStaffList");
			// 2. 请求转发
			// RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
			// dispatcher.forward(request, response);
		} else {
			msg = "用户信息修改失败！";
			session.setAttribute("msg", msg);
			resp.sendRedirect(req.getHeader("Referer"));
		}
		
	}
	
}
