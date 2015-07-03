package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
@Service
public class JckwqgzsjServerImpl extends BaseOperate implements JckwqgzsjServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public JckwqgzsjServerImpl() {
		super("jckwqgzsj", "jdbc");
	}

	@Override
	public boolean deleteqlzpbyxmbm(Jckwqgzsj jckwqgzsj) {
		if(delete("deleteqlzpbyxmbm",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public boolean insertWqgz(Jckwqgzsj jckwqgzsj) {
		if(insert("insertWqgz",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public List<Jckwqgzsj> selectWqgzList(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzList",jckwqgzsj);
	}

	@Override
	public int selectWqgzCount(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzCount", jckwqgzsj);
	}

	@Override
	public boolean deleteWqgzsjById(Jckwqgzsj jckwqgzsj) {
			String[] strs = jckwqgzsj.getId().split(",");
			list = new ArrayList<String>();
			for (int i = 0; i < strs.length; i++) {
				Jckwqgzsj jckwqgzsj1=new Jckwqgzsj();
				jckwqgzsj1.setId(strs[i]);
				delete("deleteqlzpbyxmbm",jckwqgzsj1);
				list.add(strs[i]);
			}
			if(deleteBatch("deleteWqgzsjById", list)>0) return true;
			else return false;
		
	}

	@Override
	public boolean getwqgzZP(Jckwqgzsj jckwqgzsj) {
		List<Plan_upload> pl1=queryList("getwqgzZP1", jckwqgzsj);
		List<Plan_upload> pl2=queryList("getwqgzZP2", jckwqgzsj);
		if(pl1.size()>0&&pl2.size()>0){
			return true;
		}else
		return false;
	}

	@Override
	public boolean xgJckWqgzSbzt(Jckwqgzsj jckwqgzsj) {
		String[] strs = jckwqgzsj.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbbm", jckwqgzsj.getSbbm());
			hm.put("sbthcd", jckwqgzsj.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("xgJckwqgzSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public boolean shtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("shtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public boolean shbtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("shbtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public List<Jckwqgzsj> selectJckShwqgz(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectJckShwqgz",jckwqgzsj);
	}

	@Override
	public int selectWqgzShCount(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzShCount", jckwqgzsj);
	}

	@Override
	public boolean sjshtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("sjshtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public boolean sjshbtyWqgzsjById(Jckwqgzsj jckwqgzsj) {
		if(update("sjshbtyWqgzsjById", jckwqgzsj)>0) return true;
		else return false;
	}

	@Override
	public boolean updateWqgz(Jckwqgzsj jckwqgzsj) {
		if(update("updateWqgz", jckwqgzsj)>0)
			return true;
		return false;
	}
}
