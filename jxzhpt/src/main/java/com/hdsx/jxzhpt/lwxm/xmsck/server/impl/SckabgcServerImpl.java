package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckabgcServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
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
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", abgc.getSck_sbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("sbzt", abgc.getSbzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("bzls", abgc.getBzls());
		hm.put("page", abgc.getPage());
		hm.put("rows", abgc.getRows());
		return queryList("selectSckabgc", hm);
	}

	@Override
	public int selectAbgcCount(Sckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", abgc.getSck_sbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("sbzt", abgc.getSbzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("bzls", abgc.getBzls());
		return queryOne("selectSckAbgcCount", hm);
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
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", abgc.getSck_sbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("bzls", abgc.getBzls());
		hm.put("page", abgc.getPage());
		hm.put("rows", abgc.getRows());
		return queryList("selectSckShabgc", hm);
	}

	@Override
	public int selectAbgcShCount(Sckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", abgc.getSck_sbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("bzls", abgc.getBzls());
		return queryOne("selectSckAbgcShCount", hm);
	}

	@Override
	public boolean xgSckAbgcShzt(String delstr,Sckabgc abgc) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_shbm", abgc.getSck_shbm());
			lm.add(hm);
		}
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
	public List<SjbbMessage> exportExcel_abgc_scgl(Sckabgc abgc) {
		return this.queryList("exportExcel_abgc_scgl",abgc);
	}
	@Override
	public List<SjbbMessage> exportExcel_abgc_scsh(Sckabgc abgc) {
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
	public boolean lrjhSckabgc(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		return insertBatch("lrjhSckabgc", list)==list.size()?true:false;
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
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", abgc.getSck_sbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("sbzt", abgc.getSbzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("bzls", abgc.getBzls());
		return queryOne("selSckAbgcCount", hm);
	}

	@Override
	public Sckabgc selSckAbgcShCount(Sckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", abgc.getSck_sbthcd());
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("bzls", abgc.getBzls());
		return queryOne("selSckAbgcShCount", hm);
	}

}
