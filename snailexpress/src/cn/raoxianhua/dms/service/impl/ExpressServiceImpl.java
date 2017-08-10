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
	public int doAdd(String cid, String eccname, String ecphone, String esaddress, String eremark, String escname,
			String esphone, String ehaddress) {
		// TODO Auto-generated method stub
		
		int add = expressDao.add(cid,eccname,ecphone,esaddress,eremark,escname,esphone,ehaddress);
		return add;
	}

	@Override
	public int doModify(String eid,String eccname, String ecphone, String esaddress, String escname, String esphone,
			String ehaddress, String eremark, String esignfor, String edid) {
		// TODO Auto-generated method stub
		
		int modify = expressDao.modify(eid,eccname, ecphone, esaddress,
				escname, esphone,ehaddress, eremark, esignfor, edid);
		return modify;
	}

}
