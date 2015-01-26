package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
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
	public List<Jckabgc> selectAbgcList(Jckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", abgc.getSbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("sbzt", abgc.getSbzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("page", abgc.getPage());
		hm.put("rows", abgc.getRows());
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
		hm.put("gydwbm", abgc.getGydwbm());
		hm.put("xzqhdm", abgc.getXzqhdm());
		return queryList("selectGpsroad", hm);
	}
	@Override
	public List<Jckabgc> selectJckRoad(Jckabgc abgc) {
		hm = new HashMap<String, Object>();
		hm.put("lxbm", abgc.getLxbm());
		hm.put("gydwbm", abgc.getGydwbm());
		return queryList("selectJckRoad", hm);
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
	public boolean xgJckAbgcSbzt(String delstr,Jckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("delstr", delstr);
		hm.put("sbbm", abgc.getSbbm());
		hm.put("sbthcd", abgc.getSbthcd());
		if(update("xgJckAbgcSbzt", hm)>0) return true;
		else return false;
	}

	@Override
	public int selectAbgcCount(Jckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", abgc.getSbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("sbzt", abgc.getSbzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		return queryOne("selectAbgcCount", hm);
	}

	@Override
	public List<Jckabgc> selectJckShabgc(Jckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", abgc.getSbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("page", abgc.getPage());
		hm.put("rows", abgc.getRows());
		return queryList("selectJckShabgc",hm);
	}

	@Override
	public int selectAbgcShCount(Jckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", abgc.getSbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		return queryOne("selectAbgcShCount",hm);
	}

	@Override
	public boolean xgJckAbgcTH(Jckabgc abgc) {
		if(update("xgJckAbgcTH", abgc)>0) return true;
		else return false;
	}

	@Override
	public boolean importAbgc(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			map.put("9", map.get("9").substring(0, 4));
			map.put("12", map.get("12").substring(0, 4)+"年");
			map.put("tbbmbm", tbbmbm);
			map.put("sbthcd", sbthcd);
		}
		return this.insertBatch("importAbgc",list)==list.size()?true:false;
	}

	@Override
	public List<SjbbMessage> exportExcel_abgc(Jckabgc jckabgc) {
		return this.queryList("exportExcel_abgc",jckabgc);
	}

	@Override
	public List<SjbbMessage> exportExcel_abgc_sh(Jckabgc jckabgc) {
		return this.queryList("exportExcel_abgc_sh",jckabgc);
	}
	@Override
	public boolean onceAbgc(Jckabgc abgc) {
		int count = (Integer)queryOne("onceAbgc", abgc);
		if(count<1) return true;
		else return false;
	}
	@Override
	public String yanZhen(List<Map<String,String>> data,String tbbmbm){
		Jckabgc ab = new Jckabgc();
		for (Map<String, String> map : data) {
			ab.setGydwbm(tbbmbm);
			ab.setLxbm(map.get("3"));
			ab.setQdzh(map.get("5"));
			ab.setZdzh(map.get("6"));
			if(queryList("daoRuabgc", ab).size()>0){
				int count = (Integer)queryOne("onceAbgc", ab);
				if(count>0) return "基础库中已存在该项目，请勿重复添加！";
			}else return "无此项目或此项目不属于您的管理范围！";
		}
		return "ok";
	}
	
}
