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
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
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
	@Override
	public Plan_abgc queryAfgcById(String id) {
		return queryOne("queryAfgcById", id);
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
	public List<Excel_list> exportExcel_jh(Plan_abgc jh,Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh",params);
	}
	@Override
	public List<Excel_list> exportExcel_jh1(Plan_abgc jh,Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return this.queryList("exportExcel_jh1",params);
	}
	@Override
	public int editAbgcById(Plan_abgc jh) {
		return update("editAbgcById", jh);
	}
	@Override
	public int editAfgcById(Plan_abgc jh) {
		return update("editAfgcById", jh);
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
	@Override
	public boolean editStatus(Plan_abgc jh) {
		return update("editStatus", jh)>0;
	}
	@Override
	public boolean editStatus1(Plan_abgc jh) {
		return update("editStatus1", jh)>0;
	}
	@Override
	public Plan_abgc querySumAbgc(Plan_abgc jh, Jckabgc lx ) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
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
	
	public Bzbz getafBzbz(Bzbz bz) {
		Bzbz b=new Bzbz();
		b.setBl("0.6");
		b.setFd("1");
		List<Bzbz> l=queryList("getafBzbz", bz);
		if(l.size()>0)
			b.setBz("7");
		else b.setBz("5");
		return b;
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
	public boolean editAbgcSckBysckid(Sckabgc sc) {
		return update("editAbgcSckBysckid", sc)>0;
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
	public List<Plan_abgc> queryAfgcByStatus(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryList("queryAfgcListByStatus",param);
	}
	@Override
	public boolean updateStatusBatch(List<Plan_abgc> splist) {
		return updateBatch("editStatus", splist)==splist.size();
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
	public List<Plan_abgc> queryAbgcList(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryAbgcList2",params);
	}
	@Override
	public List<Plan_abgc> queryAfgcList(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryAfgcList2",params);
	}
	@Override
	public boolean editZjById(Plan_abgc jh) {
		return update("editZjById", jh)>0;
	}
	@Override
	public List<Object> exportExcelAbgcJhSh(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("exportExcelAbgcJhSh",params);
	}
	@Override
	public List<Object> exportExcelAfgcJhSh(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("exportExcelAfgcJhSh",params);
	}
	@Override
	public boolean updateImportAbgcJhSh(List<Plan_abgc> list) {
		return (updateBatch("updateImportAbgcJh",list)==list.size() && updateBatch("updateImportAbgcSh",list)==list.size());
	}
	@Override
	public List<Plan_upload> queryFjByParentId2(Plan_upload uploads) {
		return queryList("queryFjByParentId2",uploads);
	}
	@Override
	public boolean deleteFile2(Plan_upload uploads) {
		return delete("deleteFile2", uploads)>0 ? true:false;
	}
	@Override
	public boolean updateTzxz(Plan_abgc jh) {
		return update("updateTzxz",jh)>0;
	}
	@Override
	public int queryAbgcTz(Plan_abgc jh) {
		return 0;
	}
	@Override
	public boolean updateAbgcTz(Plan_abgc jh) {
		return update("updateAbgcTz",jh)>0;
	}
	@Override
	public boolean insertAbgcTz(Plan_abgc jh) {
		return insert("insertAbgcTz",jh)>0;
	}
	@Override
	public int queryAbgcTzCount(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryAbgcTzCount", params);
	}
	@Override
	public List<Plan_abgc> queryAbgcTzList(int page, int rows, Plan_abgc jh,Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryAbgcTzList",params);
	}
	@Override
	public Plan_abgc querySumAbgcTz(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryOne("querySumAbgcTz", param);
	}
	@Override
	public boolean insertAbgcFromBf(Plan_abgc jh) {
		return insert("insertAbgcFromBf",jh)>0;
	}
	@Override
	public boolean dropAbgcBfById(Plan_abgc jh) {
		return delete("dropAbgcBfById",jh)>0;
	}
	@Override
	public Plan_abgc queryAbgcTzById(String id) {
		return queryOne("queryAbgcTzById",id);
	}
	@Override
	public int editAbgcTzById(Plan_abgc jh) {
		return update("editAbgcTzById",jh);
	}
	@Override
	public Plan_abgc querySumAfgc(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> param=new HashMap<String, Object>();
		param.put("jh", jh);
		param.put("lx", lx);
		return queryOne("querySumAfgc", param);
	}
	@Override
	public int queryAfgcCount(Plan_abgc jh, Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("jh", jh);
		params.put("lx", lx);
		return queryOne("queryAfgcCount", params);
	}
	@Override
	public List<Plan_abgc> queryAfgcList(int page, int rows, Plan_abgc jh,
			Jckabgc lx) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		params.put("jh", jh);
		params.put("lx", lx);
		return queryList("queryAfgcList",params);
	}
	@Override
	public List<Excel_list> exportExcleAbgc(Plan_abgc planabgc) {
		
		return queryList("exportExcleAbgc",planabgc);
	}
	@Override
	public boolean tuihuiAfById(String jh) {
		return update("tuihuiAfById", jh)>0;
	}
}
