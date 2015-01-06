package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
@Service
public class JckabgcServerImpl extends BaseOperate implements JckabgcServer {

	public JckabgcServerImpl() {
		super("jckabgc", "jdbc");
	}

	@Override
	public boolean insertAbgc(Jckabgc jckabgc) {
		if(insert("insertJckabgc",jckabgc)>0) return true;
		else return false;
	}

	@Override
	public List<Jckabgc> selectAbgcList() {
		return queryList("selectJckabgc");
	}

	@Override
	public Jckabgc selectAbgcById(Jckabgc abgc) {
		return queryOne("selectJckabgcById", abgc);
	}

	@Override
	public boolean updateAbgc(Jckabgc abgc) {
		if(update("updateJckabgc", abgc)>0) return true;
		else return false;
	}

	@Override
	public List<Jckabgc> selectGpsroad(Jckabgc abgc) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lxbm", abgc.getLxbm());
		return queryList("selectGpsroad", hm);
	}

}
