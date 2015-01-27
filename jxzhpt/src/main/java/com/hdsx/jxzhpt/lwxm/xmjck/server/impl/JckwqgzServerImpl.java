package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class JckwqgzServerImpl extends BaseOperate implements JckwqgzServer {
	private Map<String, Object> hm;
	public JckwqgzServerImpl() {
		super("jckwqgz", "jdbc");
	}

	@Override
	public boolean insertWqgz(Jckwqgz wqgz) {
		if(insert("insertJckwqgz",wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Jckwqgz> selectWqgzList(Jckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", wqgz.getSbthcd());
		hm.put("gydw", wqgz.getGydw());
		hm.put("xzqhmc", wqgz.getXzqhmc());
		hm.put("lxmc", wqgz.getLxmc());
		hm.put("qlmc", wqgz.getQlmc());
		hm.put("xmnf", wqgz.getXmnf());
		hm.put("xmtype", wqgz.getXmtype());
		hm.put("sbzt", wqgz.getSbzt());
		hm.put("jsdj", wqgz.getJsdj());
		hm.put("akjfl", wqgz.getAkjfl());
		hm.put("page", wqgz.getPage());
		hm.put("rows", wqgz.getRows());
		return queryList("selectJckwqgz",hm);
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
		hm.put("qlbh", wqgz.getQlbh());
		hm.put("gydwbm", wqgz.getGydwbm());
		hm.put("xzqhdm", wqgz.getXzqhdm());
		return queryList("selectGpsroad", hm);
	}
	@Override
	public List<Jckwqgz> JckWqgzRoad(Jckwqgz wqgz) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("qlbh", wqgz.getQlbh());
		hm.put("gydwbm", wqgz.getGydwbm());
		return queryList("JckWqgzRoad", hm);
	}

	@Override
	public boolean deleteWqgzById(String delstr) {
		if(delete("deleteJckWqgz", delstr)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckWqgzShzt(Jckwqgz wqgz) {
		if(update("xgJckwqgzShzt", wqgz)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckWqgzSbzt(String delstr,Jckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("delstr", delstr);
		hm.put("sbbm", wqgz.getSbbm());
		hm.put("sbthcd", wqgz.getSbthcd());
		if(update("xgJckwqgzSbzt", hm)>0) return true;
		else return false;
	}

	@Override
	public int selectWqgzCount(Jckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", wqgz.getSbthcd());
		hm.put("gydw", wqgz.getGydw());
		hm.put("xzqhmc", wqgz.getXzqhmc());
		hm.put("lxmc", wqgz.getLxmc());
		hm.put("qlmc", wqgz.getQlmc());
		hm.put("xmnf", wqgz.getXmnf());
		hm.put("xmtype", wqgz.getXmtype());
		hm.put("sbzt", wqgz.getSbzt());
		hm.put("jsdj", wqgz.getJsdj());
		hm.put("akjfl", wqgz.getAkjfl());
		return queryOne("selectWqgzCount", hm);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqgz(Jckwqgz jckwqgz) {
		return this.queryList("exportExcel_wqgz",jckwqgz);
	}

	@Override
	public boolean importWqgz(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			map.put("8", map.get("8").substring(0, 4));
			map.put("16", map.get("16").substring(0, 4)+"年");
			map.put("tbbmbm", tbbmbm);
			map.put("sbthcd", sbthcd);
		}
		return this.insertBatch("importWqgz", list)==list.size()?true:false;
	}
	public List<Jckwqgz> selectJckShwqgz(Jckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", wqgz.getSbthcd());
		hm.put("gydw", wqgz.getGydw());
		hm.put("xzqhmc", wqgz.getXzqhmc());
		hm.put("lxmc", wqgz.getLxmc());
		hm.put("qlmc", wqgz.getQlmc());
		hm.put("xmnf", wqgz.getXmnf());
		hm.put("xmtype", wqgz.getXmtype());
		hm.put("shzt", wqgz.getShzt());
		hm.put("jsdj", wqgz.getJsdj());
		hm.put("akjfl", wqgz.getAkjfl());
		hm.put("page", wqgz.getPage());
		hm.put("rows", wqgz.getRows());
		return queryList("selectJckShwqgz",hm);
	}

	@Override
	public int selectWqgzShCount(Jckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("sbthcd", wqgz.getSbthcd());
		hm.put("gydw", wqgz.getGydw());
		hm.put("xzqhmc", wqgz.getXzqhmc());
		hm.put("lxmc", wqgz.getLxmc());
		hm.put("qlmc", wqgz.getQlmc());
		hm.put("xmnf", wqgz.getXmnf());
		hm.put("xmtype", wqgz.getXmtype());
		hm.put("shzt", wqgz.getShzt());
		hm.put("jsdj", wqgz.getJsdj());
		hm.put("akjfl", wqgz.getAkjfl());
		return queryOne("selectWqgzShCount",hm);
	}

	@Override
	public boolean xgJckWqgzTH(Jckwqgz wqgz) {
		if(update("xgJckWqgzTH", wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<SjbbMessage> exportExcel_wqgz_sh(Jckwqgz wqgz) {
		return this.queryList("exportExcel_wqgz_sh",wqgz);
	}
	public boolean onceWqgz(Jckwqgz wqgz) {
		int count = (Integer)queryOne("onceWqgz", wqgz);
		if(count<1) return true;
		else return false;
	}

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm) {
		Jckwqgz zh = new Jckwqgz();
		for (Map<String, String> map : data) {
			zh.setGydwbm(tbbmbm);
			zh.setQlbh(map.get("5"));
			zh.setLxbm(map.get("3"));
			zh.setQlzxzh(map.get("7"));
			if(queryList("daoRuwqgz", zh).size()>0){
				int count = (Integer)queryOne("onceWqgz", zh);
				if(count>0) return "项目基础库中已存在该项目，请勿重复添加！";
			}else return "无此项目或此项目不属于您的管理范围！";
		}
		return "jckwqgz_ok";
	}

	@Override
	public Jckwqgz selJsdj(Jckwqgz wqgz) {
		return queryOne("selJsdj", wqgz);
	}

}
