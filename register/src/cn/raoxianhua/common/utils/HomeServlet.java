/**
 * 
 */
package cn.raoxianhua.common.utils;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Map;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		Cookie[] cookies = req.getCookies();
	 	String uname = null;
	 	String pwd = null;
	 	HttpSession session = req.getSession();
	 	if (session.getAttribute("uname_in_session") == null) {
	 		if (cookies != null) {
	 			for (int i = 0; i < cookies.length; i++) {
	 				String name = cookies[i].getName();
	 				String pw = cookies[i].getName();
	 				if ("uname".equals(name)) {
	 					//如果是中文，cookies需要解码
	 					uname = URLDecoder.decode(cookies[i].getValue(), "utf-8");
	 				} else if ("pwd".equals(pw)) {
	 					pwd = cookies[i].getValue();
	 				}
	 			}
	 		}
	 		//当用户名和密码不为空时，自动登录
	 		if ((uname != null && !("".equals(uname))) && (pwd != null && !("".equals(pwd)))) {
	 			session.setAttribute("uname_in_session", uname);
	 			session.setAttribute("pwd_in_session", pwd);
	 			resp.sendRedirect("login");//get请求
	 		}
	 	}
		
		String sql = "SELECT * FROM T_USER";
		List<Map<String, Object>> users = DBUtils.query(sql);
		req.setAttribute("userList", users);
		req.getRequestDispatcher("queryEmpList").forward(req, resp);

	}
}
