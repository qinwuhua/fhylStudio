package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_wqgzServerImpl extends BaseOperate implements Plan_wqgzServer {
	private Plan_abgcServer abgc;
	private Bzbz bz;
	public Plan_wqgzServerImpl() {
		super("plan_wqgz","jdbc");
	}

	@Override
	public List<Plan_wqgz> queryWqgzList(int page, int rows, Plan_wqgz jh,Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryWqgzList",params);
	}

	@Override
	public int queryWqgzCount(Plan_wqgz jh, Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryWqgzCount",params);
	}

	@Override
	public Plan_wqgz queryWqgzById(String id) {
		return queryOne("queryWqgzById",id);
	}

	@Override
	public List<TreeNode> queryWqgzNfs() {
		return queryList("queryWqgzNfs");
	}

	@Override
	public List<SjbbMessage> insertToSheet(Map map) {
		return this.queryList("insertToSheet",map);
	}

	@Override
	public List<Excel_list> exportExcel_jh(Plan_wqgz jh,Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh",params);
	}
	public boolean dropWqgzById(String id) {
		String [] ids=id.split(",");
		List<String> idlist=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			idlist.add(ids[i]);
		}
		updateBatch("qkWqsfjhlist",idlist);
		return deleteBatch("dropWqgzById",idlist)==idlist.size();
	}

	@Override
	public int editWqgzById(Plan_wqgz jh) {
		return update("editWqgzById", jh);
	}

	@Override
	public boolean importWqgz_jh(List<Map> data) {
		abgc =new Plan_abgcServerImpl();
		bz= new Bzbz();
		for (Map map : data) {
			bz.setLx(map.get("7").toString());
			bz.setXmlx("危桥");
			Bzbz lwbz = abgc.lwBzbz(bz);
			Plan_wqgz wqgz = (Plan_wqgz)queryOne("queryJckWqgz", map.get("4"));
			double ztz = Double.parseDouble(map.get("17").toString());
			double bl = Double.parseDouble(lwbz.getBl());
			double bzzj=0.0;
			ztz=(ztz*bl*100000+3*100000)/100000;
			bzzj=(Double.parseDouble(wqgz.getQlqc())*100000*Double.parseDouble(wqgz.getQlkd())*Double.parseDouble(lwbz.getBz())+
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
		return this.insertBatch("importWqgz_jh", data)==data.size()?true:false;
	}
	public boolean editWqgzStatus(Plan_wqgz jh) {
		return update("editWqgzStatus", jh)>0;
	}

	@Override
	public Plan_wqgz querySumWqgz(Plan_wqgz jh,Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("querySumWqgz",params);
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
	
	public boolean insertwqFile(Plan_upload upload){
		return insert("insertwqFile", upload)>0;
	}

	@Override
	public Plan_wqgz queryWqgzFjById(String id) {
		return queryOne("queryWqgzFjById", id);
	}

	@Override
	public boolean editWqgzSckxx(Sckwqgz sc) {
		return update("editWqgzSckxx", sc)>0;
	}

	@Override
	public List<Plan_wqgz> queryWqgzByStatus(Plan_wqgz jh, Jckwqgz lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryList("queryWqgzByStatus",param);
	}

	@Override
	public boolean updateStatusBatch(List<Plan_wqgz> splist) {
		return updateBatch("editWqgzStatus", splist)==splist.size();
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
	public List<Plan_wqgz> queryWqgzList(Plan_wqgz jh, Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryWqgzList2",params);
	}

	@Override
	public List<Plan_wqgz> queryWqLs(Jckwqgz lx) {
		return queryList("queryWqLs",lx);
	}

	@Override
	public boolean editZjById(Plan_wqgz jh) {
		return update("editZjById", jh)>0;
	}

	@Override
	public List<Object> exportExcelWqgzJhSh(Plan_wqgz jh, Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("exportExcelWqgzJhSh",params);
	}

	@Override
	public boolean updateImportWqgzJh(List<Plan_wqgz> list) {
		return (updateBatch("updateImportWqgzJh", list)==list.size() && updateBatch("updateImportWqgzSh", list)==list.size());
	}

	@Override
	public List<Object> queryWqgzList1(Plan_wqgz jh, Jckwqgz lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryWqgzList1",params);
	}
}
