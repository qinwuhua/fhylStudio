package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglaqybServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
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

}
