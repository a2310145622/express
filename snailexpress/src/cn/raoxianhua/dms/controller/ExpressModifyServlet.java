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

import cn.raoxianhua.dms.service.IExpressService;
import cn.raoxianhua.dms.service.impl.ExpressServiceImpl;



/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/doExpressModify")
public class ExpressModifyServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IExpressService ExpressService = new ExpressServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String eid = req.getParameter("eid");
		String eccname = req.getParameter("eccname");
		String ecphone = req.getParameter("ecphone");
		String esaddress = req.getParameter("esaddress");
		String escname = req.getParameter("escname");
		String esphone = req.getParameter("esphone");
		String ehaddress = req.getParameter("ehaddress");
		String eremark = req.getParameter("eremark");
		String esignfor = req.getParameter("esignfor");
		String edid = req.getParameter("edid");
		
		int modify = ExpressService.doModify(eid,eccname,ecphone,esaddress,
				escname,esphone,ehaddress,eremark,esignfor,edid);
		
		HttpSession session = req.getSession();
		String msg = "";
		if (modify > 0) {
			msg = "运单信息修改成功！";
			session.setAttribute("msg", msg);
			// 1. 请求重定向
			resp.sendRedirect("queryExpressList");
			// 2. 请求转发
			// RequestDispatcher dispatcher = ç.getRequestDispatcher("index.html");
			// dispatcher.forward(request, response);
		} else {
			msg = "运单信息修改失败！";
			session.setAttribute("msg", msg);
			resp.sendRedirect(req.getHeader("Referer"));
		}
	}

}
