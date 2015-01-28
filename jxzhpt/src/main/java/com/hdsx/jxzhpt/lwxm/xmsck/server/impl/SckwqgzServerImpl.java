package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
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
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", wqgz.getSck_sbthcd());
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
		return queryList("selectSckwqgz",hm);
	}

	@Override
	public int selectWqgzCount(Sckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", wqgz.getSck_sbthcd());
		hm.put("gydw", wqgz.getGydw());
		hm.put("xzqhmc", wqgz.getXzqhmc());
		hm.put("lxmc", wqgz.getLxmc());
		hm.put("qlmc", wqgz.getQlmc());
		hm.put("xmnf", wqgz.getXmnf());
		hm.put("xmtype", wqgz.getXmtype());
		hm.put("sbzt", wqgz.getSbzt());
		hm.put("jsdj", wqgz.getJsdj());
		hm.put("akjfl", wqgz.getAkjfl());
		return queryOne("selectWqgzCount",hm);
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
	public boolean xgSckWqgzTH(Sckwqgz wqgz) {
		if(update("xgSckWqgzTH", wqgz)>0) return true;
		else return false;
	}

	@Override
	public List<Sckwqgz> selectSckShwqgz(Sckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", wqgz.getSck_sbthcd());
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
		return queryList("selectSckShwqgz",hm);
	}

	@Override
	public int selectWqgzShCount(Sckwqgz wqgz) {
		hm=new HashMap<String, Object>();
		hm.put("sck_sbthcd", wqgz.getSck_sbthcd());
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
	public boolean xgSckWqgzShzt(Sckwqgz wqgz) {
		if(update("xgSckWqgzShzt", wqgz)>0) return true;
		else return false;
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
	public boolean lrjhSckwqgz(Sckwqgz wqgz) {
		if(update("lrjhSckwqgz", wqgz)>0) return true;
		else return false;
	}

	@Override
	public boolean xglrjhSckwqgz(Sckwqgz wqgz) {
		if(update("xglrjhSckwqgz", wqgz)>0) return true;
		else return false;
	}

	@Override
	public String yanZhen(List<Map<String, String>> data, String tbbmbm) {
		Sckwqgz wq = new Sckwqgz();
		for (Map<String, String> map : data) {
			wq.setGydwbm(tbbmbm);
			wq.setQlbh(map.get("0"));
			wq.setLxbm(map.get("3"));
			wq.setQlzxzh(map.get("2"));
			if(queryList("daoRuwqgzsh", wq).size()>0){
				int count = (Integer)queryOne("bzWqgz", wq);
				if(count>0) return "项目审查库中已存在该项目，请勿重复添加！";
			}else return "无此项目或此项目不属于您的管理范围！";
		}
		return "sckwqgz_ok";
	}


}
