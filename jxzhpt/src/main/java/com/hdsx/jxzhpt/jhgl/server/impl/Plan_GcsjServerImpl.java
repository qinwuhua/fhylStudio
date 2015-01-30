package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_GcsjServerImpl extends BaseOperate implements Plan_gcsjServer{
	public Plan_GcsjServerImpl() {
		super("plan_gcsj", "jdbc");
	}
	
	@Override
	public List<Plan_gcsj> queryGcsjList(int page,int rows,Plan_gcsj jh, Plan_lx_gcsj lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryGcsjList",params);
	}

	@Override
	public int queryGcsjCount(Plan_gcsj jh, Plan_lx_gcsj lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryGcsjCount", params);
	}

	@Override
	public Plan_gcsj queryGcsjById(String id) {
		return queryOne("queryGcsjById", id);
	}

	@Override
	public List<TreeNode> queryGcsjNfs() {
		return queryList("queryGcsjNfs");
	}

	@Override
	public boolean dropGcsjById(String id) {
		return delete("dropGcsjById", id) > 0;
	}

	@Override
	public int editGcsjById(Plan_gcsj jh) {
		return update("editGcsjById", jh);
	}

	@Override
	public boolean editGcsjStatus(Plan_gcsj jh) {
		System.out.println("升级："+jh.getJh_sbthcd());
		return update("editGcsjStatus", jh)>0;
	}

	@Override
	public boolean insertGcsj_Jh(List<Map> jh) {
		return insertBatch("insertGcsj_Jh", jh)==jh.size();
	}

	@Override
	public boolean insertGcsj_lx(List<Map> lx) {
		return insertBatch("insertGcsj_lx", lx)==lx.size();
	}

	@Override
	public int queryGPSBylxbm(String lxbm) {
		return queryOne("queryGPSBylxbm", lxbm);
	}

}
