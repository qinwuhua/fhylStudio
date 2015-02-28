package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
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

	@Override
	public boolean updateGkbg(Plan_zhfz jh) {
		return update("updateGkbg", jh)>0;
	}
	@Override
	public boolean updateSjsgt(Plan_zhfz jh) {
		return update("updateSjsgt", jh)>0;
	}

	@Override
	public Plan_zhfz queryZhfzFjById(String id) {
		return queryOne("queryZhfzFjById", id);
	}

}
