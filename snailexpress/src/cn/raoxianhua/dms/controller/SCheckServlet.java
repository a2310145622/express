/**
 * 
 */
package cn.raoxianhua.dms.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.raoxianhua.dms.service.IStaffService;
import cn.raoxianhua.dms.service.impl.StaffServiceImpl;
import cn.raoxianhua.dms.vo.Staff;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/manager/doCheck")
public class SCheckServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IStaffService StaffService = new StaffServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String sid = req.getParameter("sid");
		
		Staff staff = StaffService.doCheck(sid);
		
		//System.out.println(user.toString());
		
		resp.setCharacterEncoding("UTF-8");
		
		String msg = "";
		if( staff.getSid()==null ) {
			msg = "<font color=green >用户名可用!</font>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		} else {
			msg = "<font color=red >用户名已被使用!</font>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		}
	}

}
