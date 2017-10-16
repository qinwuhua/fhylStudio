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
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
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
		return queryList("selectJckabgc",abgc);
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
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteJckAbgc", list)>0) return true;
		else return false;
	}

	@Override
	public boolean xgJckAbgcShzt(String delstr,Jckabgc abgc) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("shbm", abgc.getShbm());
			lm.add(hm);
		}
		return this.updateBatch("xgJckAbgcShzt", lm)==lm.size()?true:false;
	}
	@Override
	public boolean xgShzt2(String delstr, String xmlx) {
		hm=new HashMap<String, Object>();
		hm.put("id", delstr);
		hm.put("xmlx", xmlx);
		if("xmk_wqgz".equals(xmlx))
			return this.update("xgShztwqjck", hm)!=0?true:false;
		else
		return this.update("xgShzt2", hm)!=0?true:false;
		
	}
	@Override
	public boolean xgJckAbgcSbzt(String delstr,Jckabgc abgc) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbbm", abgc.getSbbm());
			hm.put("sbthcd", abgc.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgJckAbgcSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public int selectAbgcCount(Jckabgc abgc) {
		return queryOne("selectAbgcCount", abgc);
	}

	@Override
	public List<Jckabgc> selectJckShabgc(Jckabgc abgc) {
		return queryList("selectJckShabgc",abgc);
	}

	@Override
	public int selectAbgcShCount(Jckabgc abgc) {
		return queryOne("selectAbgcShCount",abgc);
	}

	@Override
	public boolean xgJckAbgcTH(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(updateBatch("xgJckAbgcTH", list)>0) return true;
		else return false;
	}

	@Override
	public boolean importAbgc(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			if(map.get("1").length()!=6){
				map.put("1", map.get("1").substring(0,6));
			}
			if(map.get("9").length()!=4){
				map.put("9", map.get("9").substring(0, 4));
			}
			if(map.get("12").length()!=4){
				map.put("12", map.get("12").substring(0, 4));
			}else{
				map.put("12", map.get("12"));
			}
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
		String daoRu="";
		String once="";
		for (Map<String, String> map : data) {
			ab.setGydwbm(tbbmbm);
			ab.setLxbm(map.get("3"));
			ab.setQdzh(map.get("5"));
			ab.setZdzh(map.get("6"));
			if(queryList("daoRuabgc", ab).size()>0){
				int count = (Integer)queryOne("onceAbgc", ab);
				if(count>0){
					once+=map.get("3")+"    ";
				}
			}else{
				daoRu+=map.get("3")+"    ";
			}
		}
		if(daoRu==""){
			if(once=="") return "jckabgc_ok";
			else return "&nbsp;路线编码为</br>"+once+"的项目已添加，请勿重复添加！";
		}else return "&nbsp;无路线编码为</br>"+daoRu+"的项目或此项目不属于您的管理范围！";
	}

	@Override
	public Jckabgc selAbgcCount(Jckabgc abgc) {
		return queryOne("selAbgcCount", abgc);
	}

	@Override
	public Jckabgc selAbgcShCount(Jckabgc abgc) {
		return queryOne("selAbgcShCount", abgc);
	}

	
	
}
