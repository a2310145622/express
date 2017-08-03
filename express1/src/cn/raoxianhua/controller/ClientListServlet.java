/**
 * 
 */
package cn.raoxianhua.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.raoxianhua.common.CommonPage;
import cn.raoxianhua.dao.ClientDAO;

/**
 * DESC: 
 * 2017年7月27日
 * @author BKF
 */
@WebServlet("/queryClientList")
public class ClientListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

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

		ClientDAO dao = new ClientDAO();
		CommonPage<Map<String, Object>> clients = dao.queryPage(currentPage);
		
		req.setAttribute("clients", clients);
//		req.getRequestDispatcher("emps.jsp").forward(req, resp);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
