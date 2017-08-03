/**
 * 
 */
package cn.raoxianhua.controller;

import java.io.IOException;
import java.net.URLDecoder;

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
@WebServlet("/readcookie")
public class ReadCookieServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Cookie[] cs = req.getCookies();
		for(Cookie c : cs) {
			System.out.println( c.getName() + ":" + URLDecoder.decode(c.getValue(), "utf-8"));
		}
	
	}
	
	
}
