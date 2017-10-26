package com.hdsx.jxzhpt.qqgl.lxsh.server.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
import com.hdsx.jxzhpt.qqgl.lxsh.server.LxshServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.WnjhServer;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

@Service
public class LxshServerImpl extends BaseOperate implements LxshServer {

	public LxshServerImpl() {
		super("lxsh", "jdbc");
	}

	@Override
	public String selectXmbm(String str) {
		return queryOne("selectXmbm", str);
	}

	@Override
	public Lxsh selectbzcs(Lxsh lxsh) {
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
		if (insert("insertSjgz", lxsh) > 0) {
			insert("insertqqgllx", lxsh);
			update("updateqqgllx", lxsh);
			update("updatesffirst", lxsh);
			if("是".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("部分开展");
			}
			if("否".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("已开展");
			}
			update("updateqqglsj", lxsh);
			//更新历史记录数据
			List<Lxsh> lsjls=queryList("querywnlsjl", lxsh);
			lxsh.setBz("lxsh_sjgz");
			lxsh.setBzcs("wnjh_sjgz");
			String lsxmbm="";String lsxmid="";
			Integer num=0;
			for (int i = 0; i < lsjls.size(); i++) {
				Lxsh ls=lsjls.get(i);
				if (ls.getLsjl().equals("是")) {
					num++;
					lsxmbm+=ls.getLsxmbm()+",";
					lsxmid+=ls.getLsxmid()+",";
				}
			}
			if(num>0)lxsh.setLsjl("是");
			else lxsh.setLsjl("否");
			if(!lsxmbm.equals("")&&lsxmbm.substring(lsxmbm.length()-1, lsxmbm.length()).equals(","))
				lsxmbm=lsxmbm.substring(0, lsxmbm.length()-1);
			if(!lsxmid.equals("")&&lsxmid.substring(lsxmid.length()-1, lsxmid.length()).equals(","))
				lsxmid=lsxmid.substring(0, lsxmid.length()-1);
			lxsh.setLsxmbm(lsxmbm);
			lxsh.setLsxmid(lsxmid);
			update("updatesjgzls", lxsh);
			
			return true;
		} else
			return false;
	}
	
	@Override
	public boolean insertLmgz(Lxsh lxsh) {
		if (insert("insertLmgz", lxsh) > 0) {
			insert("insertqqgllx", lxsh);
			update("updateqqgllx", lxsh);
			if("是".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("部分开展");
			}
			if("否".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("已开展");
			}
			update("updateqqgllm", lxsh);
			lxsh.setBz("lxsh_lmgz");
			lxsh.setBzcs("wnjh_lmgz");
			update("updateqqglls", lxsh);
			
			
			return true;
		} else
			return false;
	}
	@Override
	public boolean insertXj(Lxsh lxsh) {
		if (insert("insertXj", lxsh) > 0) {
			insert("insertqqgllx", lxsh);
			update("updateqqgllx", lxsh);
			if("是".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("部分开展");
			}
			if("否".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("已开展");
			}
			update("updateqqglxj", lxsh);
			lxsh.setBz("lxsh_xj");
			lxsh.setBzcs("wnjh_xj");
			update("updateqqglls", lxsh);
			
			return true;
		} else
			return false;
	}
	@Override
	public List<Lxsh> selectSjgzList(Lxsh lxsh) {
		return queryList("selectSjgzList", lxsh);
	}

	@Override
	public int selectSjgzListCount(Lxsh lxsh) {
		return queryOne("selectSjgzListCount", lxsh);
	}

	@Override
	public List<Lxsh> selectSjgzlxList(Lxsh lxsh) {
		return queryList("selectSjgzlxList",lxsh);
	}

	@Override
	public int selectSjgzlxListCount(Lxsh lxsh) {
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
		String id=queryOne("querylxshlxid", lxsh);
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if(update("updateSjgz", lxsh)>0){
			if("是".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("部分开展");
			}
			if("否".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("已开展");
			}
			update("updateqqglsj", lxsh);
			//update("", parameter)
			return true;
		}
		else
		return false;
	}
	
