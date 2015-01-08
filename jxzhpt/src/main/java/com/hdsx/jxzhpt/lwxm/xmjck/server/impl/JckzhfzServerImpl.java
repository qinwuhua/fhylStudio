package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
@Service
public class JckzhfzServerImpl extends BaseOperate implements JckzhfzServer {
	private Map<String, Object> hm;
	public JckzhfzServerImpl() {
		super("jckzhfz", "jdbc");
	}

	@Override
	public boolean insertZhfz(Jckzhfz zhfz) {
		if(insert("insertJckzhfz", zhfz)>0) return true;
			else return false;
	}

	@Override
	public List<Jckzhfz> selectZhfzList(Jckzhfz zhfz,int page,int rows) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("page", page);
		hm.put("rows", rows);
		return queryList("selectJckzhfz",hm);
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

	@Override
	public boolean xgJckZhfzSbzt(String delstr) {
		if(update("xgJckzhfzSbzt", delstr)>0) return true;
		else return false;
	}

	@Override
	public int selectZhfzCount(Jckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		return queryOne("selectZhfzCount", hm);
	}
	
}
