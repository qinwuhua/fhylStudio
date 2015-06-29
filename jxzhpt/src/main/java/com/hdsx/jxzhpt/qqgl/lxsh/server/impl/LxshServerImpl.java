package com.hdsx.jxzhpt.qqgl.lxsh.server.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
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
public class LxshServerImpl extends BaseOperate implements LxshServer {

	public LxshServerImpl() {
		super("lxsh", "jdbc");
	}

	@Override
	public String selectXmbm(String str) {
		// TODO Auto-generated method stub
		return queryOne("selectXmbm", str);
	}

	@Override
	public Lxsh selectbzcs(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectbzcs", lxsh);
	}

	@Override
	public boolean selectSFCF(Lxsh lxsh) {
		List<Lxsh> l=queryList("selectSFCF", lxsh);
		if(l==null||l.size()==0)
			return true;
		else
		return false;
	}
	@Override
	public boolean selectSFCFLX(Lxsh lxsh) {
		Lxsh l=queryOne("selectSFCFLX", lxsh);
		if(l==null)
			return true;
		else
		return false;
	}
	@Override
	public boolean selectSFCF1(Lxsh lxsh) {
		Lxsh l=queryOne("selectSFCF1", lxsh);
		if(l==null)
			return true;
		else
		return false;
	}
	@Override
	public boolean selectSFCF2(Lxsh lxsh) {
		Lxsh l=queryOne("selectSFCF2", lxsh);
		if(l==null)
			return true;
		else
		return false;
	}
	@Override
	public boolean insertSjgz(Lxsh lxsh) {
		insert("insertlx", lxsh);
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if (insert("insertSjgz", lxsh) > 0) {
			return true;
		} else
			return false;
	}
	
