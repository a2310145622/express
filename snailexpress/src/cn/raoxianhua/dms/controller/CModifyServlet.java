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

/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/doClientModify")
public class CModifyServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IClientService ClientService = new ClientServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("UTF-8");

		String cid = req.getParameter("cid");
		String cpwd = req.getParameter("cpwd");
		String cname = req.getParameter("cname");
		String clphone = req.getParameter("clphone");
		String cemail = req.getParameter("cemail");
		
		int modify = ClientService.doModify(cid, cpwd,cname,clphone,cemail);
		
		HttpSession session = req.getSession();
		String msg = "";
		if (modify > 0) {
			msg = "用户信息修改成功！";
			session.setAttribute("msg", msg);
			// 1. 请求重定向
			resp.sendRedirect("queryClientList");
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
