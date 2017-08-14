/**
 * 
 */
package cn.raoxianhua.dms.dao.impl;

import java.util.List;
import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.dao.IExpressDAO;
import cn.raoxianhua.dms.utils.DBUtils;
import cn.raoxianhua.dms.vo.Client;
import cn.raoxianhua.dms.vo.Express;

/**
 * @author raoxianhua
 *
 */
public class ExpressDAOImpl implements IExpressDAO {

	@Override
	public CommonPage<Map<String, Object>> queryPage(int currentPage) {
		// TODO Auto-generated method stub
		
		CommonPage<Map<String, Object>> data = new CommonPage<>(currentPage, 1);

		String countSql = "SELECT count(1) FROM EXPRESS WHERE 1=1";
		String dataSql = "SELECT * FROM (SELECT ROWNUM rn, e.EXPRESSID, e.CLIENTID, "
						 + "e.COLLECTCLIENTNAME, e.CONNECTTIME, e.SENDADDRESS,"
						 + "e.SIGNFOR,e.DELIVERYWAYID,e.COLLECTPHONE,e.REMARK,"
						 + "e.SENDCLIENTNAME,e.HOMEADDRESS,e.SENDPHONE FROM EXPRESS e "
						 + "WHERE ROWNUM <= ? * ?  ORDER BY e.EXPRESSID) t WHERE rn > ? * (?-1)";

		data.setCountSql(countSql);
		data.setDataSql(dataSql);
		return data;
	}

	@Override
	public List<Map<String, Object>> query(String eid) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM EXPRESSDETAILS  WHERE EXPRESSID=? ORDER BY EXPRESSDETAILSID";
		List<Map<String, Object>> express = null;
		
		try {
			express = DBUtils.query(sql, eid);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return express;
	}
	
	@Override
	public List<Map<String, Object>> equery(String eid) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM EXPRESS  WHERE EXPRESSID=?";
		List<Map<String, Object>> express = null;
		
		try {
			express = DBUtils.query(sql, eid);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return express;
	}

	@SuppressWarnings("null")
	@Override
	public Express add(String cid, String eccname, String ecphone, String esaddress, String eremark, String escname,
			String esphone, String ehaddress) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM CLIENT WHERE CLIENTCODE=?";
		
		String sql1 = "INSERT INTO EXPRESS (EXPRESSID, CLIENTID, COLLECTCLIENTNAME, COLLECTPHONE,SENDADDRESS, "
				+ "REMARK,SENDCLIENTNAME, SENDPHONE, HOMEADDRESS) VALUES" + 
				"(lpad(lpad(seq_express.nextval,6,'0'),8,'se'), ?, ? , ?, ?, ?, ?, ?,?)";
		String sql2 = "INSERT INTO EXPRESSDETAILS (EXPRESSDETAILSID, EXPRESSID) VALUES "
				+ "(lpad(lpad(seq_expressdetails.nextval,6,'0'),8,'ed'), lpad(lpad(seq_express.currval,6,'0'),8,'se'))";
		
		String sql3 = "select lpad(lpad(seq_express.currval,6,'0'),8,'se') from dual";
		
		int add = 0;
		Map<String, Object> user = null;
		Express express = new Express();
		try {
			user = DBUtils.querySingle(sql, cid);
			cid = user.get("CLIENTID").toString();
			add = DBUtils.modify(sql1,cid,eccname,ecphone,esaddress,eremark,escname,esphone,ehaddress);
			add = add + DBUtils.modify(sql2);
			express.setEid((String) DBUtils.querySingleData(sql3));
			
		} catch (Exception e) {

		}
		return express;
	}

	@Override
	public int modify(String eid,String eccname, String ecphone, String esaddress, String escname, String esphone,
			String ehaddress, String eremark, String esignfor, String edid) {
		// TODO Auto-generated method stub
		
		String sql ="UPDATE EXPRESS SET COLLECTCLIENTNAME=?,COLLECTPHONE=?,SENDADDRESS=?,"
				+ "SENDCLIENTNAME=?,SENDPHONE=?,HOMEADDRESS=?,REMARK=?,SIGNFOR=?,"
				+ "DELIVERYWAYID=? WHERE EXPRESSID=?";

		int modify = 0;
		try {
			modify = DBUtils.modify(sql,eccname, ecphone, esaddress,
					escname, esphone,ehaddress, eremark, esignfor, edid,eid);
		} catch (Exception e) {

		}
		return modify;
	}

	@Override
	public int update(String eid, String edetails) {
		// TODO Auto-generated method stub
		
		
		String sql = "INSERT INTO EXPRESSDETAILS (EXPRESSDETAILSID, EXPRESSDETAILS, EXPRESSID) VALUES "
				+ "(lpad(lpad(seq_expressdetails.nextval,6,'0'),8,'ed'), ?,?)";
		
		int update = 0;
		try {
			update = DBUtils.modify(sql,edetails,eid);
			
		} catch (Exception e) {

		}
		return update;
	}

	@Override
	public int delete(String eid) {
		// TODO Auto-generated method stub
		
		String sql1 = "DELETE FROM EXPRESSDETAILS WHERE EXPRESSID=?";
		String sql2 = "DELETE FROM EXPRESS WHERE EXPRESSID=?";
		
		int delete = 0;
		try {
			delete = DBUtils.modify(sql1,eid);
			delete = delete + DBUtils.modify(sql2,eid);
			
		} catch (Exception e) {

		}
		return delete;
	}

}
