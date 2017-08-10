/**
 * 
 */
package cn.raoxianhua.dms.service.impl;

import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.dao.IStaffDAO;
import cn.raoxianhua.dms.dao.impl.StaffDAOImpl;
import cn.raoxianhua.dms.service.IStaffService;
import cn.raoxianhua.dms.vo.Staff;

/**
 * @author raoxianhua
 *
 */
public class StaffServiceImpl implements IStaffService {
	
	private IStaffDAO staffDao;

	public StaffServiceImpl() {
		staffDao = new StaffDAOImpl();
	}
	
	@Override
	public Staff doLogin(String sid, String spwd) {
		// TODO Auto-generated method stub
		
		Staff staff = staffDao.querySingle(sid);
		if(staff.getSid() != null && staff.getSpwd().equals(spwd)) {
			return staff;
		} else
		return null;
	}

	@Override
	public Staff doLoginByCookie(String sid) {
		// TODO Auto-generated method stub
		
		Staff staff = staffDao.querySingle(sid);
		return staff;
	}

	@Override
	public Staff doCheck(String sid) {
		// TODO Auto-generated method stub
		
		Staff staff = staffDao.querySingle(sid);
		return staff;
	}
	
	@Override
	public int doRegister(String sid, String spwd, String sname, String snumber, String slphone, String sremark) {
		// TODO Auto-generated method stub
		
		int register = staffDao.register(sid,spwd,sname,snumber,slphone,sremark);
		return register;
	}

	@Override
	public int doModify(String sid, String spwd, String sname, String snumber, String slphone, String sremark) {
		// TODO Auto-generated method stub

		int modify = staffDao.modify(sid,spwd,sname,snumber,slphone,sremark);
		return modify;
	}

	@Override
	public CommonPage<Map<String, Object>> queryPage(int currentPage) {
		// TODO Auto-generated method stub
		
		CommonPage<Map<String, Object>> staffs = staffDao.queryPage(currentPage);
		return staffs;
	}

	@Override
	public Staff doQuery(String sid) {
		// TODO Auto-generated method stub
		
		Staff query = staffDao.query(sid);
		return query;
	}
	
}
