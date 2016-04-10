package com.hdsx.jxzhpt.qqgl.lxsh.server.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcgl_jgys;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
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
	public List<Kxxyj> selectgsdkxList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectgsdkxList", lxsh);
	}

	@Override
	public int selectgsdkxListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectgsdkxListCount", lxsh);
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
	public List<Kxxyj> selectSjgzkxbgList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectSjgzkxbgList", lxsh);
	}

	@Override
	public int selectSjgzkxbgListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectSjgzkxbgListCount", lxsh);
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
				lxsh2.setJdbs("1");
				System.out.println(lxsh2.getXmbm());
				List<Lxsh> list3=queryList("querylxlist",lxsh2);
				for (Lxsh lxsh3 : list3) {
					lxsh3.setJdbs("2");
					insert("insertLx1", lxsh3);
					break;
				}
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
				lxsh2.setJdbs("1");
				System.out.println(lxsh2.getXmbm());
				List<Lxsh> list3=queryList("querylxlist",lxsh2);
				for (Lxsh lxsh3 : list3) {
					lxsh3.setJdbs("2");
					insert("insertLx1", lxsh3);
					break;
				}
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
				lxsh2.setJdbs("1");
				System.out.println(lxsh2.getXmbm());
				List<Lxsh> list3=queryList("querylxlist",lxsh2);
				for (Lxsh lxsh3 : list3) {
					lxsh3.setJdbs("2");
					insert("insertLx1", lxsh3);
					break;
				}
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
	
	@Override
	public List<Kxxyj> selectLmgzkxbgList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectLmgzkxbgList", lxsh);
	}

	@Override
	public int selectLmgzkxbgListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectLmgzkxbgListCount", lxsh);
	}

	@Override
	public List<Kxxyj> selectXjkxbgList(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryList("selectXjkxbgList", lxsh);
	}

	@Override
	public int selectXjkxbgListCount(Lxsh lxsh) {
		// TODO Auto-generated method stub
		return queryOne("selectXjkxbgListCount", lxsh);
	}
	@Override
	public boolean updateJGTC(Gcgl_jgys gcgl_jgys) {
		if(insert("insertJgtc", gcgl_jgys)>0){
			return true;
		}else return false;
	}

	@Override
	public boolean updateWGYS(Gcgl_jgys gcgl_jgys) {
		if(insert("insertWgys", gcgl_jgys)>0){
			return true;
		}else return false;
	}

	@Override
	public boolean importsjgzkxx(List<Map> data) {
		if(updateBatch("updatesjgzkxxlx", data)==data.size()&&updateBatch("importsjgzkxx", data)==data.size())
			return true;
			else return false;
	}

	@Override
	public boolean importlmgzkxx(List<Map> data) {
		if(updateBatch("updatelmgzkxxlx", data)==data.size()&&updateBatch("importlmgzkxx", data)==data.size())
			return true;
			else return false;
	}

	@Override
	public boolean importxjkxx(List<Map> data) {
		if(updateBatch("updatexjkxxlx", data)==data.size()&&updateBatch("importxjkxx", data)==data.size())
			return true;
			else return false;
	}

	@Override
	public Lxsh showsjkxxTjxx(Lxsh lxsh) {
		return queryOne("showsjkxxTjxx", lxsh);
	}

	@Override
	public Lxsh showgsdkxxTjxx(Lxsh lxsh) {
		return queryOne("showgsdkxxTjxx", lxsh);
	}
	
	@Override
	public Lxsh showlmkxxTjxx(Lxsh lxsh) {
		return queryOne("showlmkxxTjxx", lxsh);
	}

	@Override
	public Lxsh showxjkxxTjxx(Lxsh lxsh) {
		return queryOne("showxjkxxTjxx", lxsh);
	}
	
	@Override
	public Lxsh showsjkxxbgTjxx(Lxsh lxsh) {
		return queryOne("showsjkxxbgTjxx", lxsh);
	}

	@Override
	public Lxsh showlmkxxbgTjxx(Lxsh lxsh) {
		return queryOne("showlmkxxbgTjxx", lxsh);
	}

	@Override
	public Lxsh showxjkxxbgTjxx(Lxsh lxsh) {
		return queryOne("showxjkxxbgTjxx", lxsh);
	}

	@Override
	public boolean tzxm(Lxsh lxsh) {
		if("sjgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtbsjkx", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmsjkx", lxsh);
			 if(l==null){
				 b=insert("tzxztjsjkx", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxgsjkx", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzsjkx",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		
		if("lmgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtblmkx", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmlmkx", lxsh);
			 if(l==null){
				 b=insert("tzxztjlmkx", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxglmkx", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzlmkx",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		
		if("xj".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtbxjkx", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmxjkx", lxsh);
			 if(l==null){
				 b=insert("tzxztjxjkx", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxgxjkx", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzxjkx",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		//cbsj
		if("sjgz".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtbsjcb", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmsjcb", lxsh);
			 if(l==null){
				 b=insert("tzxztjsjcb", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxgsjcb", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzsjcb",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		if("lmgz".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtblmcb", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmlmcb", lxsh);
			 if(l==null){
				 b=insert("tzxztjlmcb", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxglmcb", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzlmcb",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		if("xj".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtbxjcb", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmxjcb", lxsh);
			 if(l==null){
				 b=insert("tzxztjxjcb", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxgxjcb", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzxjcb",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		if("sh".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtbshcb", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmshcb", lxsh);
			 if(l==null){
				 b=insert("tzxztjshcb", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxgshcb", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzshcb",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		if("yh".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			int a=update("tzxzoldtbyhcb", lxsh);
			int b=0;
			Lxsh l=queryOne("querytzbyxmbmyhcb", lxsh);
			 if(l==null){
				 b=insert("tzxztjyhcb", lxsh);
				 insert("tzxztjsjkxlx", lxsh);
			 }else{
				 b=update("tzxzxgyhcb", lxsh);
			 }
			if(a==1&&b==1){
				if("取消".equals(lxsh.getTzxz())){
					int c=delete("qxtzxzyhcb",lxsh);
					return c==1;
				}else{
					return true;
				}
			}
		}
		
		return false;
	}

	@Override
	public boolean thtzxm(Lxsh lxsh) {
		if("sjgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzsjkx",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbsjkx",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("lmgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzlmkx",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtblmkx",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("xj".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzxjkx",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbxjkx",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		//cbsj
		if("sjgz".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzsjcb",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbsjcb",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("lmgz".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzlmcb",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtblmcb",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("xj".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzxjcb",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbxjcb",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("sh".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzshcb",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbshcb",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("yh".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
			delete("thtzkxlx",lxsh);
			insert("thtzyhcb",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbyhcb",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		
		return false;
	}

	@Override
	public boolean thtzxm1(Lxsh lxsh) {
		if("sjgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			delete("qxtzxzsjkx",lxsh);
			delete("thtzkxlx",lxsh);
			insert("thtzsjkx",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbsjkx",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("lmgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			delete("qxtzxzlmkx",lxsh);
			delete("thtzkxlx",lxsh);
			insert("thtzlmkx",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtblmkx",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		if("xj".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			delete("qxtzxzxjkx",lxsh);
			delete("thtzkxlx",lxsh);
			insert("thtzxjkx",lxsh);
			insert("tjtzkxlx",lxsh);
			delete("thtznewtbxjkx",lxsh);
			delete("thtznewtbsjkxlx",lxsh);
			return true;
		}
		//cbsj
				if("sjgz".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
					delete("qxtzxzsjcb",lxsh);
					delete("thtzkxlx",lxsh);
					insert("thtzsjcb",lxsh);
					insert("tjtzkxlx",lxsh);
					delete("thtznewtbsjcb",lxsh);
					delete("thtznewtbsjkxlx",lxsh);
					return true;
				}
				if("lmgz".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
					delete("qxtzxzlmcb",lxsh);
					delete("thtzkxlx",lxsh);
					insert("thtzlmcb",lxsh);
					insert("tjtzkxlx",lxsh);
					delete("thtznewtblmcb",lxsh);
					delete("thtznewtbsjkxlx",lxsh);
					return true;
				}
				if("xj".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
					delete("qxtzxzxjcb",lxsh);
					delete("thtzkxlx",lxsh);
					insert("thtzxjcb",lxsh);
					insert("tjtzkxlx",lxsh);
					delete("thtznewtbxjcb",lxsh);
					delete("thtznewtbsjkxlx",lxsh);
					return true;
				}
				if("sh".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
					delete("qxtzxzshcb",lxsh);
					delete("thtzkxlx",lxsh);
					insert("thtzshcb",lxsh);
					insert("tjtzkxlx",lxsh);
					delete("thtznewtbshcb",lxsh);
					delete("thtznewtbsjkxlx",lxsh);
					return true;
				}
				if("yh".equals(lxsh.getXmlx())&&"2".equals(lxsh.getJdbs())){
					delete("qxtzxzyhcb",lxsh);
					delete("thtzkxlx",lxsh);
					insert("thtzyhcb",lxsh);
					insert("tjtzkxlx",lxsh);
					delete("thtznewtbyhcb",lxsh);
					delete("thtznewtbsjkxlx",lxsh);
					return true;
				}
		
		return true;
	}

	@Override
	public Kxxyj querygkxmXX(Lxsh lxsh) {
		if("sjgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			return queryOne("querygkxmXXsj", lxsh);
		}
		if("lmgz".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			return queryOne("querygkxmXXlm", lxsh);
		}
		if("xj".equals(lxsh.getXmlx())&&"1".equals(lxsh.getJdbs())){
			return queryOne("querygkxmXXxj", lxsh);
		}
		return null;
	}
}
