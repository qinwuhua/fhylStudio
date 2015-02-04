package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_zhfzServerImpl extends BaseOperate  implements Plan_zhfzServer {

	public Plan_zhfzServerImpl() {
		super("plan_zhfz", "jdbc");
	}

	@Override
	public List<Plan_zhfz> queryZhfzList(int page, int rows, Plan_zhfz jh,Jckzhfz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		List<Plan_zhfz> queryList = queryList("queryZhfzList",params);
		return queryList;
	}

	@Override
	public int queryZhfzCount(Plan_zhfz jh, Jckzhfz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryZhfzCount", params);
	}

	@Override
	public Plan_zhfz queryZhfaById(String id) {
		return queryOne("queryZhfzById", id);
	}

	@Override
	public List<TreeNode> queryZhfaNfs() {
		return queryList("queryZhfzNfs");
	}

	@Override
	public List<SjbbMessage> insertToSheet(Map map) {
		return this.queryList("insertToSheet",map);
	}

	@Override
	public List<SjbbMessage> exportExcel_jh(Plan_zhfz jh,Jckzhfz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh",params);
	}
	public boolean dropZhfzById(String id) {
		String [] ids=id.split(",");
		List<String> idlist=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			idlist.add(ids[i]);
		}
		return deleteBatch("dropZhfzById",idlist)==idlist.size();
	}

	@Override
	public int editZhfzById(Plan_zhfz jh) {
		return update("editZhfzById",jh);
	}

	@Override
	public boolean importZhfz_jh(List<Map> data) {
		return this.insertBatch("importZhfz_jh", data)==data.size()?true:false;
		//System.out.println("---------------\n"+data);
		//return this.update("importZhfz_jh", data)==data.size()?true:false;
	}
	public boolean editZhfzStatus(Plan_zhfz jh) {
		return update("editZhfzStatus", jh)>0;
	}

	@Override
	public Plan_zhfz querySumZhfz() {
		return queryOne("querySumZhfz", null);
	}

	@Override
	public boolean updateLrztBySckid(String sckid) {
		String [] ids=sckid.split(",");
		List<String> idlist=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			idlist.add(ids[i]);
		}
		return updateBatch("updateLrztBySckid", idlist)==idlist.size();
	}

}
