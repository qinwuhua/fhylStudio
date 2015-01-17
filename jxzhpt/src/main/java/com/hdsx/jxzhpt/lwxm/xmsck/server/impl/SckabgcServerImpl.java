package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.HashMap;
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
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("page", abgc.getPage());
		hm.put("rows", abgc.getRows());
		return queryList("selectSckabgc", hm);
	}

	@Override
	public int selectAbgcCount(Sckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		return queryOne("selectAbgcCount", hm);
	}

	@Override
	public boolean deleteSckAbgc(String delstr) {
		if(delete("deleteSckAbgc", delstr)>0) return true;
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
	public boolean xgSckAbgcSbzt(String delstr) {
		if(update("xgSckAbgcSbzt", delstr)>0) return true;
		else return false;
	}

	@Override
	public List<Sckabgc> selectSckShabgc(Sckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		hm.put("page", abgc.getPage());
		hm.put("rows", abgc.getRows());
		return queryList("selectSckShabgc", hm);
	}

	@Override
	public int selectAbgcShCount(Sckabgc abgc) {
		hm=new HashMap<String, Object>();
		hm.put("gydw", abgc.getGydw());
		hm.put("xzqhmc", abgc.getXzqhmc());
		hm.put("lxmc", abgc.getLxmc());
		hm.put("xmnf", abgc.getXmnf());
		hm.put("xmtype", abgc.getXmtype());
		hm.put("shzt", abgc.getShzt());
		hm.put("lxjsdj", abgc.getLxjsdj());
		hm.put("lxbm", abgc.getLxbm());
		return queryOne("selectAbgcShCount", hm);
	}

	@Override
	public boolean xgSckAbgcShzt(Sckabgc abgc) {
		if(update("xgSckAbgcShzt", abgc)>0)return true;
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
	public List<SjbbMessage> insertToSheet() {
		return this.queryList("insertToSheet");
	}

	@Override
	public boolean importAbgc_sc(List<Map> list) {
		return this.insertBatch("importAbgc_sc", list)==list.size()?true:false;
	}



}
