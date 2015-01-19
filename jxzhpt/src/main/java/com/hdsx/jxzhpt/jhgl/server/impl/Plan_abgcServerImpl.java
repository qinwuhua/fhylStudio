package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_abgcServerImpl extends BaseOperate implements Plan_abgcServer {

	public Plan_abgcServerImpl() {
		super("plan_abgc", "jdbc");
	}
	@Override
	public List<Plan_abgc> queryAbgcList(int page, int rows, Plan_abgc jh,Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryAbgcList",params);
	}

	@Override
	public int queryAbgcCount(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryAbgcCount", params);
	}
	
	public List<TreeNode> queryAbgcNfs(){
		return queryList("queryAbgcNfs");
	}
	@Override
	public Plan_abgc queryAbgcById(String id) {
		return queryOne("queryAbgcById", id);
	}
	
	public boolean dropAbgcById(String id){
		return delete("dropAbgcById",id)>0;
	}
}
