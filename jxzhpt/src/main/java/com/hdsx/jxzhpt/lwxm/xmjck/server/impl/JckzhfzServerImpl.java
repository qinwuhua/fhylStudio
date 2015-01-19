package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
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
	public List<Jckzhfz> selectZhfzList(Jckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("page", zhfz.getPage());
		hm.put("rows", zhfz.getRows());
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
	public List<Jckzhfz> JckzhfzRoad(Jckzhfz zhfz) {
		hm = new HashMap<String, Object>();
		hm.put("lxbm", zhfz.getLxbm());
		return queryList("JckzhfzRoad", hm);
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

	@Override
	public List<Jckzhfz> selectJckShzhfz(Jckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("page", zhfz.getPage());
		hm.put("rows", zhfz.getRows());
		return queryList("selectJckShzhfz",hm);
	}

	@Override
	public int selectZhfzShCount(Jckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		return queryOne("selectZhfzShCount",hm);
	}

	@Override
	public boolean xgJckZhfzTH(Jckzhfz zhfz) {
		if(update("xgJckZhfzTH", zhfz)>0)return true;
		else return false;
	}

	@Override
	public boolean importZhfz(List<Map> list) {
		return this.insertBatch("importZhfz",list)==list.size()?true:false;
	}

	@Override
	public List<SjbbMessage> exportExcel_zhfz(Jckzhfz jckzhfz) {
		return this.queryList("exportExcel_zhfz",jckzhfz);
	}
	@Override
	public List<SjbbMessage> exportExcel_zhfz_sh(Jckzhfz jckzhfz) {
		return this.queryList("exportExcel_zhfz_sh",jckzhfz);
	}
	public boolean onceZhfz(Jckzhfz zhfz) {
		int count = (Integer)queryOne("onceZhfz", zhfz);
		if(count<1) return true;
		else return false;
	}

}
