package com.hdsx.jxzhpt.qqgl.lxsh.server.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.KxxyjServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.server.DbyhServer;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

@Service
public class KxxyjServerImpl extends BaseOperate implements KxxyjServer {

	public KxxyjServerImpl() {
		super("kxxyj", "jdbc");
	}

	@Override
	public List<Kxxyj> selectSjgzList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzList", lxsh);
	}

	@Override
	public int selectSjgzListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzListCount", lxsh);
	}
	@Override
	public boolean insertFile(Plan_upload uploads) {
		return insert("insertFile", uploads)>0;
	}

	@Override
	public boolean updateSjgzkxx(Kxxyj kxxyj) {
		if(update("updateSjgzkxx", kxxyj)>0){
			return true;
		}
		else return false;
	}
	@Override
	public boolean updateLmgzkxx(Kxxyj kxxyj) {
		if(update("updateLmgzkxx", kxxyj)>0){
			return true;
		}
		else return false;
	}
	@Override
	public boolean updateXjkxx(Kxxyj kxxyj) {
		if(update("updateXjkxx", kxxyj)>0){
			return true;
		}
		else return false;
	}
	@Override
	public boolean sbsjgzkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("sbsjgzkxx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean sblmgzkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("sblmgzkxx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean sbxjkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("sbxjkxx", lm)>0) return true;
		else return false;
	}
	private List<Map<String,Object>> lm;
	private Map<String,Object> hm;
	@Override
	public boolean thSjgzkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("thSjgzkxx", lm)>0) return true;
		else return false;
	}
	public boolean thLmgzkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("thLmgzkxx", lm)>0) return true;
		else return false;
	}
	public boolean thXjkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("thXjkxx", lm)>0) return true;
		else return false;
	}
	@Override
	public List<Kxxyj> selectSjgzkxshList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzkxshList", lxsh);
	}

	@Override
	public int selectSjgzkxshListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzkxshListCount", lxsh);
	}

	@Override
	public boolean shsjgzkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		String str="";
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			lm.add(hm);
			if(i==0)
				str=str+"'"+ids[i];
			else
			str=str+"','"+ids[i];
		}
		str="id in("+str+"')";
		if(updateBatch("shsjgzkxx", lm)>0){
			List<Kxxyj> list=queryList("queryshsjgz", str);
			for (Kxxyj lxsh2 : list) {
				if(lxsh2.getJsdw()==null){
					lxsh2.setJsdw("");
				}
				insert("insertsjgzcb", lxsh2);
			}
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean shlmgzkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		String str="";
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			lm.add(hm);
			if(i==0)
				str=str+"'"+ids[i];
			else
			str=str+"','"+ids[i];
		}
		str="id in("+str+"')";
		if(updateBatch("shlmgzkxx", lm)>0){
			List<Kxxyj> list=queryList("queryshlmgz", str);
			for (Kxxyj lxsh2 : list) {
				if(lxsh2.getJsdw()==null){
					lxsh2.setJsdw("");
				}
				insert("insertlmgzcb", lxsh2);
			}
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean shxjkxx(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		String str="";
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			lm.add(hm);
			if(i==0)
				str=str+"'"+ids[i];
			else
			str=str+"','"+ids[i];
		}
		str="id in("+str+"')";
		if(updateBatch("shxjkxx", lm)>0){
			List<Kxxyj> list=queryList("queryshxj", str);
			for (Kxxyj lxsh2 : list) {
				if(lxsh2.getJsdw()==null){
					lxsh2.setJsdw("");
				}
				insert("insertxjcb", lxsh2);
			}
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean sjgzsfcb(Lxsh lxsh) {
		String str="xmbm in ("+lxsh.getXmbm()+")";
		List<Kxxyj> list=queryList("sjgzsfcb", str);
		if(list==null){
			return true;
		}
		if(list.size()>0)
		 return false;
		else return true;
	}
	@Override
	public boolean lmgzsfcb(Lxsh lxsh) {
		String str="xmbm in ("+lxsh.getXmbm()+")";
		List<Kxxyj> list=queryList("lmgzsfcb", str);
		if(list==null){
			return true;
		}
		if(list.size()>0)
		 return false;
		else return true;
	}
	@Override
	public boolean xjsfcb(Lxsh lxsh) {
		String str="xmbm in ("+lxsh.getXmbm()+")";
		List<Kxxyj> list=queryList("xjsfcb", str);
		if(list==null){
			return true;
		}
		if(list.size()>0)
		 return false;
		else return true;
	}
	@Override
	public boolean thSjgzkxx1(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			System.out.println(ids[i]);
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(updateBatch("thSjgzkxx1", lm)>0&&deleteBatch("deletesjgzcb",lm)>0) return true;
		else return false;
	}
	@Override
	public boolean thLmgzkxx1(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			System.out.println(ids[i]);
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(updateBatch("thLmgzkxx1", lm)>0&&deleteBatch("deletelmgzcb",lm)>0) return true;
		else return false;
	}
	@Override
	public boolean thXjkxx1(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			System.out.println(ids[i]);
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(updateBatch("thXjkxx1", lm)>0&&deleteBatch("deletexjcb",lm)>0) return true;
		else return false;
	}
	@Override
	public List<Kxxyj> selectLmgzkxList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectLmgzkxList", lxsh);
	}

	@Override
	public int selectLmgzkxListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectLmgzkxListCount", lxsh);
	}

	@Override
	public List<Kxxyj> selectXjkxList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectXjkxList", lxsh);
	}

	@Override
	public int selectXjkxListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectXjkxListCount", lxsh);
	}

	@Override
	public List<Kxxyj> selectLmgzkxshList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectLmgzkxshList", lxsh);
	}

	@Override
	public int selectLmgzkxshListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectLmgzkxshListCount", lxsh);
	}

	@Override
	public List<Kxxyj> selectXjkxshList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectXjkxshList", lxsh);
	}

	@Override
	public int selectXjkxshListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectXjkxshListCount", lxsh);
	}
	
}
