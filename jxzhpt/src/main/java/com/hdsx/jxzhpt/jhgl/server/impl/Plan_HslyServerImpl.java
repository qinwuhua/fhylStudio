package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_hsly;
import com.hdsx.jxzhpt.jhgl.server.Plan_hslyServer;
@Service
public class Plan_HslyServerImpl extends BaseOperate implements Plan_hslyServer {
	public Plan_HslyServerImpl() {
		super("plan_hsly", "jdbc");
	}
	@Override
	public boolean insertHsly(List<Map> list) {
		return insertBatch("insertHsly", list)==list.size();
	}

	@Override
	public List<Plan_hsly> queryHslyList(int page, int rows, Plan_hsly hsly) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("hsly", hsly);
		return queryList("queryHslyList",params);
	}

	@Override
	public int queryHslyCount(Plan_hsly hsly) {
		return queryOne("queryHslyCount", hsly);
	}
	@Override
	public Plan_hsly queryHslyById(String id) {
		return queryOne("queryHslyById", id);
	}
	public List<Plan_hsly> queryHslyZjzj(String id){
		return queryList("queryHslyZjzj",id);
	}
	@Override
	public boolean editHsly(Plan_hsly hsly) {
		return update("editHsly", hsly)>0;
	}
	@Override
	public boolean dropHslyById(String id) {
		return delete("dropHslyById",id)>0;
	}
}
