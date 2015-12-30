package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_bhsd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckbhsd;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckbhsdServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class SckbhsdServerImpl extends BaseOperate implements SckbhsdServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public SckbhsdServerImpl() {
		super("sckbhsd", "jdbc");
	}

	@Override
	public boolean insertSckbhsd(Sckbhsd wqgz) {
		if(insert("insertSckbhsd", wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Sckbhsd> selectSckbhsd(Sckbhsd wqgz) {
		return queryList("selectSckbhsd",wqgz);
	}

	@Override
	public int selectWqgzCount(Sckbhsd wqgz) {
		return queryOne("selectWqgzCount",wqgz);
	}

	@Override
	public boolean deleteSckbhsd(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteSckbhsd", list)>0)return true;
		else return false;
	}

	@Override
	public boolean updateSckbhsd(Sckbhsd wqgz) {
		if(update("updateSckbhsd", wqgz)>0)return true;
		else return false;
	}

	@Override
	public Sckbhsd selectSckbhsdById(Sckbhsd wqgz) {
		return queryOne("selectSckbhsdById", wqgz);
	}

	@Override
	public boolean xgSckbhsdSbzt(String delstr,Sckbhsd wqgz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_sbbm", wqgz.getSck_sbbm());
			hm.put("sck_sbthcd", wqgz.getSck_sbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgSckbhsdSbzt", lm)>0)return true;
		else return false;
	}
	@Override
	public boolean xgSckbhsdTH(String delstr,Sckbhsd Sckbhsd) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sck_thyj", Sckbhsd.getSck_thyj());
			lm.add(hm);
		}
		if(updateBatch("xgSckbhsdTH", lm)>0)return true;
		else return false;
	}

	@Override
	public boolean xgSckbhsdTH1(String delstr,String unit2) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		hm=new HashMap<String, Object>();
		Sckbhsd Sckbhsd=new Sckbhsd();
		for (int i = 0; i < strs.length; i++) {
			hm.put("sckid", strs[i]);
			hm.put("sck_sbbm", "");
			if(unit2.length()==9){hm.put("sck_sbbm", "");}
			if(unit2.length()==7){
				Sckbhsd=queryOne("selectSbbmByWqgzId", new Sckbhsd(strs[i]));
				hm.put("sck_sbbm", Sckbhsd.getSck_sbbm());
			}
			lm.add(hm);
		}
		if(updateBatch("xgSckbhsdTH1", lm)>0)return true;
		else return false;
	}
	
	@Override
	public List<Sckbhsd> selectSckShwqgz(Sckbhsd wqgz) {
		return queryList("selectSckShbhsd",wqgz);
	}

	@Override
	public int selectWqgzShCount(Sckbhsd wqgz) {
		return queryOne("selectSckbhsdShCount",wqgz);
	}

	@Override
	public List<Sckbhsd> selectSckSdwqgz(Sckbhsd wqgz) {
		return queryList("selectSckSdbhsd",wqgz);
	}

	@Override
	public int selectWqgzSdCount(Sckbhsd wqgz) {
		return queryOne("selectSckbhsdSdCount",wqgz);
	}
	
	@Override
	public boolean xgSckbhsdShzt(String delstr,Sckbhsd wqgz,String tbbmbm,String nf) {
		String[] strs = delstr.split(",");
		String[] tbbmbms=tbbmbm.split(",");
		String[] nfs=nf.split(",");
		lm=new ArrayList<Map<String,Object>>();
		List<Plan_wqgz> list=new ArrayList<Plan_wqgz>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_shbm", wqgz.getSck_shbm());
			lm.add(hm);
			Plan_wqgz w=new Plan_wqgz();
			w.setSckid(strs[i]);
			w.setSbnf(nfs[i]);
			String tbStr=tbbmbms[i];
			if (tbStr.substring(tbStr.length()-2).equals("00")) {tbStr=tbStr.substring(0, tbStr.length()-2);}
			if (tbStr.substring(tbStr.length()-2).equals("00")) {tbStr=tbStr.substring(0, tbStr.length()-2);}
			w.setJh_sbthcd(String.valueOf(tbStr.length()));//设置计划库的上报长度标识字段Jh_sbthcd--为填报单位编码长度
			list.add(w);
		}
//		boolean insert = insertBatch("lrjhSckbhsd", list)==list.size();
		return this.updateBatch("xgSckbhsdShzt", lm)==lm.size()?true:false;
	}

	
	@Override
	public boolean xgSckbhsdSdzt(String delstr,Sckbhsd wqgz,String tbbmbm,String nf) {
//		String[] strs = delstr.split(",");
//		String[] tbbmbms=tbbmbm.split(",");
//		String[] nfs=nf.split(",");
		if (delstr!=null&&!delstr.equals("")
				&&delstr.equals("nc")) {
			wqgz.setXtType("and substr(sck_lxbm,1,1) not in('G','S')");
		}else {
			wqgz.setXtType("and substr(sck_lxbm,1,1) in('G','S')");
		}
		List<Sckbhsd> wsds=queryList("selectBhsdWsd",wqgz);
		lm=new ArrayList<Map<String,Object>>();
		List<Plan_bhsd> list=new ArrayList<Plan_bhsd>();
		for (int i = 0; i < wsds.size(); i++) {
			Sckbhsd wsd=wsds.get(i);
			hm=new HashMap<String, Object>();
			hm.put("sckid", wsd.getSckid());
			lm.add(hm);
			Plan_bhsd w=new Plan_bhsd();
			w.setSckid(wsd.getSckid());
			w.setSbnf(wsd.getSck_xmnf());
			String tbStr=wsd.getTbbmbm();
			if (tbStr.substring(tbStr.length()-2).equals("00")) {tbStr=tbStr.substring(0, tbStr.length()-2);}
			if (tbStr.substring(tbStr.length()-2).equals("00")) {tbStr=tbStr.substring(0, tbStr.length()-2);}
			w.setJh_sbthcd(String.valueOf(tbStr.length()));//设置计划库的上报长度标识字段Jh_sbthcd--为填报单位编码长度
			list.add(w);
		}
		boolean insert = insertBatch("lrjhSckbhsd", list)==list.size();
		return this.updateBatch("xgSckbhsdSdzt", lm)==lm.size()?true:false;
	}
	
	@Override
	public List<SjbbMessage> exportExcel_wqgz_scgl(Sckbhsd wqgz) {
		return this.queryList("exportExcel_bhsd_scgl",wqgz);
	}
	@Override
	public List<SjbbMessage> exportExcel_wqgz_scsh(Sckbhsd wqgz) {
		return this.queryList("exportExcel_bhsd_scsh",wqgz);
	}
	@Override
	public List<SjbbMessage> exportExcel_wqgz_scsd(Sckbhsd wqgz) {
		return this.queryList("exportExcel_bhsd_scsd",wqgz);
	}
	@Override
	public List<SjbbMessage> insertToSheet(Map map) {
		return this.queryList("insertToSheet",map);
	}

	@Override
	public boolean importWqgz_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			map.put("scbmbm", tbbmbm);
			map.put("sck_sbthcd", sbthcd);
			if(map.get("11").length()!=4){
				map.put("11", map.get("11").substring(0, 4));
			}else{
				map.put("11", map.get("11"));
			}
		}
		return this.insertBatch("importBhsd_sc", list)==list.size()?true:false;
	}

	@Override
	public boolean bzWqgz(Sckbhsd wqgz) {
		int count = (Integer)queryOne("bzWqgz", wqgz);
		if(count<1) return true;
		else return false;
	}

	@Override
	public boolean lrjhSckbhsd(String delstr,String nf,String jh_sbthcd) {
		String[] strs = delstr.split(",");
		String[] jh_sbthcds=jh_sbthcd.split(",");
		List<Plan_wqgz> l = new ArrayList<Plan_wqgz>();
		for (int i = 0; i < strs.length; i++) {
			Plan_wqgz item=new Plan_wqgz();
			item.setSckid(strs[i]);
			item.setJh_sbthcd(jh_sbthcds[i]);
			item.setSbnf(nf);
			l.add(item);
		}
		return insertBatch("lrjhSckbhsd", l)==l.size()?true:false;
	}

	@Override
	public boolean xglrjhSckbhsd(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		return insertBatch("xglrjhSckbhsd", list)==list.size()?true:false;
	}

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1) {
		Sckbhsd wq = new Sckbhsd();
		String daoRu="";
		String once="";
		String bz="";
		for (Iterator<Map<String, String>> iterator = data.iterator(); iterator.hasNext();) {
			Map<String, String> map = (Map<String, String>) iterator.next();
			wq.setGydwbm(tbbmbm);
			wq.setSddm(map.get("0"));
			wq.setLxbm(map.get("3"));
			wq.setSdzxzh(map.get("2"));
			wq.setSck_sddm(map.get("0"));
			wq.setSck_lxbm(map.get("3"));
			wq.setSck_sdzxzh(map.get("2"));
			wq.setSck_xmnf(map.get("11"));
			if(queryList("daoRubhsdsh", wq).size()>0){
				int c = (Integer)queryOne("onceSckbhsd", wq);
				if(c>0){
					once+=map.get("0")+"   ";
				}
			}else{
				daoRu+=map.get("0")+"   ";
			}
		}
		if(daoRu==""){
			if(once==""){
					return "Sckbhsd_ok";
			}else {
				return "&nbsp;隧道代码为</br>"+once+"的项目已添加，请勿重复添加！";
			}
		}else {
			return "&nbsp;无隧道代码为</br>"+daoRu+"的项目或此项目不属于您的管理范围！";
		}
	}

	@Override
	public boolean onceSckbhsd(Sckbhsd wqgz) {
		int count = (Integer)queryOne("onceSckbhsd", wqgz);
		if(count==0) return true;
		else return false;
	}

	@Override
	public List<Sckbhsd> lrjhWqgz(Sckbhsd wqgz) {
		return queryList("lrjhWqgz",wqgz);
	}

	@Override
	public int lrjhWqgzCount(Sckbhsd wqgz) {
		return queryOne("lrjhWqgzCount",wqgz);
	}


}
