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

import cn.raoxianhua.dms.service.IClientService;
import cn.raoxianhua.dms.service.IStaffService;
import cn.raoxianhua.dms.service.impl.ClientServiceImpl;
import cn.raoxianhua.dms.service.impl.StaffServiceImpl;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/doRegister")
public class SRegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IStaffService StaffService = new StaffServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String sid = req.getParameter("sid");
		String spwd = req.getParameter("spwd");
		String sname = req.getParameter("sname");
		String snumber = req.getParameter("snumber");
		String slphone = req.getParameter("slphone");
		String sremark = req.getParameter("sremark");
		
		int register = StaffService.doRegister(sid, spwd,sname,snumber,slphone,sremark);
		
		HttpSession session = req.getSession();
		String msg = "";
		if (register > 0) {
			msg = "添加管理员账号成功！";
			session.setAttribute("msg", msg);
			// 1. 请求重定向
			resp.sendRedirect("index.jsp");
			// 2. 请求转发
			// RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
			// dispatcher.forward(request, response);
		} else {
			msg = "注册失败！";
			session.setAttribute("msg", msg);
			resp.sendRedirect("add.jsp");
		}
		
	}
}
