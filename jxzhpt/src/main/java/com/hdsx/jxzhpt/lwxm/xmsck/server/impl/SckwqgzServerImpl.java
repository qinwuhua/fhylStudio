package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckwqgzServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class SckwqgzServerImpl extends BaseOperate implements SckwqgzServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public SckwqgzServerImpl() {
		super("sckwqgz", "jdbc");
	}

	@Override
	public boolean insertSckwqgz(Sckwqgz wqgz) {
		if(insert("insertSckwqgz", wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Sckwqgz> selectSckwqgz(Sckwqgz wqgz) {
		return queryList("selectSckwqgz",wqgz);
	}

	@Override
	public int selectWqgzCount(Sckwqgz wqgz) {
		return queryOne("selectWqgzCount",wqgz);
	}

	@Override
	public boolean deleteSckWqgz(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteSckWqgz", list)>0)return true;		
		else return false;
	}

	@Override
	public boolean updateSckWqgz(Sckwqgz wqgz) {
		if(update("updateSckwqgz", wqgz)>0)return true;
		else return false;
	}

	@Override
	public Sckwqgz selectSckwqgzById(Sckwqgz wqgz) {
		return queryOne("selectSckwqgzById", wqgz);
	}

	@Override
	public boolean xgSckWqgzSbzt(String delstr,Sckwqgz wqgz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_sbbm", wqgz.getSck_sbbm());
			hm.put("sck_sbthcd", wqgz.getSck_sbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgSckWqgzSbzt", lm)>0)return true;
		else return false;
	}
	@Override
	public boolean xgSckWqgzTH(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(updateBatch("xgSckWqgzTH", list)>0)return true;
		else return false;
	}

	@Override
	public List<Sckwqgz> selectSckShwqgz(Sckwqgz wqgz) {
		return queryList("selectSckShwqgz",wqgz);
	}

	@Override
	public int selectWqgzShCount(Sckwqgz wqgz) {
		return queryOne("selectSckWqgzShCount",wqgz);
	}

	@Override
	public boolean xgSckWqgzShzt(String delstr,Sckwqgz wqgz,String tbbmbm,String nf) {
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
//			if(tbbmbms[i].matches("^[0-9]{7}[1-9][0-9]00$") || tbbmbms[i].matches("^[0-9]{7}[0-9][1-9]00$")){
//				w.setJh_sbthcd("0");
//			}else if(tbbmbms[i].matches("^[0-9]{9}[0-9][1-9]$") || tbbmbms[i].matches("^[0-9]{9}[1-9][0-9]$")){
				w.setJh_sbthcd("2");
//			}
			list.add(w);
		}
		boolean insert = insertBatch("lrjhSckwqgz", list)==list.size();
		return this.updateBatch("xgSckWqgzShzt", lm)==lm.size()?true:false;
	}

	@Override
	public List<SjbbMessage> exportExcel_wqgz_scgl(Sckwqgz wqgz) {
		return this.queryList("exportExcel_wqgz_scgl",wqgz);
	}
	@Override
	public List<SjbbMessage> exportExcel_wqgz_scsh(Sckwqgz wqgz) {
		return this.queryList("exportExcel_wqgz_scsh",wqgz);
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
		}
		return this.insertBatch("importWqgz_sc", list)==list.size()?true:false;
	}

	@Override
	public boolean bzWqgz(Sckwqgz wqgz) {
		int count = (Integer)queryOne("bzWqgz", wqgz);
		if(count<1) return true;
		else return false;
	}

	@Override
	public boolean lrjhSckwqgz(String delstr,String nf,String jh_sbthcd) {
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
		return insertBatch("lrjhSckwqgz", l)==l.size()?true:false;
	}

	@Override
	public boolean xglrjhSckwqgz(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		return insertBatch("xglrjhSckwqgz", list)==list.size()?true:false;
	}

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1) {
		Sckwqgz wq = new Sckwqgz();
		String daoRu="";
		String once="";
		String bz="";
		for (Iterator<Map<String, String>> iterator = data.iterator(); iterator.hasNext();) {
			Map<String, String> map = (Map<String, String>) iterator.next();
			wq.setGydwbm(tbbmbm);
			wq.setQlbh(map.get("0"));
			wq.setLxbm(map.get("3"));
			wq.setQlzxzh(map.get("2"));
			if(queryList("daoRuwqgzsh", wq).size()>0){
				int c = (Integer)queryOne("onceSckWqgz", wq);
				if(c==0){
				int count = (Integer)queryOne("bzWqgz", wq);
				if(count>0){
					bz+=map.get("0")+"   ";
					iterator.remove();
				}
				}else{
					once+=map.get("0")+"   ";
				}
			}else{
				daoRu+=map.get("0")+"   ";
			}
		}
		if(daoRu==""){
			if(once==""){
				if(bz==""){
					return "sckwqgz_ok";
				}else {
					if(data.size()>0){
					importWqgz_sc(data,tbbmbm2,sbthcd1);
					}
					return "&nbsp;桥梁编码为</br>"+bz+"的项目有补助历史，未导入，若想保存请手动添加！";
				}
			}else {
				return "&nbsp;桥梁编码为</br>"+once+"的项目已添加，请勿重复添加！";
			}
		}else {
			return "&nbsp;无桥梁编码为</br>"+daoRu+"的项目或此项目不属于您的管理范围！";
		}
	}

	@Override
	public boolean onceSckWqgz(Sckwqgz wqgz) {
		int count = (Integer)queryOne("onceSckWqgz", wqgz);
		if(count==0) return true;
		else return false;
	}

	@Override
	public List<Sckwqgz> lrjhWqgz(Sckwqgz wqgz) {
		return queryList("lrjhWqgz",wqgz);
	}

	@Override
	public int lrjhWqgzCount(Sckwqgz wqgz) {
		return queryOne("lrjhWqgzCount",wqgz);
	}


}
