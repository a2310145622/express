/**
 * 
 */
package cn.raoxianhua.dms.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.raoxianhua.dms.service.IExpressService;
import cn.raoxianhua.dms.service.impl.ExpressServiceImpl;
import cn.raoxianhua.dms.vo.Express;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/doESearch")
public class SESearchServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IExpressService ExpressService = new ExpressServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("UTF-8");
		
		String eid=req.getParameter("eid");
		
		List<Map<String, Object>> express = ExpressService.doESearch(eid);
		req.setAttribute("EXPRESSID", eid);
		if(express.size()!=0) {
			req.setAttribute("EXPRESS", express);
		}
		//System.out.println(express.getEdwid());
		req.getRequestDispatcher("expresssearch.jsp").forward(req, resp);
	}
}