	@Override
	public boolean updateLmgz(Lxsh lxsh) {
		//System.out.println("备注："+lxsh.getBz());
		update("updateSjgzlx", lxsh);
		String id=queryOne("querylxshlxid", lxsh);
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if(update("updateLmgz", lxsh)>0){
			if("是".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("部分开展");
			}
			if("否".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("已开展");
			}
			update("updateqqgllm", lxsh);
			return true;
		}
		else
		return false;
	}
	@Override
	public boolean updateXj(Lxsh lxsh) {
		update("updateSjgzlx", lxsh);
		String id=queryOne("querylxshlxid", lxsh);
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("deletelxcfld", lxsh);
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		Double bzcs=queryOne("queryMaxbzcs",lxsh);
		Double lc=queryOne("queryMaxlc",lxsh);
		if(lc!=null)
		lxsh.setLc(lc+"");
		if(bzcs!=null)
		lxsh.setBzys(bzcs+"");
		if(update("updateXj", lxsh)>0){
			if("是".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("部分开展");
			}
			if("否".equals(lxsh.getSfbflx())){
				lxsh.setSfbflx("已开展");
			}
			update("updateqqglxj", lxsh);
			return true;
		}
		else
		return false;
	}
	
	@Override
	public List<Lxsh> selectSjgzshList(Lxsh lxsh) {
		return queryList("selectSjgzshList", lxsh);
	}

