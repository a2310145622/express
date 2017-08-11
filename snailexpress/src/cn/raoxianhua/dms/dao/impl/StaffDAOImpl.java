/**
 * 
 */
package cn.raoxianhua.dms.dao.impl;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.dao.IStaffDAO;
import cn.raoxianhua.dms.utils.DBUtils;
import cn.raoxianhua.dms.vo.Staff;

/**
 * @author raoxianhua
 *
 */
public class StaffDAOImpl implements IStaffDAO {

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.raoxianhua.dms.dao.IStaffDAO#querySingle(java.lang.String)
	 */
	@Override
	public Staff querySingle(String sid) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM STAFF WHERE STAFFCODE=?";
		Map<String, Object> user = DBUtils.querySingle(sql, sid);

		Staff staff = new Staff();
		try {
			staff.setSid(user.get("STAFFCODE").toString());
			staff.setSpwd(user.get("STAFFPASSWORD").toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staff;
	}
	
	@Override
	public int register(String sid, String spwd, String sname, String snumber, String slphone, String sremark) {
		// TODO Auto-generated method stub

		String sql = "INSERT INTO STAFF (STAFFID, STAFFCODE, STAFFNAME, STAFFNUMBER, "
				+ "LINKPHONE,STAFFPASSWORD,REMARK) VALUES (seq_staff.nextval, ?, ?, ?, ?,?,?)";

		int register = 0;
		try {
			register = DBUtils.modify(sql,sid, spwd,sname,snumber,slphone,sremark);
		} catch (Exception e) {

		}
		return register;
	}

	@Override
	public int modify(String sid, String spwd, String sname, String snumber, String slphone, String sremark) {
		// TODO Auto-generated method stub
		
		String sql ="UPDATE STAFF SET STAFFNAME=?,STAFFNUMBER=?,"
				+ "LINKPHONE=?,STAFFPASSWORD=?,REMARK=? WHERE STAFFCODE=?";

		int modify = 0;
		try {
			modify = DBUtils.modify(sql, sname, snumber, slphone, spwd, sremark, sid);
		} catch (Exception e) {

		}
		return modify;
	}

	@Override
	public CommonPage<Map<String, Object>> queryPage(int currentPage) {
		// TODO Auto-generated method stub
		
		CommonPage<Map<String, Object>> data = new CommonPage<>(currentPage, 3);

		String countSql = "SELECT count(1) FROM STAFF WHERE 1=1";
		String dataSql = "SELECT * " +
						 "  FROM (SELECT ROWNUM rn, s.STAFFCODE, s.STAFFNAME, s.STAFFNUMBER, "
						 + "s.LINKPHONE, s.STAFFPASSWORD,s.REMARK FROM STAFF s " +
						 "         WHERE ROWNUM <= ? * ? ORDER BY STAFFID) t" +
						 " WHERE rn > ? * (?-1)";

		data.setCountSql(countSql);
		data.setDataSql(dataSql);
		return data;
	}

	@Override
	public Staff query(String sid) {
		// TODO Auto-generated method stub
		
		String sql = "SELECT * FROM STAFF WHERE STAFFCODE=?";
		Map<String, Object> user = DBUtils.querySingle(sql, sid);

		Staff staff = new Staff();
		try {
			staff.setSid(user.get("STAFFCODE").toString());
			staff.setSpwd(user.get("STAFFPASSWORD").toString());
			staff.setSname(user.get("STAFFNAME").toString());
			staff.setSnumber(user.get("STAFFNUMBER").toString());
			staff.setSlphone(user.get("LINKPHONE").toString());
			staff.setSremark(user.get("REMARK").toString());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return staff;
	}

}
