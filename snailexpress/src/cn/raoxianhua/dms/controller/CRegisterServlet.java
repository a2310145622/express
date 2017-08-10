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
import cn.raoxianhua.dms.service.impl.ClientServiceImpl;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/doRegister")
public class CRegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IClientService ClientService = new ClientServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		String cid = req.getParameter("cid");
		String cpwd = req.getParameter("cpwd");
		String cname = req.getParameter("cname");
		String clphone = req.getParameter("clphone");
		String cemail = req.getParameter("cemail");
		
		int register = ClientService.doRegister(cid, cpwd,cname,clphone,cemail);
		
		HttpSession session = req.getSession();
		String msg = "";
		if (register > 0) {
			msg = "注册成功，请登录！";
			session.setAttribute("msg", msg);
			// 1. 请求重定向
			resp.sendRedirect("index.jsp");
			// 2. 请求转发
			// RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
			// dispatcher.forward(request, response);
		} else {
			msg = "注册失败！";
			session.setAttribute("msg", msg);
			resp.sendRedirect("register.jsp");
		}
		
	}
}