	@Override
	public int selectSjgzshListCount(Lxsh lxsh) {
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
		if(deleteBatch("delSjgz", lm)>0&&deleteBatch("delSjgzlx", lm)>0){ 
			update("delwnsjgz", lxsh);
			
			return true;}
		else return false;
	}
	@Override
	public boolean delLmgz(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			update("delwnlm", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delLmgz", lm)>0&&deleteBatch("delSjgzlx", lm)>0){ 
			//updateBatch("delwnlm", lm);
			
			return true;}
		else return false;
	}
	@Override
	public boolean delXj(Lxsh lxsh) {
		String[] ids=lxsh.getXmbm().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < ids.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("xmbm", ids[i]);
			update("delwnxj", ids[i]);
			lm.add(hm);
		}
		if(deleteBatch("delXj", lm)>0&&deleteBatch("delSjgzlx", lm)>0){ 
			//updateBatch("delwnxj", lm);
			
			return true;}
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
					break;
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
					break;
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
					break;
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
		return queryList("selectLmgzList",lxsh);
	}

	@Override
	public int selectLmgzListCount(Lxsh lxsh) {
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
		return queryList("selectLmgzshList", lxsh);
	}

	@Override
	public int selectLmgzshListCount(Lxsh lxsh) {
		return queryOne("selectLmgzshListCount", lxsh);
	}

	@Override
	public List<Lxsh> selectXjList(Lxsh lxsh) {
		return queryList("selectXjList", lxsh);
	}

	@Override
	public int selectXjListCount(Lxsh lxsh) {
		return queryOne("selectXjListCount", lxsh);
	}

	@Override
	public List<Lxsh> selectXjshList(Lxsh lxsh) {
		return queryList("selectXjshList",lxsh);
	}

	@Override
	public int selectXjshListCount(Lxsh lxsh) {
		return queryOne("selectXjshListCount", lxsh);
	}

	@Override
	public List<Lxsh> qqglGpsroad(Lxsh lxsh) {
		hm = new HashMap<String, Object>();
		hm.put("xmmc", lxsh.getXmmc());
		hm.put("xzqh", lxsh.getXzqh());
		hm.put("xmlx", lxsh.getXmlx());
		hm.put("xmbm", lxsh.getXmbm());
		return queryList("qqglGpsroad", hm);

	}

	@Override
	public boolean insertLx(Lxsh lxsh) {
		String id=MyUtil.getUuid();
		lxsh.setId(id);
		if(!"".equals(lxsh.getGxlxbm())&&lxsh.getGxlxbm()!=null){
			MyUtil.insertMethd("insertlxcfld", lxsh);
		}
		if(insert("insertLx", lxsh)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteLx(Lxsh lxsh) {
		if(insert("deleteLx", lxsh)>0){
			return true;
			/*Double bzcs=queryOne("queryMaxbzcs",lxsh);
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
			}*/
		}
		return false;
	}

	@Override
	public Lxsh cxqdmc(Lxsh lxsh) {
		return queryOne("cxqdmc", lxsh);
	}

	@Override
	public Lxsh cxzdmc(Lxsh lxsh) {
		return queryOne("cxzdmc", lxsh);
	}

	@Override
	public Lxsh sfylx(Lxsh lxsh) {
		return queryOne("sfylx", lxsh);
	}

	@Override
	public Lxsh qqglGpszh(Lxsh lxsh) {
		return queryOne("qqglGpszh", lxsh);
	}

	@Override
	public List<Lxsh> selectlxbyxmid1(Lxsh lxsh) {
		return queryList("selectlxbyxmid1", lxsh);
	}

	@Override
	public List<Excel_list> querylxshSjgz(Lxsh lxsh) {
		return queryList("querylxshSjgz", lxsh);
	}
	@Override
	public List<Excel_list> querylxshgsd(Lxsh lxsh) {
		return queryList("querylxshgsd", lxsh);
	}
	@Override
	public List<Excel_list> querylxshLmgz(Lxsh lxsh) {
		return queryList("querylxshLmgz", lxsh);
	}

	@Override
	public List<Excel_list> querylxshXj(Lxsh lxsh) {
		return queryList("querylxshXj", lxsh);
	}

	@Override
	public List<Excel_list> querykxxSjgz(Lxsh lxsh) {
		return queryList("querykxxSjgz", lxsh);
	}

	@Override
	public List<Excel_list> querykxxgsd(Lxsh lxsh) {
		return queryList("querykxxgsd", lxsh);
	}
	
	@Override
	public List<Excel_list> querykxxLmgz(Lxsh lxsh) {
		return queryList("querykxxLmgz", lxsh);
	}

	@Override
	public List<Excel_list> querykxxXj(Lxsh lxsh) {
		return queryList("querykxxXj", lxsh);
	}

	@Override
	public List<Wqbzbz> selectWqbzbz() {
		return queryList("selectWqbzbz");
	}

	@Override
	public boolean importsjgzlxsh(List<Map> data) {
		if(insertBatch("importsjgzlxshlx", data)==data.size()&&insertBatch("importsjgzlxsh", data)==data.size())
		return true;
		else return false;
	}
	
	@Override
	public boolean importlmgzlxsh(List<Map> data) {
		if(insertBatch("importlmgzlxshlx", data)==data.size()&&insertBatch("importlmgzlxsh", data)==data.size())
		return true;
		else return false;
	}
	
	@Override
	public boolean importxjlxsh(List<Map> data) {
		if(insertBatch("importxjlxshlx", data)==data.size()&&insertBatch("importxjlxsh", data)==data.size())
		return true;
		else return false;
	}

	@Override
	public String selectimportXmbm(String tiaojian) {
		return queryOne("selectimportXmbm", tiaojian);
	}

	@Override
	public boolean tjwqbzbz(Wqbzbz wqbzbz) {
		return insert("tjwqbzbz", wqbzbz)==1;
	}

	@Override
	public boolean xgwqbzbz(Wqbzbz wqbzbz) {
		return update("xgwqbzbz", wqbzbz)==1;
	}

	@Override
	public boolean delwqbzbz(Wqbzbz wqbzbz) {
		return delete("delwqbzbz", wqbzbz)==1;
	}

	@Override
	public List<Kxxyj> queryXmQqfx(Map<String, String> params) {
		return queryList("queryXmQqfx",params);
	}

	@Override
	public List<Map<String, String>> queryBeformXm(String lxbms) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("lxbm", lxbms);
		return queryList("queryBeformXm",params);
	}

	@Override
	public List<Map<String, String>> queryBeformXmByXzqh(String xz,String xzqhmc) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("xzqhdm", xz);
		params.put("xzqhmc", xzqhmc);
		return queryList("queryBeformXmByXzqh",params);
	}

	@Override
	public List<Map<String, String>> queryNdwg(String xmbm) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("xmbm", xmbm);
		return queryList("queryNdwg",params);
	}

	@Override
	public List<Map<String, String>> queryNdwgXzqh(String xmbm,boolean qb) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("xmbm", xmbm);
		params.put("qb", qb);
		return queryList("queryNdwgXzqh",params);
	}

	@Override
	public Map<String, String> queryLxshLjLmsj(Lxsh lxsh) {
		return queryOne("queryLxshLjLmsj",lxsh);
	}
	@Override
	public Map<String, String> queryLxshLjgsd(Lxsh lxsh) {
		return queryOne("queryLxshLjgsd",lxsh);
	}
	
	@Override
	public Map<String, String> queryLxshShLjLmsj(Lxsh lxsh) {
		return queryOne("queryLxshShLjLmsj",lxsh);
	}

	@Override
	public Map<String, String> queryLxshLjLmgz(Lxsh lxsh) {
		return queryOne("queryLxshLjLmgz",lxsh);
	}

	@Override
	public Map<String, String> queryLxshLjXj(Lxsh lxsh) {
		return queryOne("queryLxshLjXj",lxsh);
	}

	@Override
	public Map<String, String> queryLxshShLjLmgz(Lxsh lxsh) {
		return queryOne("queryLxshShLjLmgz",lxsh);
	}

	@Override
	public Map<String, String> queryLxshShLjXj(Lxsh lxsh) {
		return queryOne("queryLxshShLjXj",lxsh);
	}

	@Override
	public Lxsh loadjsdjcd(Lxsh lxsh) {
		return queryOne("loadjsdjcd", lxsh);
	}

	@Override
	public boolean thxmsqsh(Lxsh lxsh) {
		String str="xmbm in ("+lxsh.getXmbm()+")";
		if("yhdzx".equals(lxsh.getBz())){
			return update("thxmsqshyh", str)>0;
		}else if ("yhzx".equals(lxsh.getBz())) {
			return update("thxmsqshyhzx", str)>0;
		}else{
			return update("thxmsqshsh", str)>0;
		}
	}

	@Override
	public List<Wqbzbz> selectYbmrsjd(Wqbzbz wqbzbz) {
		return queryList("selectYbmrsjd", wqbzbz);
	}

	@Override
	public boolean xgybmrsjd(Wqbzbz wqbzbz) {
		return update("xgybmrsjd", wqbzbz)==1;
	}
	
	@Override
	public List<Wqbzbz> selectYbsjd(Wqbzbz wqbzbz) {
		return queryList("selectYbsjd", wqbzbz);
	}

	@Override
	public boolean tjybsjd(Wqbzbz wqbzbz) {
		return insert("tjybsjd",wqbzbz)==1;
	}
	
	@Override
	public boolean xgybsjd(Wqbzbz wqbzbz) {
		return update("xgybsjd",wqbzbz)==1;
	}

	@Override
	public boolean delybsjd(Wqbzbz wqbzbz) {
		return delete("delybsjd", wqbzbz)==1;
	}

	@Override
	public boolean cxsfcgsjd(Wqbzbz wqbzbz) {
		try {
		Wqbzbz w1=queryOne("cxybsjd1", wqbzbz);
		if(w1==null){
			w1=queryOne("cxybsjd2", wqbzbz);
			w1.setJzsj(wqbzbz.getNf1()+"-"+wqbzbz.getYf1()+"-"+w1.getJzsj());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d1=null;
		Date d2=null;
		
			d1=sdf.parse(w1.getJzsj());
			d2=sdf.parse(wqbzbz.getNf()+"-"+wqbzbz.getYf()+"-"+wqbzbz.getJzsj());
		
		if(d1.before(d2))
			wqbzbz.setQllx("1");
		else
			wqbzbz.setQllx("0");
		return update("cxsfcgsjd", wqbzbz)==1;
		
		} catch (ParseException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean qxxmgj(Lxsh lxsh) {
		if(insert("qxxmgj", lxsh)>0)
		return delete("qxxmgjdel",lxsh)==1;
		else {
			return false;
		}
	}

	@Override
	public boolean qxxmlm(Lxsh lxsh) {
		if(insert("qxxmlm", lxsh)>0)
			return delete("qxxmlmdel",lxsh)==1;
			else {
				return false;
			}
	}

	@Override
	public boolean qxxmxj(Lxsh lxsh) {
		if(insert("qxxmxj", lxsh)>0)
			return delete("qxxmxjdel",lxsh)==1;
			else {
				return false;
			}
	}

	@Override
	public boolean qxxmyh(Lxsh lxsh) {
		if(insert("qxxmyh", lxsh)>0)
			return delete("qxxmyhdel",lxsh)==1;
			else {
				return false;
			}
	}

	@Override
	public boolean qxxmzh(Lxsh lxsh) {
		if(insert("qxxmzh", lxsh)>0)
			return delete("qxxmzhdel",lxsh)==1;
			else {
				return false;
			}
	}
	
	@Override
	public boolean qxxmgj1(Lxsh lxsh) {
		if(insert("qxxmgj1", lxsh)>0)
		return delete("qxxmgjdel1",lxsh)==1;
		else {
			return false;
		}
	}

	@Override
	public boolean qxxmlm1(Lxsh lxsh) {
		if(insert("qxxmlm1", lxsh)>0)
			return delete("qxxmlmdel1",lxsh)==1;
			else {
				return false;
			}
	}

	@Override
	public boolean qxxmxj1(Lxsh lxsh) {
		if(insert("qxxmxj1", lxsh)>0)
			return delete("qxxmxjdel1",lxsh)==1;
			else {
				return false;
			}
	}

	@Override
	public boolean qxxmyh1(Lxsh lxsh) {
		if(insert("qxxmyh1", lxsh)>0)
			return delete("qxxmyhdel1",lxsh)==1;
			else {
				return false;
			}
	}

	@Override
	public boolean qxxmzh1(Lxsh lxsh) {
		if(insert("qxxmzh1", lxsh)>0)
			return delete("qxxmzhdel1",lxsh)==1;
			else {
				return false;
			}
	}

	@Override
	public List<Lxsh> selectgsdgzList(Lxsh lxsh) {
		return queryList("selectgsdgzList", lxsh);
	}

	@Override
	public int selectgsdgzListCount(Lxsh lxsh) {
		return queryOne("selectgsdgzListCount", lxsh);
	}

	@Override
	public List<Wqbzbz> selectWqjlbz() {
		return queryList("selectWqjlbz");
	}

	@Override
	public boolean thwshlxsh(Lxsh lxsh) {
		String bz="";String kxx="";String sfkth="";
		if("1".equals(lxsh.getXmlx())){
			sfkth="cbsj_sjgz";
			bz="lxsh_sjgz";
			kxx="kxxyj_sjgz";
			lxsh.setJdbs("1");
		}
		if("2".equals(lxsh.getXmlx())){
			sfkth="cbsj_lmgz";
			bz="lxsh_lmgz";
			kxx="kxxyj_lmgz";
			lxsh.setJdbs("1");
		}
		if("3".equals(lxsh.getXmlx())){
			sfkth="cbsj_xj";
			bz="lxsh_xj";
			kxx="kxxyj_xj";
			lxsh.setJdbs("1");
		}
		if("4".equals(lxsh.getXmlx())){
			sfkth="jhsh_yhdzx";
			bz="xmsq_yhdzx";
			kxx="cbsj_yhdzx";
			lxsh.setJdbs("2");
		}
		if("5".equals(lxsh.getXmlx())){
			/*sfkth="cbsj_sh";
			bz="xmsq_sh";
			kxx="kxxyj_sh";
			lxsh.setJdbs("1");
			以上内容为三个流程的，立项工可初步，删掉后下边为两个流程，到时候可能用注释掉的这个。
			*/
			
			sfkth="jhsh_sh";
			bz="xmsq_sh";
			kxx="cbsj_sh";
			lxsh.setJdbs("2");
		}
		lxsh.setBzcs(sfkth);
		
		List<Lxsh> l = queryList("sfkythlxwsh",lxsh);
		if(l.size()>0)
			return false;
		
		if("5".equals(lxsh.getXmlx())||"4".equals(lxsh.getXmlx())){
			lxsh.setBz(bz);
			lxsh.setBzcs(kxx);
			return update("thwshlxsh45", lxsh)>0&&delete("thwshlxshkxx", lxsh)>0&&delete("thwshlxshkxxlx", lxsh)>0;
		}else{
			
			lxsh.setBz(bz);
			lxsh.setBzcs(kxx);
			return update("thwshlxsh", lxsh)>0&&delete("thwshlxshkxx", lxsh)>0&&delete("thwshlxshkxxlx", lxsh)>0;

		}
	}

	@Override
	public boolean thlxshsb(Lxsh lxsh) {
		String bz="";
		if("1".equals(lxsh.getXmlx())){
			bz="lxsh_sjgz";
		}
		if("2".equals(lxsh.getXmlx())){
			bz="lxsh_lmgz";
		}
		if("3".equals(lxsh.getXmlx())){
			bz="lxsh_xj";
		}
		if("4".equals(lxsh.getXmlx())){
			bz="xmsq_yhdzx";
		}
		if("5".equals(lxsh.getXmlx())){
			bz="xmsq_sh";
		}
		if("".equals(bz))
		return false;
		else{
			lxsh.setBz(bz);
			if("1".equals(lxsh.getXmlx())||"2".equals(lxsh.getXmlx())||"3".equals(lxsh.getXmlx()))
			return update("thlxshsbgsd", lxsh)>0;
			else
			return update("thlxshsbyhsh", lxsh)>0;
		}
			
	}
	
	@Override
	public boolean thlxshsbyhc(Lxsh lxsh) {
		String bz="";
		if("1".equals(lxsh.getXmlx())){
			bz="lxsh_sjgz";
		}
		if("2".equals(lxsh.getXmlx())){
			bz="lxsh_lmgz";
		}
		if("3".equals(lxsh.getXmlx())){
			bz="lxsh_xj";
		}
		if("4".equals(lxsh.getXmlx())){
			bz="xmsq_yhdzx";
		}
		if("5".equals(lxsh.getXmlx())){
			bz="xmsq_sh";
		}
		if("".equals(bz))
		return false;
		else{
			lxsh.setBz(bz);
			if("1".equals(lxsh.getXmlx())||"2".equals(lxsh.getXmlx())||"3".equals(lxsh.getXmlx()))
			return update("thlxshsbgsd", lxsh)>0;
			else
			return update("thlxshsbyhshyhc", lxsh)>0;
		}
			
	}

	@Override
	public boolean qxxm(Lxsh lxsh) {
		if(lxsh.getXmbm().substring(10,11).equals("4")){
			return  insert("qxxm", lxsh.getTj1())>0
					&& insert("qxxm", lxsh.getTj2())>0
					&& insert("qxxm", lxsh.getTj4())>0
					&& delete("qxxm", lxsh.getTj5())>0
					&& delete("qxxm", lxsh.getTj6())>0
					&& delete("qxxm", lxsh.getTj8())>0;
		}
		else if(lxsh.getXmbm().substring(10,11).equals("5")){
			return  insert("qxxm", lxsh.getTj1())>0
					&& insert("qxxm", lxsh.getTj2())>0
					&& insert("qxxm", lxsh.getTj4())>0
					&& delete("qxxm", lxsh.getTj5())>0
					&& delete("qxxm", lxsh.getTj6())>0
					&& delete("qxxm", lxsh.getTj8())>0;
		}
		else{
			return  insert("qxxm", lxsh.getTj1())>0
			&& insert("qxxm", lxsh.getTj2())>0
			&& insert("qxxm", lxsh.getTj3())>0
			&& insert("qxxm", lxsh.getTj4())>0
			&& delete("qxxm", lxsh.getTj5())>0
			&& delete("qxxm", lxsh.getTj6())>0
			&& delete("qxxm", lxsh.getTj7())>0
			&& delete("qxxm", lxsh.getTj8())>0;
		}
		//return insert("qxxm", lxsh.getBz())>0&&delete("qxxm", lxsh.getBzcs())>0;
	}
	
	@Override
	public Lxsh hbxmSjgzlx(Lxsh lxsh) {
		hm = new HashMap<String, Object>();
		hm.put("xmlx", lxsh.getXmlx());
		hm.put("xmbm", lxsh.getXmbm());
		List<Lxsh> list=queryList("qqglGpsroad", hm);
		Lxsh l=new Lxsh();
		l=list.get(0);
		if (list.size()>1) {
			Double tz = 0.0;Double yhdk=0.0;Double bzys=0.0;Double dfzc=0.0;
			String bz="";String tsdq="";String xzqhdm="";
			for (int i = 0; i < list.size(); i++) {
				Lxsh x=list.get(i);
				if(x.getTz()!=null&&!x.getTz().equals(""))
				tz=tz+Double.valueOf(x.getTz());
				if(x.getYhdk()!=null&&!x.getYhdk().equals(""))
				yhdk=yhdk+Double.valueOf(x.getYhdk());
				if(x.getBzys()!=null&&!x.getBzys().equals(""))
				bzys=bzys+Double.valueOf(x.getBzys());
				if(x.getDfzc()!=null&&!x.getDfzc().equals(""))
				dfzc=dfzc+Double.valueOf(x.getDfzc());
				bz+=x.getBz();
				if (x.getTsdq()!=null&&!x.getTsdq().equals("")) {
					tsdq+=x.getTsdq()+",";
				}
				xzqhdm+=x.getXzqhdm2()+",";
			}
			if (!tsdq.equals("")&&tsdq.substring(tsdq.length()-1,tsdq.length()).equals(",")) {
				tsdq=tsdq.substring(0, tsdq.length()-1);
				//特殊地区去重
				String[] arrTsdq = tsdq.split(",");  
		        Set<String> set = new HashSet<String>();  
		        for(int i=0;i<arrTsdq.length;i++){  
		            set.add(arrTsdq[i]);  
		        }  
		        String[] arrayResult = (String[]) set.toArray(new String[set.size()]);  
		        tsdq=StringUtils.join(arrayResult, ",");
			}
			if(!xzqhdm.equals("")&&xzqhdm.substring(xzqhdm.length()-1, xzqhdm.length()).equals(",")){
				xzqhdm=xzqhdm.substring(0, xzqhdm.length()-1);
				//行政区划去重
				String[] arrXzqh = xzqhdm.split(",");  
		        Set<String> set = new HashSet<String>();  
		        for(int i=0;i<arrXzqh.length;i++){  
		            set.add(arrXzqh[i]);  
		        }  
		        String[] arrayResult = (String[]) set.toArray(new String[set.size()]);  
		        xzqhdm=StringUtils.join(arrayResult, ",");
			}
			 
			l.setTz(tz.toString());
			l.setYhdk(yhdk.toString());
			l.setBzys(bzys.toString());
			l.setDfzc(dfzc.toString());
			l.setBz(bz);
			l.setTsdq(tsdq);
			l.setXzqhdm2(xzqhdm);
		}
		return l;
	}
	
	@Override
	public Lxsh loadjsdj(Lxsh lxsh) {
		return queryOne("loadjsdj", lxsh);
	}
}
