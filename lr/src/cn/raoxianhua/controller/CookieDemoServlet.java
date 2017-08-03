/**
 * 
 */
package cn.raoxianhua.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * DESC: 
 * 2017年7月25日
 * @author BKF
 */
@WebServlet("/cookiedemo")
public class CookieDemoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String uname = req.getParameter("uname");
		Cookie cookie = new Cookie("uname", uname);
		cookie.setMaxAge(60 * 60 * 24 * 365);
		
		resp.addCookie(cookie);
		PrintWriter out = resp.getWriter();
		out.print("Hello Cookie");
	}
}
