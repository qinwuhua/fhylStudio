package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
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
		params.put("lx", lx);
		return queryList("queryShuihList",params);
	}
	
	@Override
	public List<Plan_shuih> queryShuihList(Plan_shuih jh,Plan_lx_shuih lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryShuihList2",params);
	}

	@Override
	public Plan_shuih queryShuihById(String id) {
		return queryOne("queryShuihById", id);
	}

	@Override
	public int queryShuihCount(Plan_shuih jh, Plan_lx_shuih lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
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
	public Plan_shuih querySumShuih(Plan_shuih jh,Plan_lx_shuih lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryOne("querySumShuih", param);
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
	public boolean insertShuihFile(Plan_upload jh) {
		return update("insertShuihFile", jh)>0;
	}

	@Override
	public Plan_shuih queryShuihwjById(String id) {
		return queryOne("queryShuihwjById", id);
	}

	@Override
	public int queryJhExist(Plan_lx_shuih shuih) {
		return queryOne("queryJhExist", shuih);
	}

	@Override
	public String queryTsdqByXzqh(String xzqhdm) {
		return queryOne("queryTsdqByXzqh",xzqhdm);
	}

	@Override
	public Plan_flwbzbz queryBzzj(Plan_flwbzbz flw) {
		return queryOne("queryBzzj", flw);
	}
	
	@Override
	public List<TreeNode> queryJhktj(String nf) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("nf", nf);
		return queryList("queryTjJeAndSl",param);
	}

	@Override
	public List<TreeNode> queryJhktj2(String xzqhdm, String nf, String end) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("xzqhdm", xzqhdm);
		param.put("start", nf);
		param.put("end", end);
		return queryList("queryJhktj2",param);
	}

	@Override
	public double queryJhktj2(String xzqhdm, String year) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("xzqhdm", xzqhdm);
		param.put("nf", year);
		String result = queryOne("queryJhktjt2",param);
		return result==null ? 0 : new Double(queryOne("queryJhktjt2",param).toString()).doubleValue();
	}

	@Override
	public List<TreeNode> queryJhktjt3(String xzqhdm, String nf, String end) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("xzqhdm", xzqhdm);
		param.put("start", nf);
		param.put("end", end);
		return queryList("queryJhktjt3",param);
	}

	@Override
	public List<TreeNode> queryGcktj(String xzqhdm,String nf) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("xzqhdm", xzqhdm);
		param.put("nf", nf);
		return queryList("queryGcktj",param);
	}

	@Override
	public TreeNode queryGcktjt(String xzqhdm) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("xzqhdm", xzqhdm);
		return queryOne("queryGcktjt",param);
	}

	@Override
	public TreeNode queryGcktj2(String xzqhdm, String nf) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("xzqhdm", xzqhdm);
		param.put("nf", nf);
		return queryOne("queryGcktj2",param);
	}

	@Override
	public boolean insertShuihLx(Plan_lx_shuih lx) {
		return insert("insertShuihLx", lx)>0;
	}

	@Override
	public boolean insertShuihJh(Plan_shuih jh) {
		return insert("insertShuihJh", jh)>0;
	}

	@Override
	public List<Plan_lx_shuih> shAutoCompleteLxbm(Plan_lx_shuih lx) {
		return queryList("shAutoCompleteLxbm",lx);
	}

	@Override
	public boolean editZjById(Plan_shuih jh) {
		return update("editZjById", jh)>0;
	}

	@Override
	public boolean editShuihStatus(List<Plan_shuih> list) {
		return updateBatch("editShuihStatusBatch", list)==list.size();
	}
}
