/**
 * 
 */
package cn.raoxianhua.common.utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * DESC: 
 * 2017年7月25日
 * @author BKF
 */
@WebServlet("/doLogin")
public class SessionServletr extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

//		String uname = req.getParameter("uname");
//		String pwd = req.getParameter("pwd");
//		
//		if(uname.equals(pwd)) {
//
//			HttpSession session = req.getSession();
//			session.setAttribute("uname_in_session", uname);
//
//			resp.sendRedirect("index1.jsp");
//		} else {
//			resp.sendRedirect("input1.html");
//		}
		
		HttpSession session = req.getSession();
		String sid = (String)session.getAttribute("msg");
		if (sid.length()==0)
		System.out.println(sid.length());
	
	
	}
	
}
