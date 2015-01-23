package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
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
		hm.put("sbthcd", zhfz.getSbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("sbzt", zhfz.getSbzt());
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
		hm.put("gydwbm", zhfz.getGydwbm());
		hm.put("xzqhdm", zhfz.getXzqhdm());
		return queryList("selectGpsroad", hm);
	}
	@Override
	public List<Jckzhfz> JckzhfzRoad(Jckzhfz zhfz) {
		hm = new HashMap<String, Object>();
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("gydwbm", zhfz.getGydwbm());
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
	public boolean xgJckZhfzSbzt(String delstr,Jckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("delstr", delstr);
		hm.put("sbbm", zhfz.getSbbm());
		hm.put("sbthcd", zhfz.getSbthcd());
		if(update("xgJckzhfzSbzt", hm)>0) return true;
		else return false;
	}

	@Override
	public int selectZhfzCount(Jckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", zhfz.getSbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("sbzt", zhfz.getSbzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		return queryOne("selectZhfzCount", hm);
	}

	@Override
	public List<Jckzhfz> selectJckShzhfz(Jckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", zhfz.getSbthcd());
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
		hm.put("sbthcd", zhfz.getSbthcd());
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
	public boolean importZhfz(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			map.put("9", map.get("9").substring(0, 4));
			map.put("12", map.get("12").substring(0, 4)+"年");
			map.put("tbbmbm", tbbmbm);
			map.put("sbthcd", sbthcd);
		}
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

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm) {
		Jckzhfz zh = new Jckzhfz();
		for (Map<String, String> map : data) {
			zh.setGydwbm(tbbmbm);
			zh.setLxbm(map.get("3"));
			zh.setQdzh(map.get("5"));
			zh.setZdzh(map.get("6"));
			if(queryList("daoRuzhfz", zh).size()>0){
				int count = (Integer)queryOne("onceZhfz", zh);
				if(count>0) return "项目基础库中已存在该项目，请勿重复添加！";
			}else return "无此项目或此项目不属于您的管理范围！";
		}
		return "jckzhfz_ok";
	}

}
