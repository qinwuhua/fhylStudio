package com.hdsx.jxzhpt.lwxm.xmsck.server.impl;

import java.util.HashMap;
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
		return queryOne("selectZhfzCount", hm);
	}

	@Override
	public boolean deleteSckZhfz(String delstr) {
		if(delete("deleteSckZhfz", delstr)>0) return true;
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
		hm=new HashMap<String, Object>();
		hm.put("delstr", delstr);
		hm.put("sck_sbbm", zhfz.getSck_sbbm());
		hm.put("sck_sbthcd", zhfz.getSck_sbthcd());
		if(update("xgSckZhfzSbzt", hm)>0) return true;
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
		return queryOne("selectZhfzShCount", hm);
	}

	@Override
	public boolean xgSckZhfzShzt(Sckzhfz zhfz) {
		if(update("xgSckZhfzShzt", zhfz)>0)return true;
		else return false;
	}
	@Override
	public boolean xgSckZhfzTH(Sckzhfz zhfz) {
		if(update("xgSckZhfzTH", zhfz)>0)return true;
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
	public List<SjbbMessage> insertToSheet(String xzqhdm) {
		return this.queryList("insertToSheet",xzqhdm);
	}

	@Override
	public boolean importZhfz_sc(List<Map> list) {System.out.println(list);
		return this.insertBatch("importZhfz_sc", list)==list.size()?true:false;
	}

	@Override
	public boolean bzZhfz(Sckzhfz zhfz) {
		int count = (Integer)queryOne("bzZhfz", zhfz);
		if(count<1) return true;
		else return false;
	}


}
