package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;
import java.util.Set;

import org.apache.struts2.views.xslt.ArrayAdapter;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
@Service
public class Plan_abgcServerImpl extends BaseOperate implements Plan_abgcServer {
	private Plan_abgcServer abgc;
	private Bzbz bz;
	public Plan_abgcServerImpl() {
		super("plan_abgc", "jdbc");
	}
	@Override
	public List<Plan_abgc> queryAbgcList(int page, int rows, Plan_abgc jh,Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryAbgcList",params);
	}

	@Override
	public int queryAbgcCount(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryAbgcCount", params);
	}
	
	public List<TreeNode> queryAbgcNfs(){
		return queryList("queryAbgcNfs");
	}
	@Override
	public Plan_abgc queryAbgcById(String id) {
		return queryOne("queryAbgcById", id);
	}
	
	public boolean dropAbgcById(String id){
		String [] ids=id.split(",");
		List<String> idlist=new ArrayList<String>();
		for(int i=0;i<ids.length;i++){
			idlist.add(ids[i]);
		}
		return deleteBatch("dropAbgcById",idlist)==idlist.size();
	}
	@Override
	public List<SjbbMessage> insertToSheet(Map map) {
		return this.queryList("insertToSheet",map);
	}
	@Override
	public List<SjbbMessage> exportExcel_jh(Plan_abgc jh,Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh",params);
	}
	public int editAbgcById(Plan_abgc jh) {
		return update("editAbgcById", jh);
	}
	@Override
	public boolean importAbgc_jh(List<Map> data) {
//		for (Map map : data) {
//			Iterator iterator = map.entrySet().iterator();
//			while(iterator.hasNext()){
//				Entry next = (Map.Entry)iterator.next();
//				try{
//					String regex="^[0-9]{4}$";
//					System.out.println("2013".matches(regex));
//				}catch(Exception e){
//					e.printStackTrace();
//				}
//			}
//			System.out.println(map.size());
//		}
		abgc =new Plan_abgcServerImpl();
		bz= new Bzbz();
		for (Map map : data) {
			if("X".equals(map.get("2").toString().substring(0, 1))){
				bz.setLx("县");
			}else{
				bz.setLx("国省");
			}
			bz.setXmlx("安保");
			Bzbz lwbz = abgc.lwBzbz(bz);
			double ztz = Double.parseDouble(map.get("18").toString());
			double bl = Double.parseDouble(lwbz.getBl());
			double bzzj=0.0;
			ztz=(ztz*bl*100000+3*100000)/100000;
			bzzj=(Double.parseDouble(map.get("6").toString())*100000*Double.parseDouble(lwbz.getBz())+
					Double.parseDouble(lwbz.getFd())*100000)/100000;
			if(ztz>=bzzj){
			String zj =bzzj+"";
			String zczj=(Double.parseDouble(map.get("18").toString())*100000-bzzj*100000)/100000+"";
				map.put("19", zj);
				map.put("20", zczj);
			}else{
				String zczj=(Double.parseDouble(map.get("18").toString())*100000-ztz*100000)/100000+"";
				String ztz1=ztz+"";
				map.put("19", ztz1);
				map.put("20", zczj);
			}
			if(Double.parseDouble(map.get("18").toString())*100000>=500*100000){
				map.put("21", "是");
			}else{
				map.put("21", "否");
			}
		}
		return this.insertBatch("importAbgc_jh", data)==data.size()?true:false;
	}
	public boolean editStatus(Plan_abgc jh) {
		return update("editStatus", jh)>0;
	}
	@Override
	public Plan_abgc querySumAbgc(Plan_abgc jh, Jckabgc lx ) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("p", jh);
		param.put("x", lx);
		return queryOne("querySumAbgc", param);
	}
	@Override
	public boolean updateLrztBySckid(String sckId) {
		String [] scks=sckId.split(",");
		List<String> sckArray=new ArrayList<String>();
		for(int i=0;i<scks.length;i++){
			sckArray.add(scks[i]);
		}
		return updateBatch("updateLrztBySckid", sckArray)==sckArray.size();
	}
	public Bzbz lwBzbz(Bzbz bz) {
		return queryOne("lwBzbz", bz);
	}
	@Override
//	public boolean updateGkbg(Plan_abgc jh) {
//		return update("updateGkbg", jh)>0;
//	}
	public boolean updateGkbg(Plan_upload uploads) {
		return insert("insertGkbg", uploads)>0;
	}
	@Override
//	public boolean updateSjsgt(Plan_abgc jh) {
//		return update("updateSjsgt", jh)>0;
//	}
	public boolean updateSjsgt(Plan_upload uploads) {
		return insert("insertSjsgt", uploads)>0;
	}
	@Override
	public Plan_upload queryFjById(String id) {
		return queryOne("queryFjById", id);
	}
	@Override
	public List<TreeNode> queryTsdq() {
		return queryList("queryTsdq");
	}
	@Override
	public List<Plan_upload> queryFjByParentId(Plan_upload uploads) {
		return queryList("queryFjByParentId",uploads);
	}
	@Override
	public boolean deleteFile(Plan_upload uploads) {
		return delete("deleteFile", uploads)>0 ? true:false;
	}
	@Override
	public boolean editAbgcSckBysckid(Plan_abgc jh) {
		return update("editAbgcSckBysckid", jh)>0;
	}
	@Override
	public List<Plan_abgc> queryAbgcListByStatus(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryList("queryAbgcListByStatus",param);
	}
	@Override
	public List<Plan_abgc> queryAbgcByStatus(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryList("queryAbgcListByStatus",param);
	}
	@Override
	public boolean updateStatusBatch(List<Plan_abgc> splist) {
		return updateBatch("editStatus", splist)==splist.size();
	}
	@Override
	public List<TreeNode> queryJcktj() {
		return queryList("queryJcktj",null);
	}
	@Override
	public List<TreeNode> queryJcktj1() {
		return queryList("queryJcktj1",null);
	}
}
