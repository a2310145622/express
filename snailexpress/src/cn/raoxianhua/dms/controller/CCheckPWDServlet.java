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
import javax.servlet.http.HttpSession;

import cn.raoxianhua.dms.service.IClientService;
import cn.raoxianhua.dms.service.impl.ClientServiceImpl;
import cn.raoxianhua.dms.vo.Client;

/**
 * @author raoxianhua
 *
 */
@WebServlet("/doCheckPassword")
public class CCheckPWDServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private IClientService ClientService = new ClientServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String cid = (String) session.getAttribute("cid_in_session");
		String cpwd = req.getParameter("cpwd");
		
		Client client = ClientService.doCheck(cid);
		
		//System.out.println(user.toString());
		
		resp.setCharacterEncoding("UTF-8");
		
		String msg = "";
		if( client.getCpwd().equals(cpwd) ) {
			msg = "<font color=green >原密码输入正确！</font>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		} else {
			msg = "<font color=red >原密码输入错误！</font>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			//System.out.println(msg);
		}
	}
	
}
