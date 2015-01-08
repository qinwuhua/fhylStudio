package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
@Service
public class JckabgcServerImpl extends BaseOperate implements JckabgcServer {
	private Map<String, Object> hm;
	public JckabgcServerImpl() {
		super("jckabgc", "jdbc");
	}

	@Override
	public boolean insertAbgc(Jckabgc jckabgc) {
		if(insert("insertJckabgc",jckabgc)>0) return true;
		else return false;
	}

	@Override
	public List<Jckabgc> selectAbgcList(Jckabgc abgc,int page,int rows) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("page", page);
		hm.put("rows", rows);
		return queryList("selectJckabgc",hm);
	}

	@Override
	public Jckabgc selectAbgcById(Jckabgc abgc) {
		return queryOne("selectJckabgcById", abgc);
	}

	@Override
	public boolean updateAbgcById(Jckabgc abgc) {
		if(update("updateJckabgc", abgc)>0) return true;
		else return false;
	}

	@Override
	public List<Jckabgc> selectGpsroad(Jckabgc abgc) {
		hm = new HashMap<String, Object>();
		hm.put("lxbm", abgc.getLxbm());
		return queryList("selectGpsroad", hm);
	}

	@Override
	public boolean deleteAbgcById(String delstr) {
		if(delete("deleteJckAbgc", delstr)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckAbgcShzt(Jckabgc abgc) {
		if(update("xgJckAbgcShzt", abgc)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckAbgcSbzt(String delstr) {
		if(update("xgJckAbgcSbzt", delstr)>0) return true;
		else return false;
	}

	@Override
	public int selectAbgcCount(Jckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		return queryOne("selectAbgcCount", hm);
	}

}
