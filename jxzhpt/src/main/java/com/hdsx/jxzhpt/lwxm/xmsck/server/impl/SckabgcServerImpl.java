package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckabgcServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
@Service
public class SckabgcServerImpl extends BaseOperate implements SckabgcServer{
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public SckabgcServerImpl() {
		super("sckabgc", "jdbc");
	}

	@Override
	public boolean insertSckabgc(Sckabgc abgc) {
		if(insert("insertSckabgc", abgc)>0) return  true;
		else return false;
	}

	@Override
	public List<Sckabgc> selectSckabgc(Sckabgc abgc) {
		return queryList("selectSckabgc", abgc);
	}

	@Override
	public int selectAbgcCount(Sckabgc abgc) {
		return queryOne("selectSckAbgcCount", abgc);
	}

	@Override
	public boolean deleteSckAbgc(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteSckAbgc", list)>0) return true;
		else return false;
	}
	@Override
	public boolean updateSckabgc(Sckabgc abgc) {
		if(delete("updateSckabgc", abgc)>0) return true;
		else return false;
	}
	@Override
	public Sckabgc selectSckabgcById(Sckabgc abgc) {
		return queryOne("selectSckabgcById", abgc);
	}
	@Override
	public boolean xgSckAbgcSbzt(String delstr,Sckabgc abgc) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_sbbm", abgc.getSck_sbbm());
			hm.put("sck_sbthcd", abgc.getSck_sbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgSckAbgcSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public List<Sckabgc> selectSckShabgc(Sckabgc abgc) {
		return queryList("selectSckShabgc", abgc);
	}

	@Override
	public int selectAbgcShCount(Sckabgc abgc) {
		return queryOne("selectSckAbgcShCount", abgc);
	}

	@Override
	public boolean xgSckAbgcShzt(String delstr,Sckabgc abgc,String nf,String tbbmbm) {
		String[] strs = delstr.split(",");
		String[] nfs=nf.split(",");
		String[] tbbmbms=tbbmbm.split(",");
		lm=new ArrayList<Map<String,Object>>();
		List<Plan_abgc> list=new ArrayList<Plan_abgc>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_shbm", abgc.getSck_shbm());
			lm.add(hm);
			Plan_abgc a=new Plan_abgc();
			a.setSckid(strs[i]);
			a.setJhnf(nfs[i]);
			if(tbbmbms[i].substring(0, 1).equals("1")){
				if(tbbmbms[i].matches("^[0-9]{7}[1-9][0-9]00$") || tbbmbms[i].matches("^[0-9]{7}[0-9][1-9]00$"))
					a.setJh_sbthcd("0");
				else
					//}else if(tbbmbms[i].matches("^[0-9]{9}[0-9][1-9]$") || tbbmbms[i].matches("^[0-9]{9}[1-9][0-9]$")){
						a.setJh_sbthcd("2");
			}else
						a.setJh_sbthcd("2");
			//}
			list.add(a);
		}
		boolean insertBatch = insertBatch("lrjhSckabgc", list)==list.size();
		return this.updateBatch("xgSckAbgcShzt", lm)==lm.size()?true:false;
	}
	@Override
	public boolean xgSckAbgcTH(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(updateBatch("xgSckAbgcTH", list)>0)return true;
		else return false;
	}

	@Override
	public List<Excel_list> exportExcel_abgc_scgl(Sckabgc abgc) {
		return this.queryList("exportExcel_abgc_scgl",abgc);
	}
	@Override
	public List<Excel_list> exportExcel_abgc_scsh(Sckabgc abgc) {
		return this.queryList("exportExcel_abgc_scsh",abgc);
	}

	@Override
	public List<SjbbMessage> insertToSheet(Map map) {
		return this.queryList("insertToSheet",map);
	}

	@Override
	public boolean importAbgc_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd){
			for (Map<String, String> map : list) {
				map.put("scbmbm", tbbmbm);
				map.put("sck_sbthcd", sbthcd);
				}
		return this.insertBatch("importAbgc_sc", list)==list.size()?true:false;
	}

	@Override
	public boolean bzAbgc(Sckabgc abgc) {
		int count = (Integer)queryOne("bzAbgc", abgc);
		if(count<1) return true;
		else return false;
	}

	@Override
	public boolean lrjhSckabgc(String delstr,String nf,String jh_sbthcd) {
		String[] strs = delstr.split(",");
		String[] jh_sbthcds=jh_sbthcd.split(",");
		List<Plan_abgc> l = new ArrayList<Plan_abgc>();
		for (int i = 0; i < strs.length; i++) {
			Plan_abgc item =new Plan_abgc();
			item.setSckid(strs[i]);
			item.setJh_sbthcd(jh_sbthcds[i]);
			item.setJhnf(nf);
			l.add(item);
		}
		return insertBatch("lrjhSckabgc", l)==l.size()?true:false;
	}

	@Override
	public boolean xglrjhSckabgc(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		return insertBatch("xglrjhSckabgc", list)==list.size()?true:false;
	}

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1) {
		Sckabgc ab = new Sckabgc();
		String daoRu="";
		String once="";
		String bz="";
		for (Iterator<Map<String, String>> iterator = data.iterator(); iterator.hasNext();) {
			Map<String, String> map = (Map<String, String>) iterator.next();
			ab.setGydwbm(tbbmbm);
			ab.setLxbm(map.get("2"));
			ab.setQdzh(map.get("9"));
			ab.setZdzh(map.get("10"));
			if(queryList("daoRuabgcsh", ab).size()>0){
				int c = (Integer)queryOne("onceSckAbgc", ab);
				if(c==0){
					int count = (Integer)queryOne("bzAbgc", ab);
					if(count>0){
						bz+=map.get("2")+"   ";
						iterator.remove();
					}
					}else{
						once+=map.get("2")+"   ";
					}
				}else{
					daoRu+=map.get("2")+"   ";
				}
			}
		if(daoRu==""){
			if(once==""){
				if(bz==""){
					return "sckabgc_ok";
				}else {
					if(data.size()>0){
					importAbgc_sc(data,tbbmbm2,sbthcd1);
					}
					return "&nbsp;路线编码为</br>"+bz+"的项目有补助历史，未导入，若想保存请手动添加！";
				}
			}else {
				return "&nbsp;路线编码为</br>"+once+"的项目已添加，请勿重复添加！";
			}
		}else {
			return "&nbsp;无路线编码为</br>"+daoRu+"的项目或此项目不属于您的管理范围！";
		}
	}

	@Override
	public boolean onceSckAbgc(Sckabgc abgc) {
		int count = (Integer)queryOne("onceSckAbgc", abgc);
		if(count==0) return true;
		else return false;
	}

	@Override
	public Sckabgc selSckAbgcCount(Sckabgc abgc) {
		return queryOne("selSckAbgcCount", abgc);
	}

	@Override
	public Sckabgc selSckAbgcShCount(Sckabgc abgc) {
		return queryOne("selSckAbgcShCount", abgc);
	}

	@Override
	public List<Sckabgc> lrjhAbgc(Sckabgc abgc) {
		return queryList("lrjhAbgc",abgc);
	}

	@Override
	public int lrjhAbgcCount(Sckabgc abgc) {
		return queryOne("lrjhAbgcCount",abgc);
	}

}
