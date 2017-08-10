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
		
		String sql = "SELECT * FROM EXPRESS JOIN EXPRESSDETAILS ON "
				+ "EXPRESS.EXPRESSID=EXPRESSDETAILS.EXPRESSID WHERE EXPRESS.EXPRESSID=?";
		List<Map<String, Object>> express = null;
		
		try {
			express = DBUtils.query(sql, eid);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return express;
	}

	@Override
	public int add(String cid, String eccname, String ecphone, String esaddress, String eremark, String escname,
			String esphone, String ehaddress) {
		// TODO Auto-generated method stub
		
		String sql1 = "INSERT INTO EXPRESS (EXPRESSID, CLIENTID, COLLECTCLIENTNAME, COLLECTPHONE,SENDADDRESS, "
				+ "REMARK,SENDCLIENTNAME, SENDPHONE, HOMEADDRESS) VALUES" + 
				"(lpad(lpad(seq_express.nextval,6,'0'),8,'se'), ?, ? , ?, ?, ?, ?, ?,?)";
		String sql2 = "INSERT INTO EXPRESSDETAILS (EXPRESSDETAILSID, EXPRESSID) VALUES "
				+ "(lpad(lpad(seq_expressdetails.nextval,6,'0'),8,'ed'), lpad(lpad(seq_express.currval,6,'0'),8,'se'))";
		
		int add = 0;
		try {
			add = DBUtils.modify(sql1,cid,eccname,ecphone,esaddress,eremark,escname,esphone,ehaddress);
			add = add + DBUtils.modify(sql2);
			
		} catch (Exception e) {

		}
		return add;
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

}
