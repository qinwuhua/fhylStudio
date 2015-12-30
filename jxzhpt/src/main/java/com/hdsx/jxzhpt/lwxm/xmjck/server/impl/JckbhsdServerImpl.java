package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.bcel.generic.NEW;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckbhsd;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckbhsdServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Unit;
@Service
public class JckbhsdServerImpl extends BaseOperate implements JckbhsdServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public JckbhsdServerImpl() {
		super("jckbhsd", "jdbc");
	}

	@Override
	public boolean insertWqgz(Jckbhsd wqgz) {
		if(insert("insertJckbhsd",wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Jckbhsd> selectWqgzList(Jckbhsd wqgz) {
		return queryList("selectJckbhsd",wqgz);
	}

	@Override
	public Jckbhsd selectWqgzById(Jckbhsd wqgz) {
		return queryOne("selectJckbhsdById", wqgz);
	}

	@Override
	public boolean updateWqgzById(Jckbhsd wqgz) {
		if(update("updateJckbhsd", wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Jckbhsd> selectGpsroad(Jckbhsd wqgz) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sddm", wqgz.getSddm());
		hm.put("gydwbm", wqgz.getGydwbm());
		hm.put("xzqhdm", wqgz.getXzqhdm());
//		if (wqgz.getXtType()!=null && !wqgz.getXtType().equals("")
//				&&wqgz.getXtType().equals("nc")) {
//			return queryList("selectGpsroadNc", hm);
//		}else {
			return queryList("selectGpsroad", hm);
//		}
	}
	@Override
	public List<Jckbhsd> JckbhsdRoad(Jckbhsd wqgz) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sddm", wqgz.getSddm());
		hm.put("gydwbm", wqgz.getGydwbm());
//		if (wqgz.getXtType()!=null && !wqgz.getXtType().equals("")
//				&& wqgz.getXtType().equals("nc")) {
//			return queryList("jckbhsdRoadNc", hm);
//		}else {
			return queryList("jckbhsdRoad", hm);
//		}
	}

	@Override
	public boolean deleteWqgzById(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteJckbhsd", list)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckbhsdShzt(String delstr,Jckbhsd wqgz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("shbm", wqgz.getShbm());
			lm.add(hm);
		}
		return this.updateBatch("xgJckbhsdShzt", lm)==lm.size()?true:false;
	}

	@Override
	public boolean xgJckbhsdSdzt(String delstr,Jckbhsd wqgz) {
//		String[] strs = delstr.split(",");
		if (delstr!=null&&!delstr.equals("")
				&&delstr.equals("nc")) {
			wqgz.setXtType("and substr(lxbm,1,1) not in('G','S')");
		}
		else {
			wqgz.setXtType("and substr(lxbm,1,1) in('G','S')");
		}
		List<Jckbhsd> wsds=queryList("selectJckBhsdWsd", wqgz);
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < wsds.size(); i++) {
			Jckbhsd wsd=wsds.get(i);
			hm=new HashMap<String, Object>();
			hm.put("id", wsd.getId());
			lm.add(hm);
		}
		return this.updateBatch("xgJckbhsdSdzt", lm)==lm.size()?true:false;
	}
	
	@Override
	public boolean xgJckbhsdSbzt(String delstr,Jckbhsd wqgz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbbm", wqgz.getSbbm());
			hm.put("sbthcd", wqgz.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgJckbhsdSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public int selectWqgzCount(Jckbhsd wqgz) {
		return queryOne("selectBhsdCount", wqgz);
	}

	@Override
	public List<SjbbMessage> exportExcel_wqgz(Jckbhsd Jckbhsd) {
		return this.queryList("exportExcel_bhsd",Jckbhsd);
	}

	@Override
	public boolean importWqgz(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
/*			map.put("8", map.get("8").substring(0, 4)+"年");*/
			map.put("tbbmbm", tbbmbm);
			map.put("sbthcd", sbthcd);
		}
		return this.insertBatch("importBhsd", list)==list.size()?true:false;
	}
	@Override
	public boolean importWqgz2(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			if(map.get("1").length()!=6){
				map.put("1", map.get("1").substring(0,6));
			}
			if(map.get("9").length()!=4){
				map.put("9", map.get("9").substring(0, 4));
			}else{
				map.put("9", map.get("9"));
			}
			if(map.get("12").length()!=4){
				map.put("12", map.get("12").substring(0, 4));
			}else{
				map.put("12", map.get("12"));
			}
			map.put("tbbmbm", tbbmbm);
			map.put("sbthcd", sbthcd);
		}
		return this.insertBatch("importBhsd", list)==list.size()?true:false;
	}
	
	@Override
	public List<Jckbhsd> selectJckShwqgz(Jckbhsd wqgz) {
		return queryList("selectJckShbhsd",wqgz);
	}

	@Override
	public int selectWqgzShCount(Jckbhsd wqgz) {
		return queryOne("selectBhsdShCount",wqgz);
	}

	@Override
	public List<Jckbhsd> selectJckSdwqgz(Jckbhsd wqgz) {
		return queryList("selectJckSdbhsd",wqgz);
	}

	@Override
	public int selectWqgzSdCount(Jckbhsd wqgz) {
		return queryOne("selectBhsdSdCount",wqgz);
	}
	
	@Override
	public boolean xgJckbhsdTH(String delstr,Jckbhsd wJckbhsd) {
		String[] strs = delstr.split(",");
		lm = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("thyj", wJckbhsd.getThyj());
			lm.add(hm);
		}
			if(updateBatch("xgJckbhsdTH", lm)==lm.size()) return true;
			else return false;
	}

	@Override
	public boolean xgJckbhsdTH1(String delstr,String unit2) {
		Jckbhsd Jckbhsd=new Jckbhsd();
		String[] strs = delstr.split(",");
		lm = new ArrayList<Map<String,Object>>();
		hm=new HashMap<String, Object>();
		for (int i = 0; i < strs.length; i++) {
			hm.put("id", strs[i]);
			hm.put("sbbm", "");
		    //市级退回
			if (unit2.length()==9) {
				hm.put("sbbm", "");//清空上报单位即可
			}
			//省级退回
			if (unit2.length()==7) {
				Jckbhsd=queryOne("selectSbbmByBhsdId", new Jckbhsd(strs[i]));
				hm.put("sbbm", Jckbhsd.getSbbm());//将上报单位改为对应的市级单位
			}
			lm.add(hm);
		}
		if(updateBatch("xgJckbhsdTH1", lm)>0) return true;
		else return false;
	}
	
	@Override
	public List<SjbbMessage> exportExcel_wqgz_sh(Jckbhsd wqgz) {
		return this.queryList("exportExcel_bhsd_sh",wqgz);
	}
	@Override
	public List<SjbbMessage> exportExcel_wqgz_sd(Jckbhsd wqgz) {
		return this.queryList("exportExcel_bhsd_sd",wqgz);
	}
	
	public boolean onceWqgz(Jckbhsd wqgz) {
		int count = (Integer)queryOne("onceBhsd", wqgz);
		if(count<1) return true;
		else return false;
	}

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm) {
		Jckbhsd zh = new Jckbhsd();
		String daoRu="";
		String once="";
		for (Map<String, String> map : data) {
			zh.setGydwbm(tbbmbm);
			zh.setSddm(map.get("5"));
			zh.setLxbm(map.get("3"));
			zh.setSdzxzh(map.get("7"));
			if(queryList("daoRubhsd", zh).size()>0){
				int count = (Integer)queryOne("onceBhsd", zh);
				if(count>0){
					once+=map.get("5")+"    ";
				}
			}else{
				daoRu+=map.get("5")+"    ";
			}
		}
		if(daoRu==""){
			if(once=="") return "jckbhsd_ok";
			else return "&nbsp;隧道代码为</br>"+once+"的项目已添加，请勿重复添加！";
		}else return "&nbsp;无隧道代码为</br>"+daoRu+"的项目或此项目不属于您的管理范围！";
	}

	@Override
	public Jckbhsd selJsdj(Jckbhsd wqgz) {
		return queryOne("selJsdj", wqgz);
	}

	@Override
	public List<String> selectTSDQ(String xzqh) {
		return queryList("selectTSDQ",xzqh);
	}

}
