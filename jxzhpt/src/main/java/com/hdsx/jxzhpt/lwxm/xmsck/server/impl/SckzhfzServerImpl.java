package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckzhfzServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class SckzhfzServerImpl extends BaseOperate implements SckzhfzServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public SckzhfzServerImpl() {
		super("sckzhfz", "jdbc");
	}

	@Override
	public boolean insertSckzhfz(Sckzhfz zhfz) {
		if(insert("insertSckzhfz", zhfz)>0) return  true;
		else return false;
	}

	@Override
	public List<Sckzhfz> selectSckzhfz(Sckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("sbzt", zhfz.getSbzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("bzls", zhfz.getBzls());
		hm.put("page", zhfz.getPage());
		hm.put("rows", zhfz.getRows());
		return queryList("selectSckzhfz", hm);
	}

	@Override
	public int selectZhfzCount(Sckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("sbzt", zhfz.getSbzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("bzls", zhfz.getBzls());
		return queryOne("selectSckZhfzCount", hm);
	}

	@Override
	public boolean deleteSckZhfz(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteSckZhfz", list)>0) return true;
		else return false;
	}

	@Override
	public boolean updateSckZhfz(Sckzhfz zhfz) {
		if(update("updateSckzhfz", zhfz)>0) return true;
		else return false;
	}

	@Override
	public Sckzhfz selectSckzhfzById(Sckzhfz zhfz) {
		return queryOne("selectSckzhfzById", zhfz);
	}

	@Override
	public boolean xgSckZhfzSbzt(String delstr,Sckzhfz zhfz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_sbbm", zhfz.getSck_sbbm());
			hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgSckZhfzSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public List<Sckzhfz> selectSckShzhfz(Sckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("bzls", zhfz.getBzls());
		hm.put("page", zhfz.getPage());
		hm.put("rows", zhfz.getRows());
		return queryList("selectSckShzhfz", hm);
	}

	@Override
	public int selectZhfzShCount(Sckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("bzls", zhfz.getBzls());
		return queryOne("selectSckZhfzShCount", hm);
	}

	@Override
	public boolean xgSckZhfzShzt(String delstr,Sckzhfz zhfz) {
		String[] strs = delstr.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("sckid", strs[i]);
			hm.put("sck_shbm", zhfz.getSck_shbm());
			lm.add(hm);
		}
		return this.updateBatch("xgSckZhfzShzt", lm)==lm.size()?true:false;
	}
	@Override
	public boolean xgSckZhfzTH(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(updateBatch("xgSckZhfzTH", list)>0)return true;
		else return false;
	}

	@Override
	public List<SjbbMessage> exportExcel_zhfz_scgl(Sckzhfz zhfz) {
		return this.queryList("exportExcel_zhfz_scgl",zhfz);
	}
	@Override
	public List<SjbbMessage> exportExcel_zhfz_scsh(Sckzhfz zhfz) {
		return this.queryList("exportExcel_zhfz_scsh",zhfz);
	}

	@Override
	public List<SjbbMessage> insertToSheet(Map map) {
		return this.queryList("insertToSheet",map);
	}

	@Override
	public boolean importZhfz_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd) {
		for (Map<String, String> map : list) {
			map.put("scbmbm", tbbmbm);
			map.put("sck_sbthcd", sbthcd);
		}
		return this.insertBatch("importZhfz_sc", list)==list.size()?true:false;
	}

	@Override
	public boolean bzZhfz(Sckzhfz zhfz) {
		int count = (Integer)queryOne("bzZhfz", zhfz);
		if(count<1) return true;
		else return false;
	}

	@Override
	public boolean lrjhSckzhfz(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		return insertBatch("lrjhSckzhfz", list)==list.size()?true:false;
	}

	@Override
	public boolean xglrjhSckzhfz(String delstr) {
		String[] strs = delstr.split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		return insertBatch("xglrjhSckzhfz", list)==list.size()?true:false;
	}

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1) {
		Sckzhfz zh = new Sckzhfz();
		String daoRu="";
		String once="";
		String bz="";
		for (Iterator<Map<String, String>> iterator = data.iterator(); iterator.hasNext();) {
			Map<String, String> map = (Map<String, String>) iterator.next();
			zh.setGydwbm(tbbmbm);
			zh.setLxbm(map.get("2"));
			zh.setQdzh(map.get("9"));
			zh.setZdzh(map.get("10"));
			if(queryList("daoRuzhfzsh", zh).size()>0){
				int c = (Integer)queryOne("onceSckZhfz", zh);
				if(c==0){
					int count = (Integer)queryOne("bzZhfz", zh);
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
					return "sckzhfz_ok";
				}else {
					if(data.size()>0){
					importZhfz_sc(data,tbbmbm2,sbthcd1);
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
	public boolean onceSckZhfz(Sckzhfz zhfz) {
		int count = (Integer)queryOne("onceSckZhfz", zhfz);
		if(count==0) return true;
		else return false;
	}

	@Override
	public Sckzhfz selSckZhfzCount(Sckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("sbzt", zhfz.getSbzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("bzls", zhfz.getBzls());
		return queryOne("selSckZhfzCount", hm);
	}

	@Override
	public Sckzhfz selSckZhfzShCount(Sckzhfz zhfz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
		hm.put("gydw", zhfz.getGydw());
		hm.put("xzqhmc", zhfz.getXzqhmc());
		hm.put("lxmc", zhfz.getLxmc());
		hm.put("xmnf", zhfz.getXmnf());
		hm.put("xmtype", zhfz.getXmtype());
		hm.put("shzt", zhfz.getShzt());
		hm.put("lxjsdj", zhfz.getLxjsdj());
		hm.put("lxbm", zhfz.getLxbm());
		hm.put("bzls", zhfz.getBzls());
		return queryOne("selSckZhfzShCount", hm);
	}


}
