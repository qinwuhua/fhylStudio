package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
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
	public List<Plan_gcsj> queryGcsjList(Plan_gcsj jh, Plan_lx_gcsj lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryGcsjList2",params);
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
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropGcsjById", list) ==list.size();
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
	public Plan_lx_gcsj queryGPSBylxbm(Plan_lx_gcsj gcsj){
		return queryOne("queryGPSBylxbm", gcsj);
	}

	@Override
	public Plan_gcsj querySumMessage() {
		return queryOne("querySumMessage", null);
	}

	@Override
	public int queryJlBylx(Plan_lx_gcsj lx) {
		return queryOne("queryJlBylx", lx);
	}

	@Override
	public boolean dropGcsjLxByJhid(String id) {
		String [] ids=id.split(",");
		List<String> list=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			list.add(ids[i]);
		}
		return deleteBatch("dropGcsjLxByJhid", list)==list.size();
	}

	@Override
	public boolean uploadGcsjFile(Plan_gcsj jh) {
		return update("uploadGcsjFile", jh)>0;
	}

	@Override
	public Plan_gcsj queryWjById(String id) {
		return queryOne("queryWjById", id);
	}

	@Override
	public int queryJhExist(Plan_lx_gcsj lx) {
		return queryOne("queryJhExist", lx);
	}

	@Override
	public Plan_flwbzbz queryBzzj(Plan_flwbzbz flw) {
		return queryOne("queryBzzj", flw);
	}

	@Override
	public String queryTsdqByXzqh(String xzqhdm) {
		return queryOne("queryTsdqByXzqh",xzqhdm);
	}

	@Override
	public Plan_gcsj queryGcsjSum(Plan_gcsj jh, Plan_lx_gcsj lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryGcsjSum", params);
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
	public boolean insertGcsj_lx(Plan_lx_gcsj lx) {
		return insert("insertGcsj", lx)>0;
	}

	@Override
	public boolean insertGcsj_Jh(Plan_gcsj jh) {
		return insert("insertGcsjJh", jh)>0;
	}

	@Override
	public List<Plan_gcsj> queryXjls(Plan_lx_gcsj lx) {
		return queryList("queryXjls",lx);
	}

	@Override
	public List<Plan_lx_gcsj> sjAutoCompleteLxbm(Plan_lx_gcsj lx) {
		return queryList("sjAutoCompleteLxbm",lx);
	}
}
