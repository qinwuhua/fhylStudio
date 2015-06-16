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
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
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
	public int queryCbsjLmgzCount(Cbsj lmsj) {
		params.put("lmsj", lmsj);
		return queryOne("queryCbsjLmgzCount", params);
	}
	@Override
	public Cbsj queryCbsjLmgzByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmgzByXmbm",params);
	}
	@Override
	public boolean updateCbsjLmgz(Cbsj cbsj) {
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
	public int queryCbsjLmsjCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjLmsjCount", params);
	}
	@Override
	public Cbsj queryCbsjLmsjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmsjByXmbm", params);
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
	public int queryCbsjXjCount(Cbsj cbsj) {
		params.put("cbsj",cbsj);
		return queryOne("queryCbsjXjCount", params);
	}
	@Override
	public Cbsj queryCbsjXjByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjXjByXmbm", params);
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
	public List<Cbsj> queryCbsjYhdzx(Cbsj cbsj, int page, int rows) {
		params.put("cbsj", cbsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjYhdzx",params);
	}
	@Override
	public int queryCbsjYhdzxCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjYhdzxCount", params);
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
	public int queryCbsjShCount(Cbsj cbsj) {
		params.put("cbsj", cbsj);
		return queryOne("queryCbsjShCount", params);
	}
	@Override
	public Cbsj queryCbsjShByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjShByXmbm",params);
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

}
