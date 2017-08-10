/**
 * 
 */
package cn.raoxianhua.dms.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.service.IClientService;
import cn.raoxianhua.dms.service.impl.ClientServiceImpl;



/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/queryClientList")
public class ClientListServlet extends HttpServlet {

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

		int currentPage = 1;
		try {
			String currPage = req.getParameter("currPage");
			currentPage = Integer.valueOf(currPage);
		} catch (Exception e) { }
		
		CommonPage<Map<String, Object>> clients = ClientService.queryPage(currentPage);
		
		req.setAttribute("clients", clients);
//		req.getRequestDispatcher("emps.jsp").forward(req, resp);
		req.getRequestDispatcher("client.jsp").forward(req, resp);
	}

}
