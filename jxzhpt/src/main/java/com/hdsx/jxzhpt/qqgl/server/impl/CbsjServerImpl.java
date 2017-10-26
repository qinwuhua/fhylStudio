package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.WnjhServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.impl.WnjhServerImpl;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
@Service
public class CbsjServerImpl extends BaseOperate implements CbsjServer {
	public CbsjServerImpl(){
		super("cbsj", "jdbc");
	}
	private Map<String, Object> params=new HashMap<String, Object>();
	//路面改造部分代码
	@Override
	public List<Cbsj> queryCbsjLmgz(Cbsj lmsj, int page, int rows) {
		params.put("cbsj", lmsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjLmgz",params);
	}
	@Override
	public List<Cbsj> queryCbsjLmgzbg(Cbsj lmsj, int page, int rows) {
		params.put("cbsj", lmsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjLmgzbg",params);
	}
	@Override
	public int queryCbsjLmgzCount(Cbsj lmsj) {
		params.put("lmsj", lmsj);
		return queryOne("queryCbsjLmgzCount", params);
	}
	@Override
	public int queryCbsjLmgzbgCount(Cbsj lmsj) {
		params.put("lmsj", lmsj);
		return queryOne("queryCbsjLmgzbgCount", params);
	}
	@Override
	public Cbsj queryCbsjLmgzByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmgzByXmbm",params);
	}
	@Override
	public Cbsj queryCbsjLmgzqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmgzqxByXmbm",params);
	}
	@Override
	public Cbsj queryCbsjLmgzbgByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmgzbgByXmbm",params);
	}
	@Override
	public boolean updateCbsjLmgz(Cbsj cbsj) {
		//System.out.println(update("updateCbsjLmgz",cbsj));
		return update("updateCbsjLmgz",cbsj)>0;
	}
	@Override
	public boolean insertFile(Plan_upload uploads) {
		return insert("insertFile", uploads)>0;
	}
	@Override
	public List<Plan_upload> queryFileByXmbm(Plan_upload upload) {
		return queryList("queryFileByXmbm",upload);
	}
	@Override
	public List<Plan_upload> queryxdFileByWh(Plan_upload upload) {
		return queryList("queryxdFileByWh",upload);
	}
	@Override
	public boolean deleteLmgzByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (String string : split) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(string);
			list.add(obj);
		}
		return deleteBatch("deleteLmgzByXmbm",list)==list.size();
	}
	/////升级项目部分代码
	@Override
	public List<Cbsj> queryCbsjLmsj(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjLmsj",params);
	}
	@Override
	public List<Cbsj> queryCbsjgsd(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjgsd",params);
	}
	@Override
	public int queryCbsjgsdCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjgsdCount", params);
	}
	@Override
	public List<Cbsj> queryCbsjLmsjbg(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjLmsjbg",params);
	}
	@Override
	public int queryCbsjLmsjCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjLmsjCount", params);
	}
	@Override
	public int queryCbsjLmsjbgCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjLmsjbgCount", params);
	}
	@Override
	public Cbsj queryCbsjLmsjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmsjByXmbm", params);
	}
	@Override
	public Cbsj queryCbsjLmsjqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmsjqxByXmbm", params);
	}
	@Override
	public Cbsj queryCbsjLmsjbgByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmsjbgByXmbm", params);
	}
	@Override
	public boolean updateCbsjLmsj(Cbsj cbsj) {
		return update("updateCbsjLmsj", cbsj)>0;
	}
	@Override
	public boolean deleteLmsjByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (String string : split) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(string);
			list.add(obj);
		}
		return deleteBatch("deleteLmsjByXmbm", list)==list.size();
	}
	@Override
	public boolean shCbsjLmsjByXmbm(Cbsj cbsj,String sbzt,String shzt) {
		String[] split = cbsj.getXmbm().split(",");
		String[] split2=null,split3 = null;
		if(sbzt!=null && !sbzt.equals("")){
			split2 = sbzt.split(",");
		}
		if(shzt!=null && !shzt.equals("")){
			split3 = shzt.split(",");
		}
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			if(split2!=null){
				obj.setSbzt(new Integer(split2[j]));
			}
			if(split3!=null){
				obj.setShzt(new Integer(split3[j]));
			}
			list.add(obj);
		}
		return updateBatch("shCbsjLmsjByXmbm", list)==list.size();
	}
	@Override
	public boolean shCbsjLmgzByXmbm(Cbsj cbsj,String sbzt,String shzt) {
		String[] split = cbsj.getXmbm().split(",");
		String[] split2=null,split3 = null;
		if(sbzt!=null && !sbzt.equals("")){
			split2 = sbzt.split(",");
		}
		if(shzt!=null && !shzt.equals("")){
			split3 = shzt.split(",");
		}
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			if(split2!=null){
				obj.setSbzt(new Integer(split2[j]));
			}
			if(split3!=null){
				obj.setShzt(new Integer(split3[j]));
			}
			list.add(obj);
		}
		return updateBatch("shCbsjLmgzByXmbm", list)==list.size();
	}
	@Override
	public List<Cbsj> queryCbsjXj(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjXj",params);
	}
	@Override
	public List<Cbsj> queryCbsjXjbg(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjXjbg",params);
	}
	@Override
	public int queryCbsjXjCount(Cbsj cbsj) {
		params.put("cbsj",cbsj);
		return queryOne("queryCbsjXjCount", params);
	}
	@Override
	public int queryCbsjXjbgCount(Cbsj cbsj) {
		params.put("cbsj",cbsj);
		return queryOne("queryCbsjXjbgCount", params);
	}
	@Override
	public Cbsj queryCbsjXjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjXjByXmbm", params);
	}
	@Override
	public Cbsj queryCbsjXjqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjXjqxByXmbm", params);
	}
	@Override
	public Cbsj queryCbsjXjbgByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjXjbgByXmbm", params);
	}
	@Override
	public boolean updateCbsjXj(Cbsj cbsj) {
		return update("updateCbsjXj",cbsj)>0;
	}
	@Override
	public boolean deleteXjByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (String string : split) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(string);
			list.add(obj);
		}
		return deleteBatch("deleteXjByXmbm", list)==list.size();
	}
	@Override
	public boolean shCbsjXjByXmbm(Cbsj cbsj, String sbzt, String shzt) {
		String[] split = cbsj.getXmbm().split(",");
		String[] split2=null,split3 = null;
		if(sbzt!=null && !sbzt.equals("")){
			split2 = sbzt.split(",");
		}
		if(shzt!=null && !shzt.equals("")){
			split3 = shzt.split(",");
		}
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			if(split2!=null){
				obj.setSbzt(new Integer(split2[j]));
			}
			if(split3!=null){
				obj.setShzt(new Integer(split3[j]));
			}
			list.add(obj);
		}
		return updateBatch("shCbsjXjByXmbm", list)==list.size();
	}
	@Override
	public Cbsj queryCbsjYhdzxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjYhdzxByXmbm", params);
	}
	@Override
	public Cbsj queryCbsjYhdzxqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjYhdzxqxByXmbm", params);
	}
	@Override
	public Cbsj queryCbsjYhdzxbgByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjYhdzxbgByXmbm", params);
	}
	@Override
	public List<Cbsj> queryCbsjYhdzx(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjYhdzx",params);
	}
	@Override
	public List<Cbsj> queryCbsjYhdzxbg(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjYhdzxbg",params);
	}
	@Override
	public int queryCbsjYhdzxCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjYhdzxCount", params);
	}
	@Override
	public int queryCbsjYhdzxbgCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjYhdzxbgCount", params);
	}
	@Override
	public boolean updateCbsjYhdzx(Cbsj cbsj) {
		return update("updateCbsjYhdzx", cbsj)>0;
	}
	@Override
	public boolean shCbsjYhdzxByXmbm(Cbsj cbsj, String shzt1) {
		String[] split = cbsj.getXmbm().split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			obj.setShzt(cbsj.getShzt());
			list.add(obj);
		}
		return updateBatch("shCbsjYhdzxByXmbm", list)==list.size();
	}
	@Override
	public List<Cbsj> queryCbsjSh(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjSh",params);
	}
	@Override
	public List<Cbsj> queryCbsjShbg(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjShbg",params);
	}
	@Override
	public int queryCbsjShCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjShCount", params);
	}
	@Override
	public int queryCbsjShbgCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjShbgCount", params);
	}
	@Override
	public Cbsj queryCbsjShByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjShByXmbm",params);
	}
	@Override
	public Cbsj queryCbsjShqxByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjShqxByXmbm",params);
	}
	@Override
	public Cbsj queryCbsjShbgByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjShbgByXmbm",params);
	}
	@Override
	public boolean updateCbsjSh(Cbsj cbsj) {
		return update("updateCbsjSh", cbsj)>0;
	}
	@Override
	public boolean shCbsjShByXmbm(Cbsj cbsj, String shzt1) {
		String[] split = cbsj.getXmbm().split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (int j = 0; j < split.length; j++) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(split[j]);
			obj.setShzt(cbsj.getShzt());
			list.add(obj);
		}
		return updateBatch("shCbsjShByXmbm", list)==list.size();
	}
	@Override
	public List<Excel_list> queryLmgzExcel(Cbsj cbsj) {
		return queryList("queryLmgzExcel",cbsj);
	}
	@Override
	public List<Excel_list> querygsdExcel(Cbsj cbsj) {
		return queryList("querygsdExcel",cbsj);
	}
	@Override
	public List<Excel_list> queryYhdzxExcel(Cbsj cbsj) {
		return queryList("queryYhdzxExcel",cbsj);
	}
	@Override
	public List<Excel_list> queryShExcel(Cbsj cbsj) {
		return queryList("queryShExcel",cbsj);
	}
	@Override
	public List<Excel_list> queryLmsjExcel(Cbsj cbsj) {
		return queryList("queryLmsjExcel",cbsj);
	}
	@Override
	public List<Excel_list> queryXjExcel(Cbsj cbsj) {
		return queryList("queryXjExcel",cbsj);
	}
	@Override
	public boolean updateCbsjYhdzx(List<Cbsj> cbsj) {
		return updateBatch("updateCbsjYhdzx", cbsj)==cbsj.size();
	}
	@Override
	public boolean updateCbsjSh(List<Cbsj> cbsj) {
		return updateBatch("updateCbsjSh", cbsj)==cbsj.size();
	}
	@Override
	public boolean updateCbsjLmgz(List<Cbsj> cbsj) {
		return updateBatch("updateCbsjLmgz",cbsj)==cbsj.size();
	}
	@Override
	public boolean updateCbsjLmsj(List<Cbsj> cbsj) {
		return updateBatch("updateCbsjLmsj",cbsj)==cbsj.size();
	}
	@Override
	public boolean updateCbsjXj(List<Cbsj> list) {
		return updateBatch("updateCbsjXj",list)==list.size();
	}
	@Override
	public Plan_upload queryFileByWh(Plan_upload uploads) {
		//System.out.println(uploads.getFiletype()+"   "+uploads.getFilewh()+"    "+uploads.getFilename());
		return queryOne("queryFileByWh", uploads);
	}
	@Override
	public boolean insertFileJl(Plan_upload uploads) {
		return insert("insertFileJl", uploads)>0;
	}
	@Override
	public List<Plan_upload> queryFj() {
		return queryList("queryFj");
	}
	@Override
	public Plan_upload queryFjByName(Plan_upload file) {
		return queryOne("queryFjByName",file);
	}
	@Override
	public List<Plan_upload> queryGkXm(String gkwh) {
		params.put("gkwh", gkwh);
		return queryList("queryGkXm",params);
	}
	@Override
	public List<Plan_upload> queryJhXm(String jhwh) {
		params.put("jhwh", jhwh);
		return queryList("queryJhXm",params);
	}
	@Override
	public Map<String, String> queryCbsjLjYhdzx(Cbsj cbsj) {
		return queryOne("queryCbsjLjYhdzx", cbsj);
	}
	@Override
	public Map<String, String> queryCbsjbgLjYhdzx(Cbsj cbsj) {
		return queryOne("queryCbsjbgLjYhdzx", cbsj);
	}
	@Override
	public Map<String, String> queryCbsjLjSh(Cbsj cbsj) {
		return queryOne("queryCbsjLjSh", cbsj);
	}
	@Override
	public Map<String, String> queryCbsjbgLjSh(Cbsj cbsj) {
		return queryOne("queryCbsjbgLjSh", cbsj);
	}
	@Override
	public Lxsh loadsjcbsjTjxx(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("loadsjcbsjTjxx", params);
	}
	@Override
	public Lxsh loadsjcbsjbgTjxx(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("loadsjcbsjbgTjxx", params);
	}
	@Override
	public Lxsh loadlmcbsjTjxx(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("loadlmcbsjTjxx", params);
	}
	@Override
	public Lxsh loadgsdcbsjTjxx(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("loadgsdcbsjTjxx", params);
	}
	@Override
	public Lxsh loadlmcbsjbgTjxx(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("loadlmcbsjbgTjxx", params);
	}
	@Override
	public Lxsh loadxjcbsjTjxx(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("loadxjcbsjTjxx", params);
	}
	@Override
	public Lxsh loadxjcbsjbgTjxx(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("loadxjcbsjbgTjxx", params);
	}
	@Override
	public Cbsj selectSjsgt(Cbsj cbsj) {
		return queryOne("selectSjsgt", cbsj);
	}
	@Override
	public boolean updatesjsgt(Cbsj cbsj) {
		if(queryOne("selectSjsgt", cbsj)==null){
			insert("insertsjsgt", cbsj);
		}
		return update("updatesjsgt",cbsj)==1;
	}
	@Override
	public boolean updatexjsgt(Cbsj cbsj) {
		if(queryOne("selectXjsgt", cbsj)==null){
			insert("insertxjsgt", cbsj);
		}
		return update("updatexjsgt",cbsj)==1;
	}
	@Override
	public boolean updatelmsgt(Cbsj cbsj) {
		if(queryOne("selectLmsgt", cbsj)==null){
			insert("insertlmsgt", cbsj);
		}
		return update("updatelmsgt",cbsj)==1;
	}
	@Override
	public List<Plan_upload> getWjbyxmbm(Plan_upload file) {
		return queryList("getWjbyxmbm",file);
	}
	@Override
	public List<Plan_upload> getWjbytype(Plan_upload file) {
		return queryList("getWjbytype",file);
	}
	@Override
	public boolean shangbaoCbsj(Cbsj cbsj) {
		if("1".equals(""+cbsj.getXmlx())){
			cbsj.setBz("cbsj_sjgz");
		}
		if("2".equals(""+cbsj.getXmlx())){
			cbsj.setBz("cbsj_lmgz");
		}
		if("3".equals(""+cbsj.getXmlx())){
			cbsj.setBz("cbsj_xj");
		}
		if("4".equals(""+cbsj.getXmlx())){
			cbsj.setBz("cbsj_yhdzx");
		}
		if("5".equals(""+cbsj.getXmlx())){
			cbsj.setBz("cbsj_sh");
		}
		return update("shangbaoCbsj", cbsj)>0;

	}
	/**/
	@Override
	public boolean thCbsjByXmbm(Cbsj cbsj) {
		String table="";
		if("1".equals(""+cbsj.getXmlx()))
			table="cbsj_sjgz";
		if("2".equals(""+cbsj.getXmlx()))
			table="cbsj_lmgz";
		if("3".equals(""+cbsj.getXmlx()))
			table="cbsj_xj";
		if("4".equals(""+cbsj.getXmlx()))
			table="cbsj_yhdzx";
		if("5".equals(""+cbsj.getXmlx()))
			table="cbsj_sh";
		cbsj.setBz(table);
		
		return update("thCbsjByXmbm", cbsj)>0;
	}
	@Override
	public boolean thwshcbsj(Cbsj cbsj) {
		String bz="";String sfkth="";
		if("1".equals(""+cbsj.getXmlx())){
			sfkth="jhsh_sjgz";
			bz="cbsj_sjgz";
			cbsj.setJdbs("2");
		}
		if("2".equals(""+cbsj.getXmlx())){
			sfkth="jhsh_lmgz";
			bz="cbsj_lmgz";
			cbsj.setJdbs("2");
		}
		if("3".equals(""+cbsj.getXmlx())){
			sfkth="jhsh_xj";
			bz="cbsj_xj";
			cbsj.setJdbs("2");
		}
		if("4".equals(""+cbsj.getXmlx())){
			sfkth="jhsh_yhdzx";
			bz="cbsj_yhdzx";
			cbsj.setJdbs("2");
		}
		if("5".equals(""+cbsj.getXmlx())){
			sfkth="jhsh_sh";
			bz="cbsj_sh";
			cbsj.setJdbs("2");
		}
		cbsj.setBzcs(sfkth);
		List<Lxsh> l = queryList("sfkythcbsjwsh",cbsj);
		if(l.size()>0)
			return false;
		else{
			cbsj.setBz(bz);
			 
			//return update("thwshcbsj", cbsj)>0&&delete("thwshkxxcbsj", cbsj)>0;
			return update("thwshcbsj", cbsj)>0;

		}
		
	}

}