	@Override
	public boolean insertLmgz(Lxsh lxsh) {
		insert("insertlx", lxsh);
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if (insert("insertLmgz", lxsh) > 0) {
			return true;
		} else
			return false;
	}
	@Override
	public boolean insertXj(Lxsh lxsh) {
		insert("insertlx", lxsh);
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if (insert("insertXj", lxsh) > 0) {
			return true;
		} else
			return false;
	}
	@Override
	public List<Lxsh> selectSjgzList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzList", lxsh);
	}

	@Override
	public int selectSjgzListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzListCount", lxsh);
	}

	@Override
	public List<Lxsh> selectSjgzlxList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzlxList",lxsh);
	}

	@Override
	public int selectSjgzlxListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzlxListCount", lxsh);
	}

	@Override
	public boolean sbsjgzSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("sbsjgzSbzt", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean sblmgzSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("sblmgzSbzt", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean sbxjSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("sbxjSbzt", lm)>0) return true;
		else return false;
	}
	private List<Map<String,Object>> lm;
	private Map<String,Object> hm;
	@Override
	public boolean thSjgzSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("thSjgzSbzt", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean thLmgzSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("thLmgzSbzt", lm)>0) return true;
		else return false;
	}
	public boolean thLmgzSbzt1(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			System.out.println(ids[i]);
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(updateBatch("thLmgzSbzt1", lm)>0&&deleteBatch("deletelmgzkxx",lm)>0&&deleteBatch("deletekxlx", lm)>0){ 
			return true;
		}
		else return false;
	}
	public boolean thSjgzSbzt1(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			System.out.println(ids[i]);
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(updateBatch("thSjgzSbzt1", lm)>0&&deleteBatch("deletesjgzkxx",lm)>0&&deleteBatch("deletekxlx", lm)>0) return true;
		else return false;
	}
	public boolean thXjSbzt1(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(updateBatch("thXjSbzt1", lm)>0&&deleteBatch("deletexjkxx",lm)>0&&deleteBatch("deletekxlx", lm)>0) return true;
		else return false;
	}
	public boolean Lmgzsfkxx(Lxsh lxsh) {
		String str="xmbm in ("+lxsh.getXmbm()+")";
			List<Lxsh> list=queryList("Lmgzsfkxx", str);
			if(list==null){
				return true;
			}
			if(list.size()>0)
			 return false;
			else return true;
	}
	public boolean sjgzsfkxx(Lxsh lxsh) {
		String str="xmbm in ("+lxsh.getXmbm()+")";
			List<Lxsh> list=queryList("sjgzsfkxx", str);
			if(list==null){
				return true;
			}
			if(list.size()>0)
			 return false;
			else return true;
	}
	public boolean Xjsfkxx(Lxsh lxsh) {
		String str="xmbm in ("+lxsh.getXmbm()+")";
			List<Lxsh> list=queryList("Xjsfkxx", str);
			if(list==null){
				return true;
			}
			if(list.size()>0)
			 return false;
			else return true;
	}
	@Override
	public boolean thXjSbzt(Lxsh lxsh) {
		String[] ids=lxsh.getId().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", ids[i]);
			hm.put("sbthcd", lxsh.getSbthcd());
			lm.add(hm);
		}
		if(updateBatch("thXjSbzt", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean updateSjgz(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if(update("updateSjgz", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	
	@Override
	public boolean updateLmgz(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if(update("updateLmgz", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	@Override
	public boolean updateXj(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if(update("updateXj", lxsh)>0){
			return true;
		}
		else
		return false;
	}
	
	@Override
	public List<Lxsh> selectSjgzshList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzshList", lxsh);
	}

	@Override
	public int selectSjgzshListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzshListCount", lxsh);
	}

	@Override
	public boolean delSjgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delSjgz", lm)>0&&deleteBatch("delSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean delLmgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delLmgz", lm)>0&&deleteBatch("delSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean delXj(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delXj", lm)>0&&deleteBatch("delSjgzlx", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean shsjgzSbzt(Lxsh lxsh) {
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
		if(updateBatch("shsjgzSbzt", lm)>0){
			List<Lxsh> list=queryList("queryshsjgz", str);
			for (Lxsh lxsh2 : list) {
				lxsh2.setJdbs("0");
				System.out.println(lxsh2.getXmbm());
				List<Lxsh> list3=queryList("querylxlist",lxsh2);
				for (Lxsh lxsh3 : list3) {
					lxsh3.setJdbs("1");
					insert("insertLx1", lxsh3);
				}
				insert("insertsjgzkxx", lxsh2);
			}
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean shlmgzSbzt(Lxsh lxsh) {
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
//System.out.println(str);
		if(updateBatch("shlmgzSbzt", lm)>0){
			List<Lxsh> list=queryList("queryshlmgz", str);
			for (Lxsh lxsh2 : list) {
				lxsh2.setJdbs("0");
				List<Lxsh> list3=queryList("querylxlist",lxsh2);
				for (Lxsh lxsh3 : list3) {
					lxsh3.setJdbs("1");
					insert("insertLx1", lxsh3);
				}
				insert("insertlmgzkxx", lxsh2);
			}
			return true;
		}
		else
			return false;
	}
	@Override
	public boolean shxjSbzt(Lxsh lxsh) {
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
//System.out.println(str);
		if(updateBatch("shxjSbzt", lm)>0){
			List<Lxsh> list=queryList("queryshxj", str);
			for (Lxsh lxsh2 : list) {
				lxsh2.setJdbs("0");
				List<Lxsh> list3=queryList("querylxlist",lxsh2);
				for (Lxsh lxsh3 : list3) {
					lxsh3.setJdbs("1");
					insert("insertLx1", lxsh3);
				}
				insert("insertxjkxx", lxsh2);
			}
			return true;
		}
		else
			return false;
	}
	
	@Override
	public List<Lxsh> selectLmgzList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectLmgzList",lxsh);
	}

	@Override
	public int selectLmgzListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectLmgzListCount", lxsh);
	}

	@Override
	public String selectlmgzXmbm(String str) {
		return queryOne("selectlmgzXmbm", str);
	}
	@Override
	public String selectxjXmbm(String str) {
		return queryOne("selectxjXmbm", str);
	}
	@Override
	public List<Lxsh> selectLmgzshList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectLmgzshList", lxsh);
	}

	@Override
	public int selectLmgzshListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectLmgzshListCount", lxsh);
	}

	@Override
	public List<Lxsh> selectXjList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectXjList", lxsh);
	}

	@Override
	public int selectXjListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectXjListCount", lxsh);
	}

	@Override
	public List<Lxsh> selectXjshList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectXjshList",lxsh);
	}

	@Override
	public int selectXjshListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectXjshListCount", lxsh);
	}

	@Override
	public List<Lxsh> qqglGpsroad(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("qqglGpsroad", lxsh);
	}

	@Override
	public boolean insertLx(Lxsh lxsh) {
		if(insert("insertLx", lxsh)>0){
			Double bzcs=queryOne("queryMaxbzcs",lxsh);
			Double lc=queryOne("queryMaxlc",lxsh);
			if(lc!=null)
			lxsh.setLc(lc+"");
			if(bzcs!=null)
			lxsh.setBzys(bzcs+"");
			if("0".equals(lxsh.getJdbs())){
				if("sjgz".equals(lxsh.getXmlx())){
					if(update("updatesjgz", lxsh)>0)
						return true;
				}
				if("lmgz".equals(lxsh.getXmlx())){
					if(update("updatelmgz", lxsh)>0)
						return true;
				}
				if("xj".equals(lxsh.getXmlx())){
					if(update("updatexj", lxsh)>0)
						return true;
				}
			}else{
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean deleteLx(Lxsh lxsh) {
		if(insert("deleteLx", lxsh)>0){
			Double bzcs=queryOne("queryMaxbzcs",lxsh);
			Double lc=queryOne("queryMaxlc",lxsh);
			if(lc!=null)
			lxsh.setLc(lc+"");
			if(bzcs!=null)
			lxsh.setBzys(bzcs+"");
			if("0".equals(lxsh.getJdbs())){
				if("sjgz".equals(lxsh.getXmlx())){
					if(update("updatesjgz", lxsh)>0)
						return true;
				}
				if("lmgz".equals(lxsh.getXmlx())){
					if(update("updatelmgz", lxsh)>0)
						return true;
				}
				if("xj".equals(lxsh.getXmlx())){
					if(update("updatexj", lxsh)>0)
						return true;
				}
			}else{
				return true;
			}
		}
		return false;
	}

	@Override
	public Lxsh cxqdmc(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("cxqdmc", lxsh);
	}

	@Override
	public Lxsh cxzdmc(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("cxzdmc", lxsh);
	}

	@Override
	public Lxsh sfylx(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("sfylx", lxsh);
	}

	@Override
	public Lxsh qqglGpszh(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("qqglGpszh", lxsh);
	}
	
}
