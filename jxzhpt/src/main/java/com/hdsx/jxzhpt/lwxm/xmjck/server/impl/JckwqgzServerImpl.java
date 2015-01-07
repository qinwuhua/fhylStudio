package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
@Service
public class JckwqgzServerImpl extends BaseOperate implements JckwqgzServer {

	public JckwqgzServerImpl() {
		super("jckwqgz", "jdbc");
	}

	@Override
	public boolean insertWqgz(Jckwqgz wqgz) {
		if(insert("insertJckwqgz",wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Jckwqgz> selectWqgzList() {
		return queryList("selectJckwqgz");
	}

	@Override
	public Jckwqgz selectWqgzById(Jckwqgz wqgz) {
		return queryOne("selectJckwqgzById", wqgz);
	}

	@Override
	public boolean updateWqgzById(Jckwqgz wqgz) {
		if(update("updateJckwqgz", wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Jckwqgz> selectGpsroad(Jckwqgz wqgz) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lxbm", wqgz.getLxbm());
		return queryList("selectGpsroad", hm);
	}

	@Override
	public boolean deleteWqgzById(String delstr) {
		if(delete("deleteJckWqgz", delstr)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckWqgzShzt(Jckwqgz wqgz) {
		if(update("xgJckWqgzShzt", wqgz)>0) return true;
		else return false;
	}

}
