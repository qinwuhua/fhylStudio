package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_yhdzx;
import com.hdsx.jxzhpt.jhgl.server.Plan_yhdzxServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_yhdzxServerImpl extends BaseOperate implements Plan_yhdzxServer {
	public Plan_yhdzxServerImpl() {
		super("plan_yhdzx", "jdbc");
	}
	
	@Override
	public List<Plan_yhdzx> queryYhdzxList(int page,int rows,Plan_yhdzx jh, Plan_lx_yhdzx lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryYhdzxList",params);
	}

	@Override
	public int queryYhdzxCount(Plan_yhdzx jh, Plan_lx_yhdzx lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryYhdzxCount", params);
	}

	@Override
	public List<TreeNode> queryYhdzxNfs() {
		return queryList("queryYhdzxNfs");
	}

	@Override
	public boolean dropYhdzxById(String id) {
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropYhdzxById",list)==list.size();
	}

	@Override
	public boolean editYhdzxById(Plan_yhdzx jh,Plan_lx_yhdzx lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return update("editYhdzxById", params)>0;
	}

	@Override
	public boolean editYhdzxStatus(Plan_yhdzx jh) {
		return update("editYhdzxStatus", jh)>0;
	}

	@Override
	public boolean insertYhdzx_jh(List<Map> jh) {
		return insertBatch("insertYhdzx_jh", jh)==jh.size();
	}

	@Override
	public boolean insertYhdzx_lx(List<Map> lx) {
		return insertBatch("insertYhdzx_lx", lx)==lx.size();
	}

	@Override
	public Plan_yhdzx queryYhdzxById(String id) {
		return queryOne("queryYhdzxById", id);
	}

	@Override
	public Plan_yhdzx querySumYhdzx(Plan_yhdzx jh,Plan_lx_yhdzx lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("querySumYhdzx", params);
	}

	@Override
	public boolean dropYhdzxLxByJhid(String id) {
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropYhdzxLxByJhid", list)==list.size();
	}
}
