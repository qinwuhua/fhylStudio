package com.hdsx.jxzhpt.jhgl.server.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.views.xslt.ArrayAdapter;
import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
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
		params.put("lx", plan_lx_gcgj);
		List<Plan_gcgj> queryList = queryList("queryGcgjList",params);
		return queryList;
	}
	
	@Override
	public List<Plan_gcgj> queryGcgjList(Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", plan_gcgj);
		params.put("lx", plan_lx_gcgj);
		List<Plan_gcgj> queryList = queryList("queryGcgjList2",params);
		return queryList;
	}

	@Override
	public int queryGcgjCount(Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", plan_gcgj);
		params.put("lx", plan_lx_gcgj);
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
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropGcgjById",list)==list.size();
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
	public Plan_gcgj querySumGcgj(Plan_gcgj jh, Plan_lx_gcgj lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryOne("querySumGcgj", param);
	}

	@Override
	public int queryJlBylx(Plan_lx_gcgj lx) {
		return queryOne("queryJlBylx", lx);
	}

	@Override
	public Plan_lx_gcgj queryGPSBylxbm(Plan_lx_gcgj lx) {
		return queryOne("queryGPSBylxbm2", lx);
	}

	@Override
	public boolean dropGcgjLxByJhid(String id) {
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropGcgjLxByJhid", list)==list.size();
	}

	@Override
	public boolean uploadGcgjFile(Plan_gcgj jh) {
		return update("uploadGcgjFile", jh)>0;
	}

	@Override
	public Plan_gcgj queryGjwjById(String id) {
		return queryOne("queryGjwjById", id);
	}

	@Override
	public int queryJhExist(Plan_lx_gcgj lx) {
		return queryOne("queryJhExist", lx);
	}

	@Override
	public String queryTsdqByXzqh(String xzqh) {
		return queryOne("queryTsdqByXzqh",xzqh);
	}

	@Override
	public Plan_flwbzbz queryBzzj(Plan_flwbzbz flwbzbz) {
		return queryOne("queryBzzj", flwbzbz);
	}

	@Override
	public boolean insertPlan_lx_Gcgj(Plan_lx_gcgj lx) {
		return insert("insertPlan_lx_Gcgj", lx)>0;
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
	public List<TreeNode> queryJhktj3(String xmlx, String nf, String end) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("xmlx", xmlx);
		param.put("start", nf);
		param.put("end", end);
		return queryList("queryJhktj3",param);
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
	public boolean insertGcgjJh(Plan_gcgj jh) {
		return insert("insertGcgjJh", jh)>0;
	}

	@Override
	public List<Plan_lx_gcgj> gjAutoCompleteLxbm(Plan_lx_gcgj lx) {
		return queryList("gjAutoCompleteLxbm",lx);
	}

	@Override
	public boolean editZjById(Plan_gcgj jh) {
		return update("editZjById", jh)>0;
	}
}