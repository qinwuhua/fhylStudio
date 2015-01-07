package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
@Service
public class JckzhfzServerImpl extends BaseOperate implements JckzhfzServer {

	public JckzhfzServerImpl() {
		super("jckzhfz", "jdbc");
	}

	@Override
	public boolean insertZhfz(Jckzhfz zhfz) {
		if(insert("insertJckzhfz", zhfz)>0) return true;
			else return false;
	}

	@Override
	public List<Jckzhfz> selectZhfzList() {
		return queryList("selectJckzhfz");
	}

	@Override
	public Jckzhfz selectZhfzById(Jckzhfz zhfz) {
		return queryOne("selectJckzhfzById", zhfz);
	}

	@Override
	public boolean updateZhfzById(Jckzhfz zhfz) {
		if(update("updateJckzhfz", zhfz)>0) return true;
		else return false;
	}

	@Override
	public List<Jckzhfz> selectGpsroad(Jckzhfz zhfz) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lxbm", zhfz.getLxbm());
		return queryList("selectGpsroad", hm);
	}

	@Override
	public boolean deleteZhfzById(String delstr) {
		if(delete("deleteJckzhfz", delstr)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckZhfzShzt(Jckzhfz zhfz) {
		if(update("xgJckzhfzShzt", zhfz)>0) return true;
		else return false;
	}
	
}
