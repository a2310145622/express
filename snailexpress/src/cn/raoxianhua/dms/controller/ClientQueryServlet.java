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
@WebServlet("/settings")
public class ClientQueryServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IClientService ClientService = new ClientServiceImpl();
	
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
		String cid = (String) session.getAttribute("cid_in_session");
		
		Client query = ClientService.doQuery(cid);
		
		String msg = "";
		if (query != null) {
			req.setAttribute("cid", query.getCid());
			req.setAttribute("cname", query.getCname());
			req.setAttribute("clphone", query.getClphone());
			req.setAttribute("cemail", query.getCemail());
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
