/**
 * 
 */
package cn.raoxianhua.dms.dao.impl;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.utils.DBUtils;
import cn.raoxianhua.dms.vo.Client;
import cn.raoxianhua.dms.vo.Staff;

/**
 * @author raoxianhua
 *
 */
public class ClientDAOImpl implements cn.raoxianhua.dms.dao.IClientDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.raoxianhua.dms.dao.IClientDAO#querySingle(java.lang.String)
	 */
	@Override
	public Client querySingle(String cid) {
		// TODO Auto-generated method stub

		String sql = "SELECT * FROM CLIENT WHERE CLIENTID=?";
		Map<String, Object> user = DBUtils.querySingle(sql, cid);

		Client client = new Client();
		try {
			client.setCid(user.get("CLIENTID").toString());
			client.setCpwd(user.get("CLIENTPASSWORD").toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return client;
	}
	
	@Override
	public int register(String cid, String cpwd, String cname, String clphone, String cemail) {
		// TODO Auto-generated method stub
		
		String sql = "INSERT INTO CLIENT (CLIENTID, CLIENTNAME, LINKPHONE, "
				+ "CLIENTPASSWORD,CLIENTEMAIL) VALUES (?,?,?,?,?)";

		int register = 0;
		try {
			register = DBUtils.modify(sql, cid, cname, clphone, cpwd, cemail);
		} catch (Exception e) {

		}
		return register;
	}

	@Override
	public int modify(String cid, String cpwd, String cname, String clphone, String cemail) {
		// TODO Auto-generated method stub

		String sql ="UPDATE CLIENT SET CLIENTNAME=?,LINKPHONE=?,"
				+ "CLIENTPASSWORD=?,CLIENTEMAIL=? WHERE CLIENTID=?";

		int modify = 0;
		try {
			modify = DBUtils.modify(sql, cname, clphone, cpwd, cemail, cid);
		} catch (Exception e) {

		}
		return modify;
	}

	@Override
	public CommonPage<Map<String, Object>> queryPage(int currentPage) {
		// TODO Auto-generated method stub
		
		CommonPage<Map<String, Object>> data = new CommonPage<>(currentPage, 3);

		String countSql = "SELECT count(1) FROM CLIENT WHERE 1=1";
		String dataSql = "SELECT * " +
						 "  FROM (SELECT ROWNUM rn, c.CLIENTID, c.CLIENTNAME, c.LINKPHONE, "
						 + "c.CLIENTPASSWORD, c.CLIENTEMAIL FROM CLIENT c " +
						 "         WHERE ROWNUM <= ? * ? ORDER BY c.CLIENTID) t" +
						 " WHERE rn > ? * (?-1)";

		data.setCountSql(countSql);
		data.setDataSql(dataSql);
		return data;
	}

	@Override
	public Client query(String cid) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM CLIENT WHERE CLIENTID=?";
		Map<String, Object> user = DBUtils.querySingle(sql, cid);

		Client client = new Client();
		try {
			client.setCid(user.get("CLIENTID").toString());
			client.setCname(user.get("CLIENTNAME").toString());
			client.setClphone(user.get("LINKPHONE").toString());
			client.setCemail(user.get("CLIENTEMAIL").toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return client;
	}

	@Override
	public int modifyinfo(String cid, String cname, String clphone, String cemail) {
		// TODO Auto-generated method stub
		
		String sql ="UPDATE CLIENT SET CLIENTNAME=?,LINKPHONE=?,"
				+ "CLIENTEMAIL=? WHERE CLIENTID=?";

		int modifyinfo = 0;
		try {
			modifyinfo = DBUtils.modify(sql, cname, clphone, cemail, cid);
		} catch (Exception e) {

		}
		return modifyinfo;
	}

	@Override
	public int modifypwd(String cid, String cpwd, String ncpwd) {
		// TODO Auto-generated method stub
		
		String sql ="UPDATE CLIENT SET CLIENTPASSWORD=? WHERE CLIENTID=? and CLIENTPASSWORD=?";

		int modifypwd = 0;
		try {
			modifypwd = DBUtils.modify(sql,ncpwd,cid,cpwd);
		} catch (Exception e) {

		}
		return modifypwd;
	}

}
