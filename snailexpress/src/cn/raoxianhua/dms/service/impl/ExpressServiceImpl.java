/**
 * 
 */
package cn.raoxianhua.dms.service.impl;

import java.util.List;
import java.util.Map;

import cn.raoxianhua.dms.common.CommonPage;
import cn.raoxianhua.dms.dao.IExpressDAO;
import cn.raoxianhua.dms.dao.impl.ExpressDAOImpl;
import cn.raoxianhua.dms.service.IExpressService;
import cn.raoxianhua.dms.vo.Client;
import cn.raoxianhua.dms.vo.Express;

/**
 * @author raoxianhua
 *
 */
public class ExpressServiceImpl implements IExpressService {
	
	private IExpressDAO expressDao;

	public ExpressServiceImpl() {
		expressDao = new ExpressDAOImpl();
	}

	@Override
	public CommonPage<Map<String, Object>> queryPage(int currentPage) {
		// TODO Auto-generated method stub
		
		CommonPage<Map<String, Object>> expresses = expressDao.queryPage(currentPage);
		return expresses;
	}

	@Override
	public List<Map<String, Object>> doSearch(String eid) {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> express = expressDao.query(eid);
		return express;
	}
	
	@Override
	public List<Map<String, Object>> doESearch(String eid) {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> express = expressDao.equery(eid);
		return express;
	}

	@Override
	public Express doAdd(String cid, String eccname, String ecphone, String esaddress, String eremark, String escname,
			String esphone, String ehaddress) {
		// TODO Auto-generated method stub
		
		Express express = expressDao.add(cid,eccname,ecphone,esaddress,eremark,escname,esphone,ehaddress);
		return express;
	}

	@Override
	public int doModify(String eid,String eccname, String ecphone, String esaddress, String escname, String esphone,
			String ehaddress, String eremark, String esignfor, String edid) {
		// TODO Auto-generated method stub
		
		int modify = expressDao.modify(eid,eccname, ecphone, esaddress,
				escname, esphone,ehaddress, eremark, esignfor, edid);
		return modify;
	}

	@Override
	public int doUpdate(String eid, String edetails) {
		// TODO Auto-generated method stub
		
		int update = expressDao.update(eid,edetails);
		return update;
	}

	@Override
	public int doDelete(String eid) {
		// TODO Auto-generated method stub
		
		int delete = expressDao.delete(eid);
		return delete;
	}

}
