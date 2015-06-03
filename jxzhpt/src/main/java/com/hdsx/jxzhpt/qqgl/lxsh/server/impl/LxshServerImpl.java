package com.hdsx.jxzhpt.qqgl.lxsh.server.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.server.DbyhServer;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

@Service
public class LxshServerImpl extends BaseOperate implements LxshServer {

	public LxshServerImpl() {
		super("lxsh", "jdbc");
	}

	@Override
	public String selectXmbm(String str) {
		// TODO Auto-generated method stub
		return queryOne("selectXmbm", str);
	}

	@Override
	public Lxsh selectbzcs(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectbzcs", lxsh);
	}

	@Override
	public boolean selectSFCF(Lxsh lxsh) {
		Lxsh l=queryOne("selectSFCF", lxsh);
		if(l==null)
			return true;
		else
		return false;
	}

	@Override
	public boolean insertSjgz(Lxsh lxsh) {
		insert("insertlx", lxsh);
		double bzcs=queryOne("queryMaxbzcs",lxsh);
		lxsh.setBzys(bzcs+"");
		if (insert("insertSjgz", lxsh) > 0) {
			return true;
		} else
			return false;
	}

	@Override
	public List<Lxsh> selectSjgzList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzList", lxsh);
	}

	@Override
	public int selectSjgzListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzListCount", lxsh);
	}

	@Override
	public List<Lxsh> selectSjgzlxList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzlxList",lxsh);
	}

	@Override
	public int selectSjgzlxListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzlxListCount", lxsh);
	}

	@Override
	public boolean sbsjgzSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("sbsjgzSbzt", lm)>0) return true;
		else return false;
	}

	private List<Map<String,Object>> lm;
	private Map<String,Object> hm;
	@Override
	public boolean thSjgzSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("thSjgzSbzt", lm)>0) return true;
		else return false;
	}

	@Override
	public boolean updateSjgz(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		double bzcs=queryOne("queryMaxbzcs",lxsh);
		lxsh.setBzys(bzcs+"");
		if(update("updateSjgz", lxsh)>0){
			return true;
		}
		else
		return false;
	}

	@Override
	public List<Lxsh> selectSjgzshList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzshList", lxsh);
	}

	@Override
	public int selectSjgzshListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzshListCount", lxsh);
	}

	@Override
	public boolean delSjgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delSjgz", lm)>0&&deleteBatch("delSjgzlx", lm)>0) return true;
		else return false;
	}

	@Override
	public boolean shsjgzSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			lm.add(hm);
		}
		if(updateBatch("shsjgzSbzt", lm)>0) return true;
		else return false;
	}

	
}
