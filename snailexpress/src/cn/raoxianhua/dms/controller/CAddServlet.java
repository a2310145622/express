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
@WebServlet("/doAdd")
public class CAddServlet extends HttpServlet {

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

		HttpSession session = req.getSession();
		String cid ="";
		if(session.getAttribute("cid_in_session")!=null)
		 cid = (String) session.getAttribute("cid_in_session");
		
		String eccname = req.getParameter("eccname");
		String ecphone = req.getParameter("ecphone");
		String esaddress = req.getParameter("esaddress");
		String eremark = req.getParameter("eremark");
		String escname = req.getParameter("escname");
		String esphone = req.getParameter("esphone");
		String ehaddress = req.getParameter("ehaddress");
		
		int add = ExpressService.doAdd(cid,eccname,ecphone,esaddress,eremark,escname,esphone,ehaddress);
		
		String addmsg = "";
		if(add==2) {
			addmsg = "订单提交成功！";
		}else 
			addmsg = "订单提交失败！";
		
		session.setAttribute("addmsg", addmsg);
		resp.sendRedirect("success.jsp");
	}

}
