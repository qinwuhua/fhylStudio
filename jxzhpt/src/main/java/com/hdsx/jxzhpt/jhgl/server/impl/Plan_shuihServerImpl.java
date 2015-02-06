package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_shuihServerImpl extends BaseOperate implements Plan_shuihServer {

	public Plan_shuihServerImpl() {
		super("plan_shuih", "jdbc");
	}

	@Override
	public List<Plan_shuih> queryShuihList(int page, int rows, Plan_shuih jh,Plan_lx_shuih lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("l", lx);
		return queryList("queryShuihList",params);
	}

	@Override
	public Plan_shuih queryShuihById(String id) {
		return queryOne("queryShuihById", id);
	}

	@Override
	public int queryShuihCount(Plan_shuih jh, Plan_lx_shuih lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("l", lx);
		return queryOne("queryShuihCount", params);
	}

	@Override
	public List<TreeNode> queryShuihNfs() {
		return queryList("queryShuihNfs");
	}

	@Override
	public boolean dropShuihById(String id) {
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropShuihById",list)==list.size();
	}

	@Override
	public int editShuihById(Plan_shuih jh) {
		return update("editShuihById", jh);
	}

	@Override
	public boolean editShuihStatus(Plan_shuih jh) {
		return update("editShuihStatus", jh)>0;
	}

	@Override
	public boolean insertShuih_Jh(List<Map> jh) {
		return insertBatch("insertShuih_Jh", jh)==jh.size();
	}

	@Override
	public boolean insertShuih_Lx(List<Map> lx) {
		return insertBatch("insertShuih_Lx", lx)==lx.size();
	}

	@Override
	public Plan_lx_shuih queryGPSBylxbm(Plan_lx_shuih shuih){
		return queryOne("queryGPSBylxbm",shuih);
	}

	@Override
	public Plan_shuih querySumShuih() {
		return queryOne("querySumShuih", null);
	}

	@Override
	public int queryJlBylx(Plan_lx_shuih shuih) {
		return queryOne("queryJlBylx", shuih);
	}

	@Override
	public boolean dropShuihLxByJhid(String id) {
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropShuihLxByJhid", list)==list.size();
	}

	@Override
	public boolean uploadShuihFile(Plan_shuih jh) {
		return update("uploadShuihFile", jh)>0;
	}
}
