package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_zhfzServerImpl extends BaseOperate  implements Plan_zhfzServer {
	private Plan_abgcServer abgc;
	private Bzbz bz;
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
	public Plan_zhfz queryZhfzById(String id) {
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
	public List<Excel_list> exportExcel_jh(Plan_zhfz jh,Jckzhfz lx) {
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
		abgc =new Plan_abgcServerImpl();
		bz= new Bzbz();
		for (Map map : data) {
			bz.setXmlx("灾害");
			Bzbz lwbz = abgc.lwBzbz(bz);
			double ztz = Double.parseDouble(map.get("17").toString());
			double bl = Double.parseDouble(lwbz.getBl());
			double bzzj=0.0;
			ztz=(ztz*bl*100000+3*100000)/100000;
			bzzj=(Double.parseDouble(map.get("6").toString())*100000*Double.parseDouble(lwbz.getBz())+
					Double.parseDouble(lwbz.getFd())*100000)/100000;
			if(ztz>=bzzj){
			String zj =bzzj+"";
			String zczj=(Double.parseDouble(map.get("17").toString())*100000-bzzj*100000)/100000+"";
				map.put("18", zj);
				map.put("19", zczj);
			}else{
				String zczj=(Double.parseDouble(map.get("17").toString())*100000-ztz*100000)/100000+"";
				String ztz1=ztz+"";
				map.put("18", ztz1);
				map.put("19", zczj);
			}
			if(Double.parseDouble(map.get("17").toString())*100000>=500*100000){
				map.put("20", "是");
			}else{
				map.put("20", "否");
			}
		}
		return this.insertBatch("importZhfz_jh", data)==data.size()?true:false;
	}
	public boolean editZhfzStatus(Plan_zhfz jh) {
		return update("editZhfzStatus", jh)>0;
	}

	@Override
	public Plan_zhfz querySumZhfz(Plan_zhfz jh,Jckzhfz lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryOne("querySumZhfz", param);
	}

	@Override
	public boolean updateLrztBySckid(String id) {
		String [] ids=id.split(",");
		List<String> idlist=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			idlist.add(ids[i]);
			System.out.println("计划ID："+ids[i]);
		}
		return updateBatch("updateLrztBySckid", idlist)==idlist.size();
	}
	
	@Override
	public boolean insertZhFile(Plan_upload upload){
		return insert("insertZhFile",upload)>0;
	}

	@Override
	public Plan_zhfz queryZhfzFjById(String id) {
		return queryOne("queryZhfzFjById", id);
	}

	@Override
	public boolean editZhfzSckBysckid(Sckzhfz sc) {
		return update("editZhfzSckBysckid",sc)>0;
	}

	@Override
	public List<Plan_zhfz> queryZhfzByStatus(Plan_zhfz jh, Jckzhfz lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryList("queryZhfzByStatus",param);
	}

	@Override
	public boolean updateStatusBatch(List<Plan_zhfz> splist) {
		return updateBatch("editZhfzStatus", splist)==splist.size();
	}

	@Override
	public TreeNode queryJcktj(TreeNode treenode) {
		return queryOne("queryJcktj",treenode);
	}

	@Override
	public List<TreeNode> queryJcktj1(String nf) {
		Map<String, String> param=new HashMap<String, String>();
		param.put("nf", nf);
		return queryList("queryJcktj1",param);
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
	public List<Plan_zhfz> queryZhfzList(Plan_zhfz jh, Jckzhfz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		List<Plan_zhfz> queryList = queryList("queryZhfzList2",params);
		return queryList;
	}

	@Override
	public boolean editZjById(Plan_zhfz jh) {
		return update("editZjById", jh)>0;
	}

	@Override
	public List<Object> exportExcelZhfzJhSh(Plan_zhfz jh, Jckzhfz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("exportExcelZhfzJhSh",params);
	}

	@Override
	public boolean updateimportExcelZhfzJhSh(List<Plan_zhfz> list) {
		return (updateBatch("updateimportExcelZhfzJh", list)==list.size() && updateBatch("updateimportExcelZhfzSh", list)==list.size());
	}

}
