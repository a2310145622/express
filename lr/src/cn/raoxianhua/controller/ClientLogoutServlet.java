/**
 * 
 */
package cn.raoxianhua.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/logout")
public class ClientLogoutServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Cookie cookies[] = req.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0);
				resp.addCookie(cookies[i]);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		req.getSession().removeAttribute("cid_in_session");
		resp.sendRedirect("home");
	}

}
