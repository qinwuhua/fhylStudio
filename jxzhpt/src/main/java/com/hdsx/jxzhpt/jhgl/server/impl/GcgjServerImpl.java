package com.hdsx.jxzhpt.jhgl.server.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

@Service
public class GcgjServerImpl extends BaseOperate implements Plan_gcgjServer {

	public GcgjServerImpl() {
		super("plan_gcgj", "jdbc");
	}

	@Override
	public List<Plan_gcgj> queryGcgjList(int page,int row,Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", row);
		params.put("jh", plan_gcgj);
		params.put("l", plan_lx_gcgj);
		List<Plan_gcgj> queryList = queryList("queryGcgjList",params);
		return queryList;
	}

	@Override
	public int queryGcgjCount(Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", plan_gcgj);
		params.put("l", plan_lx_gcgj);
		return queryOne("queryGcgjCount", params);
	}

	@Override
	public Plan_gcgj queryGcgjById(String id) {
		return queryOne("queryGcgjById", id);
	}

	@Override
	public List<TreeNode> queryGcgjNfs() {
		return queryList("queryGcgjNfs");
	}
	
	public boolean dropGcgjById(String id){
		return delete("dropGcgjById",id)>0;
	}

	@Override
	public int editGcgjById(Plan_gcgj jh) {
		return update("editGcgjById", jh);
	}

	@Override
	public boolean editGcgjStatus(Plan_gcgj jh) {
		return update("editGcgjStatus",jh)>0;
	}

	@Override
	public boolean insertGcgj_jh(List<Map> jh) {
		return insertBatch("insertGcgj_jh", jh)==jh.size();
	}

	@Override
	public boolean insertGcgj_lx(List<Map> lx) {
		return insertBatch("insertGcgj_lx", lx)==lx.size();
	}

	@Override
	public int queryGPSBylxbm1(Plan_lx_gcgj lx) {
		return queryOne("queryGPSBylxbm", lx);
	}

	@Override
	public Plan_gcgj querySumGcgj() {
		return queryOne("querySumGcgj", null);
	}

	@Override
	public int queryJlBylx(Plan_lx_gcgj lx) {
		return queryOne("queryJlBylx", lx);
	}

	@Override
	public Plan_lx_gcgj queryGPSBylxbm(Plan_lx_gcgj lx) {
		return queryOne("queryGPSBylxbm2", lx);
	}
}
