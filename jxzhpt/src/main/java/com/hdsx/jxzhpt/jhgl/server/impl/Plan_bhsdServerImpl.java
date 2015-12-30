package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_bhsd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_bhsdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckbhsd;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckbhsd;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

@Service
public class Plan_bhsdServerImpl extends BaseOperate implements Plan_bhsdServer {
	private Plan_abgcServer abgc;
	private Bzbz bz;
	private ArrayList<String> list;
	private Map<String, Object> hm;
	private List<Map<String,Object>> lm;
	
	public Plan_bhsdServerImpl() {
		super("plan_bhsd","jdbc");
	}

	@Override
	public List<Plan_bhsd> queryWqgzList(int page, int rows, Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryBhsdList",params);
	}

	@Override
	public int queryWqgzCount(Plan_bhsd jh, Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryBhsdCount",params);
	}

	@Override
	public Plan_bhsd queryWqgzById(String id) {
		return queryOne("queryBhsdById",id);
	}

	@Override
	public List<TreeNode> queryWqgzNfs() {
		return queryList("queryBhsdNfs");
	}

	@Override
	public List<SjbbMessage> insertToSheet(Map map) {
		return this.queryList("insertToSheet",map);
	}

	@Override
	public List<SjbbMessage> exportExcel_jh(Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh",params);
	}
	
	@Override
	public List<SjbbMessage> exportExcel_jh_sh(Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh_sh",params);
	}
	
	@Override
	public List<SjbbMessage> exportExcel_jh_sd(Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh_sd",params);
	}
	
	@Override
	public List<SjbbMessage> exportExcel_jh_tz(Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh_tz",params);
	}
	
	public boolean dropWqgzById(String id) {
		String [] ids=id.split(",");
		List<String> idlist=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			idlist.add(ids[i]);
		}
		return deleteBatch("dropBhsdById",idlist)==idlist.size();
	}

	@Override
	public int editWqgzById(Plan_bhsd jh) {
		return update("editBhsdById", jh);
	}

	@Override
	public boolean importWqgz_jh(List<Map> data) {
		abgc =new Plan_abgcServerImpl();
		bz= new Bzbz();
		for (Map map : data) {
			bz.setLx(map.get("7").toString());
			bz.setXmlx("危桥");
			Bzbz lwbz = abgc.lwBzbz(bz);
			Plan_bhsd wqgz = (Plan_bhsd)queryOne("queryjckbhsd", map.get("4"));
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
		return this.insertBatch("importBhsd_jh", data)==data.size()?true:false;
	}
	public boolean editWqgzStatus(Plan_bhsd jh) {
		return update("editBhsdStatus", jh)>0;
	}

	@Override
	public boolean editWqgzBathStatus(String ids,Plan_bhsd jh){
	String [] strs=ids.split(",");
	List<Plan_bhsd> list=new ArrayList<Plan_bhsd>();
	for (int i = 0; i < strs.length; i++) {
		Plan_bhsd wq=new Plan_bhsd();
		wq.setId(strs[i]);
		wq.setSpzt(jh.getSpzt());
		wq.setSpsj(jh.getSpsj());
		wq.setSpbmdm(jh.getSpbmdm());
		list.add(wq);
	}
	return this.updateBatch("xgJhBhsdSp", list)==list.size()?true:false;
	}
	@Override
	public boolean editWqgzBathSdStatus(String ids,Plan_bhsd jh){
	String [] strs=ids.split(",");
	List<Plan_bhsd> list=new ArrayList<Plan_bhsd>();
	for (int i = 0; i < strs.length; i++) {
		Plan_bhsd wq=new Plan_bhsd();
		wq.setId(strs[i]);
		wq.setJh_sdzt(jh.getJh_sdzt());
		list.add(wq);
	}
	return this.updateBatch("xgJhBhsdSd", list)==list.size()?true:false;
	}
	@Override
	public boolean xgJhkWqgzSbzt(String jhids,Plan_bhsd wqgz) {
		String[] strs = jhids.split(",");
		List<Plan_bhsd> lm=new ArrayList<Plan_bhsd>();
		for (int i = 0; i < strs.length; i++) {
			Plan_bhsd wq=new Plan_bhsd();
			wq.setId(strs[i]);
			wq.setSbsj(wqgz.getSbsj());
			wq.setSbbm(wqgz.getSbbm());
			wq.setJh_sbthcd(wqgz.getJh_sbthcd());
			wq.setSbzt(wqgz.getSbzt());
			wq.setJh_thyj(wqgz.getJh_thyj());
			lm.add(wq);
		}
		return this.updateBatch("editBhsdStatus", lm)==lm.size()?true:false;
	}
	
	@Override
	public Plan_bhsd querySumWqgz(Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("querySumBhsd",params);
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
		return insert("insertbhFile", upload)>0;
	}

	@Override
	public Plan_bhsd queryWqgzFjById(String id) {
		return queryOne("queryBhsdFjById", id);
	}

	@Override
	public boolean editWqgzSckxx(Sckbhsd sc) {
		return update("editBhsdSckxx", sc)>0;
	}

	@Override
	public List<Plan_bhsd> queryWqgzByStatus(Plan_bhsd jh, Jckbhsd lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryList("queryBhsdByStatus",param);
	}

	@Override
	public boolean updateStatusBatch(List<Plan_bhsd> splist) {
		return updateBatch("editBhsdStatus", splist)==splist.size();
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
	public List<Plan_bhsd> queryWqgzList(Plan_bhsd jh, Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryBhsdList2",params);
	}

	@Override
	public List<Plan_bhsd> queryWqLs(Jckbhsd lx) {
		return queryList("queryBhLs",lx);
	}

	@Override
	public boolean editZjById(Plan_bhsd jh) {
		return update("editZjById", jh)>0;
	}
	
	@Override
	public boolean xgJhkWqgzTH(String jhIds,Plan_bhsd wqgz) {
		String[] strs = jhIds.split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("jh_thyj", wqgz.getJh_thyj());
			lm.add(hm);
		}
		if(updateBatch("xgJhkBhsdTH", lm)>0) return true;
		else return false;
	}

	@Override
	public boolean tzBhsd(Plan_bhsd jh) {
		int a=update("tzBhsd",jh);
		int b=0;
		Plan_bhsd wq=queryOne("querytzbyid", jh);
		if (wq!=null) {
			b=update("bhsdTzxg", jh);
		}else {
			b=insert("bhsdTztj", jh);
		}
		
		if (a==1&&b==1) {
			if ("0".equals(jh.getTz_type())) {
				int c=delete("bhsdTzqx",jh);
				return c==1;
			}else {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean tzBhsdTh(Plan_bhsd jh) {
		Plan_bhsd bhsd=queryOne("queryBhsdById", jh);
		if (bhsd!=null) {
			delete("dropBhsdById", jh);
		}
		int b=insert("bhsdTzth", jh);
		if (b==1) {
				int c=delete("deleteTzbhsd",jh);
				return c==1;
			}
		return false;
	}
	
	@Override
	public List<Plan_bhsd> queryBhsdListTz(int page, int rows, Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryBhsdListTz",params);
	}

	@Override
	public int queryBhsdCountTz(Plan_bhsd jh, Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryBhsdCountTz",params);
	}
	
	@Override
	public Plan_bhsd querySumBhsdTz(Plan_bhsd jh,Jckbhsd lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("querySumBhsdTz",params);
	}
	
	@Override
	public Plan_bhsd queryBhsdtzById(String id) {
		return queryOne("queryBhsdtzById",id);
	}
}
