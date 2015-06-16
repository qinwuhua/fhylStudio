package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class JckwqgzServerImpl extends BaseOperate implements JckwqgzServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
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
		return queryList("selectJckwqgz",wqgz);
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
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteJckWqgz", list)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckWqgzShzt(String delstr,Jckwqgz wqgz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("shbm", wqgz.getShbm());
			lm.add(hm);
		}
		return this.updateBatch("xgJckwqgzShzt", lm)==lm.size()?true:false;
	}

	@Override
	public boolean xgJckWqgzSbzt(String delstr,Jckwqgz wqgz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbbm", wqgz.getSbbm());
			hm.put("sbthcd", wqgz.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgJckwqgzSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public int selectWqgzCount(Jckwqgz wqgz) {
		return queryOne("selectWqgzCount", wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqgz(Jckwqgz jckwqgz) {
		return this.queryList("exportExcel_wqgz",jckwqgz);
	}

	@Override
	public boolean importWqgz(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
/*			map.put("8", map.get("8").substring(0, 4)+"年");*/
			map.put("tbbmbm", tbbmbm);
			map.put("sbthcd", sbthcd);
		}
		return this.insertBatch("importWqgz", list)==list.size()?true:false;
	}
	@Override
	public boolean importWqgz2(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			if(map.get("1").length()!=6){
				map.put("1", map.get("1").substring(0,6));
			}
			if(map.get("8").length()!=4){
				map.put("8", map.get("8").substring(0, 4));
			}else{
				map.put("8", map.get("8"));
			}
			map.put("tbbmbm", tbbmbm);
			map.put("sbthcd", sbthcd);
		}
		return this.insertBatch("importWqgz2", list)==list.size()?true:false;
	}
	
	@Override
	public List<Jckwqgz> selectJckShwqgz(Jckwqgz wqgz) {
		return queryList("selectJckShwqgz",wqgz);
	}

	@Override
	public int selectWqgzShCount(Jckwqgz wqgz) {
		return queryOne("selectWqgzShCount",wqgz);
	}

	@Override
	public boolean xgJckWqgzTH(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(updateBatch("xgJckWqgzTH", list)>0) return true;
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
		String daoRu="";
		String once="";
		for (Map<String, String> map : data) {
			zh.setGydwbm(tbbmbm);
			zh.setQlbh(map.get("5"));
			zh.setLxbm(map.get("3"));
			zh.setQlzxzh(map.get("7"));
			if(queryList("daoRuwqgz", zh).size()>0){
				int count = (Integer)queryOne("onceWqgz", zh);
				if(count>0){
					once+=map.get("5")+"    ";
				}
			}else{
				daoRu+=map.get("5")+"    ";
			}
		}
		if(daoRu==""){
			if(once=="") return "jckwqgz_ok";
			else return "&nbsp;桥梁编码为</br>"+once+"的项目已添加，请勿重复添加！";
		}else return "&nbsp;无桥梁编码为</br>"+daoRu+"的项目或此项目不属于您的管理范围！";
	}

	@Override
	public Jckwqgz selJsdj(Jckwqgz wqgz) {
		return queryOne("selJsdj", wqgz);
	}

	@Override
	public List<String> selectTSDQ(Jckwqgz wqgz) {
		// TODO Auto-generated method stub
		return queryList("selectTSDQ",wqgz);
	}

}
