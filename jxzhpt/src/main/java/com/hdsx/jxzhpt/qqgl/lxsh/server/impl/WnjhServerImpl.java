package com.hdsx.jxzhpt.qqgl.lxsh.server.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.WnjhServer;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.server.DbyhServer;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

@Service
public class WnjhServerImpl extends BaseOperate implements WnjhServer {
	public WnjhServerImpl() {
		super("wnjh", "jdbc");
	}
	private List<Map<String,Object>> lm;
	private Map<String,Object> hm;
	@Override
	public List<Lxsh> selectGjwnjh(Lxsh lxsh) {
		return queryList("selectGjwnjh", lxsh);
	}
	@Override
	public int selectGjwnjhCount(Lxsh lxsh) {
		return queryOne("selectGjwnjhCount", lxsh);
	}
	@Override
	public List<Lxsh> wnjhGpsroad(Lxsh lxsh) {
		return queryList("wnjhGpsroad", lxsh);
	}
	@Override
	public Lxsh wnjhGpsroad1(Lxsh lxsh) {
		return queryOne("wnjhGpsroad1", lxsh);
	}
	@Override
	public boolean insertGjwnjh(Lxsh lxsh) {
		return insert("insertGjwnjh", lxsh)==1&&insert("insertlx", lxsh)==1;
	}
	@Override
	public boolean insertLmwnjh(Lxsh lxsh) {
		return insert("insertLmwnjh", lxsh)==1&&insert("insertlx", lxsh)==1;
	}
	@Override
	public boolean insertXjwnjh(Lxsh lxsh) {
		return insert("insertXjwnjh", lxsh)==1&&insert("insertlx", lxsh)==1;
	}
	@Override
	public boolean importsjgzwnjh(List<Map> data) {
		if(insertBatch("importsjgzwnjhlx", data)==data.size()&&insertBatch("importsjgzwnjh", data)==data.size())
			return true;
			else return false;
	}
	@Override
	public boolean importlmgzwnjh(List<Map> data) {
		if(insertBatch("importlmgzwnjhlx", data)==data.size()&&insertBatch("importlmgzwnjh", data)==data.size())
			return true;
			else return false;
	}
	@Override
	public boolean importxjwnjh(List<Map> data) {
		if(insertBatch("importxjwnjhlx", data)==data.size()&&insertBatch("importxjwnjh", data)==data.size())
			return true;
			else return false;
	}
	@Override
	public List<Excel_list> querywnjhSjgz(Lxsh lxsh) {
		return queryList("querywnjhSjgz", lxsh);
	}
	@Override
	public List<Excel_list> querywnjhLmgz(Lxsh lxsh) {
		return queryList("querywnjhLmgz", lxsh);
	}
	@Override
	public List<Excel_list> querywnjhXj(Lxsh lxsh) {
		return queryList("querywnjhXj", lxsh);
	}
	@Override
	public boolean delwnjhSjgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delwnjhSjgz", lm)>0&&deleteBatch("delwnjhSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean delwnjhLmgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delwnjhLmgz", lm)>0&&deleteBatch("delwnjhSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean delwnjhXj(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delwnjhXj", lm)>0&&deleteBatch("delwnjhSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public Lxsh cxwnghsjByid(Lxsh lxsh) {
		return queryOne("cxwnghsjByid", lxsh);
	}
	@Override
	public Lxsh cxwnghlmByid(Lxsh lxsh) {
		return queryOne("cxwnghlmByid", lxsh);
	}
	@Override
	public Lxsh cxwnghxjByid(Lxsh lxsh) {
		return queryOne("cxwnghxjByid", lxsh);
	}
	@Override
	public boolean updatewnjhsj(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		if(update("updateSjgz", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	@Override
	public boolean updatewnjhlm(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		if(update("updateLmgz", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	@Override
	public boolean updatewnjhxj(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		if(update("updateXj", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	@Override
	public void updateLx(Lx lx) {
		update("updateLx", lx);
	}
	@Override
	public List<Lxsh> selectlxbyxmid1(Lxsh lxsh) {
		return queryList("selectlxbyxmid1", lxsh);
	}
	@Override
	public Lxsh sfylx(Lxsh lxsh) {
		return queryOne("sfylx", lxsh);
	}
	@Override
	public List<Lxsh> selectSjgzlxList(Lxsh lxsh) {
		return queryList("selectSjgzlxList", lxsh);
	}
	@Override
	public int selectSjgzlxListCount(Lxsh lxsh) {
		return queryOne("selectSjgzlxListCount", lxsh);
	}
	@Override
	public List<Lxsh> selectLmwnjh(Lxsh lxsh) {
		return queryList("selectLmwnjh", lxsh);
	}
	@Override
	public int selectLmwnjhCount(Lxsh lxsh) {
		return queryOne("selectLmwnjhCount", lxsh);
	}
	@Override
	public Lxsh qqglGpszh(Lxsh lxsh) {
		return queryOne("qqglGpszh", lxsh);
	}
	@Override
	public List<Lxsh> selectXjwnjh(Lxsh lxsh) {
		return queryList("selectXjwnjh", lxsh);
	}
	@Override
	public int selectXjwnjhCount(Lxsh lxsh) {
		return queryOne("selectXjwnjhCount", lxsh);
	}
	@Override
	public Lxsh selectGjwnjhcf(Lxsh lxsh) {
		return queryOne("selectGjwnjhcf", lxsh);
	}
	@Override
	public Lxsh selectLmwnjhcf(Lxsh lxsh) {
		return queryOne("selectLmwnjhcf", lxsh);
	}
	@Override
	public Lxsh selectXjwnjhcf(Lxsh lxsh) {
		return queryOne("selectXjwnjhcf", lxsh);
	}
	@Override
	public boolean insertGjlxwnjh(Lxsh lxsh) {
		if("是".equals(lxsh.getLsjl())){
			update("updateGjlsjl", lxsh);
		}
		return insert("insertGjlxwnjh", lxsh)==1;
	}
	@Override
	public boolean updatewnjhsjlx(Lxsh lxsh) {
		return update("updatewnjhsjlx", lxsh)==1;
	}
	@Override
	public boolean deleteWnlx(Lxsh lxsh) {
		return update("deleteWnlx", lxsh)==1;
	}
	@Override
	public Lxsh showgjtj(Lxsh lxsh) {
		return queryOne("showgjtj", lxsh);
	}
	@Override
	public Lxsh showlmtj(Lxsh lxsh) {
		return queryOne("showlmtj", lxsh);
	}
	@Override
	public Lxsh showxjtj(Lxsh lxsh) {
		return queryOne("showxjtj", lxsh);
	}
	

}
