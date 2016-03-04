package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcgl_jgys;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcgltz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglaqybServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.wjxt.bean.Wjgl;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

@Service
public class GcglaqybServerImpl extends BaseOperate implements GcglaqybServer {

	public GcglaqybServerImpl() {
		super("gcglaqyb", "jdbc");
	}

	@Override
	public Boolean insertAqybb(Gcglaqyb gcglaqyb) {
	//	System.out.println(gcglaqyb);
		if(insert("insertAqybb", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public int selectaqyblistCount(Gcglaqyb gcglaqyb) {
		return queryOne("selectaqyblistCount", gcglaqyb);
	}

	@Override
	public List<Gcglaqyb> selectaqyblist(Gcglaqyb gcglaqyb) {
		// TODO Auto-generated method stub
		return queryList("selectaqyblist",gcglaqyb);
	}

	@Override
	public List<TreeNode> selAllBm3(String yhdw) {
		return queryList("selAllBm3", yhdw);
	}

	@Override
	public boolean uploadAqybFile(Gcglaqyb gcglaqyb) {
		if(insert("uploadAqybFile", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglaqyb selectAqybById(Gcglaqyb gcglaqyb) {
		// TODO Auto-generated method stub
		return queryOne("selectAqybById", gcglaqyb);
	}

	@Override
	public Boolean insertAqybb1(Gcglaqyb gcglaqyb) {
		if(insert("insertAqybb1", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadAqybFile1(Gcglaqyb gcglaqyb) {
		if(insert("uploadAqybFile1", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean deleteAqybb(Gcglaqyb gcglaqyb) {
		if(delete("deleteAqybb", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadMbglFile(Gcglaqyb gcglaqyb) {
		if(insert("uploadMbglFile", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean uploadMbglFile1(Gcglaqyb gcglaqyb) {
		if(insert("uploadMbglFile1", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Boolean insertMbgl(Gcglaqyb gcglaqyb) {
		if(insert("insertMbgl", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Boolean insertMbgl1(Gcglaqyb gcglaqyb) {
		if(insert("insertMbgl1", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectmbgllistCount(Gcglaqyb gcglaqyb) {
		// TODO Auto-generated method stub
		return queryOne("selectmbgllistCount", gcglaqyb);
	}

	@Override
	public List<Gcglaqyb> selectmbgllist(Gcglaqyb gcglaqyb) {
		// TODO Auto-generated method stub
		return queryList("selectmbgllist",gcglaqyb);
	}

	@Override
	public Gcglaqyb selectMbglById(Gcglaqyb gcglaqyb) {
		// TODO Auto-generated method stub
		return queryOne("selectMbglById", gcglaqyb);
	}

	@Override
	public boolean deleteMbgl(Gcglaqyb gcglaqyb) {
		if(delete("deleteMbgl", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadTzFile(Gcgltz gcgltz) {
		if(insert("uploadTzFile", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertTz1(Gcgltz gcgltz) {
		if(insert("insertTz1", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertTz(Gcgltz gcgltz) {
		if(insert("insertTz", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteTzfile(Gcgltz gcgltz) {
		if(delete("deleteTzfile", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteTzfile1(Gcgltz gcgltz) {
		Gcgltz gcgltz1=queryOne("queryTzbyId", gcgltz);
		if(gcgltz1==null)
		delete("deleteTzfile1", gcgltz);
		return true;
	}

	@Override
	public int selectxxtzlistCount(Gcgltz gcgltz) {
		// TODO Auto-generated method stub
		return queryOne("selectxxtzlistCount", gcgltz);
	}

	@Override
	public List<Gcgltz> selectxxtzlist(Gcgltz gcgltz) {
		// TODO Auto-generated method stub
		return queryList("selectxxtzlist",gcgltz);
	}

	@Override
	public Gcgltz selecttzById(Gcgltz gcgltz) {
		return queryOne("queryTzbyId", gcgltz);
	}

	@Override
	public List<Gcgltz> selectTzfile(Gcgltz gcgltz) {
		return queryList("selectTzfile", gcgltz);
	}

	@Override
	public Boolean deleteTzByid(Gcgltz gcgltz) {
		if(delete("deleteTzByid", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteTzByid1(Gcgltz gcgltz) {
		gcgltz.setTzid(gcgltz.getId());
		if(delete("deleteTzByid", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertTzck(Gcgltz gcgltz) {
		if(update("updateTzfszt", gcgltz)>0 && insert("insertTzck", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectxxtzlist1Count(Gcgltz gcgltz) {
		// TODO Auto-generated method stub
		return queryOne("selectxxtzlistCount1", gcgltz);
	}

	@Override
	public List<Gcgltz> selectxxtzlist1(Gcgltz gcgltz) {
		// TODO Auto-generated method stub
		return queryList("selectxxtzlist1",gcgltz);
	}

	@Override
	public Boolean deleteTzckByid(Gcgltz gcgltz) {
		
		gcgltz.setTzid(gcgltz.getId());
		List<Gcgltz> list=queryList("selecttzbytzid",gcgltz);
		if(list.size()==0){
			if(delete("deleteTzByid1", gcgltz)>0){
				return true;
			}else{
				return false;
			}
		}else{
			if(delete("deleteTzByid1", gcgltz)>0 && delete("deleteTzfile1", gcgltz)>0){
				return true;
			}else{
				return false;
			}
		}
		
	}

	@Override
	public Boolean xgTzzt(Gcgltz gcgltz) {
		if(update("xgTzzt", gcgltz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcgltz selectxxtzById(Gcgltz gcgltz) {
		
		return queryOne("selectxxtzById", gcgltz);
	}

	@Override
	public List<TreeNode> selAllXzqh1(String yhdw) {
		// TODO Auto-generated method stub
		return queryList("selAllXzqh1", yhdw);
	}
	@Override
	public List<TreeNode> selAllXzqh11(String yhdw) {
		// TODO Auto-generated method stub
		return queryList("selAllXzqh11", yhdw);
	}
	@Override
	public List<TreeNode> selAllUnit1(String yhdw) {
		// TODO Auto-generated method stub
		return queryList("selAllUnit1", yhdw);
	}
	@Override
	public List<TreeNode> selAllUnit11(String yhdw) {
		// TODO Auto-generated method stub
		return queryList("selAllUnit11", yhdw);
	}
	@Override
	public int selectmbgllistCount1(Gcglaqyb gcglaqyb) {
		// TODO Auto-generated method stub
		return queryOne("selectmbgllistCount1", gcglaqyb);
	}

	@Override
	public List<Gcglaqyb> selectmbgllist1(Gcglaqyb gcglaqyb) {
		// TODO Auto-generated method stub
		return queryList("selectmbgllist1", gcglaqyb);
	}

	@Override
	public boolean updateSGXK(Gcgl_jgys gcgl_jgys) {
		if(insert("insertSgxk", gcgl_jgys)>0){
			return true;
		}else return false;
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
	public boolean insertJGYS(Gcgl_jgys gcgl_jgys) {
		Gcgl_jgys gcgl_jgys1=queryOne("queryJGYS", gcgl_jgys);
		if(gcgl_jgys1==null){
			if(gcgl_jgys.getNsqsjjlzj()==null){
				if(insert("insertJGYS", gcgl_jgys)>0){
					return true;
				}else return false;
			}else{
				if(insert("insertJGYS1", gcgl_jgys)>0){
					return true;
				}else return false;
			}
		}else{
			if(gcgl_jgys1.getBcdwcd()!=null){
				if(Integer.parseInt(gcgl_jgys1.getBcdwcd()) < Integer.parseInt(gcgl_jgys.getBcdwcd())){
					gcgl_jgys.setBcdwcd(gcgl_jgys1.getBcdwcd());
				}
			}
			if(update("updateJGYS", gcgl_jgys)>0){
				return true;
			}else return false;
		}
		
	}

	@Override
	public Gcgl_jgys queryJGYS(Gcgl_jgys gcgl_jgys) {
		// TODO Auto-generated method stub
		return queryOne("queryJGYS", gcgl_jgys);
	}

	@Override
	public boolean loadWqgzwgzp(Gcgl_jgys gcgl_jgys) {
		List<Plan_upload> l=queryList("loadWqgzwgzp",gcgl_jgys);
		if(l.size()>0)
			return true;
		return false;
	}

	@Override
	public Wjgl selectzcwjById(Gcgltz gcgltz) {
		return queryOne("selectzcwjById", gcgltz);
	}
	@Override
	public Wjgl selectqtwjById(Gcgltz gcgltz) {
		return queryOne("selectqtwjById", gcgltz);
	}

	@Override
	public Cbsj querysjsgtByXmbm(Cbsj cbsj) {
		return queryOne("querysjsgtByXmbm", cbsj);
	}

	@Override
	public Cbsj queryxjsgtByXmbm(Cbsj cbsj) {
		return queryOne("queryxjsgtByXmbm", cbsj);
	}
}
