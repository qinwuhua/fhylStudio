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

}
