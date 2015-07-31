package com.hdsx.jxzhpt.wjxt.server.impl;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhz;
import com.hdsx.jxzhpt.wjxt.bean.Jtlhzgd;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.bean.Wjgl;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.WjglServer;

@Service
public class WjglServerImpl extends BaseOperate implements WjglServer {

	public WjglServerImpl() {
		super("wjgl", "jdbc");
	}

	@Override
	public boolean uploadWjFile(Wjgl wjgl) {
		return insert("uploadWjFile", wjgl)==1;
	}

	@Override
	public boolean deleteWjfile(Wjgl wjgl) {
		return delete("deleteWjfile", wjgl)==1;
	}

	@Override
	public boolean deleteWjfile1(String id) {
		Wjgl wjgl=queryOne("selectzcwjbyid", id);
		if(wjgl==null)
		delete("deleteWjfile1",id);
		return true;
	}

	@Override
	public boolean insertZcwj(Wjgl wjgl) {
		return insert("insertZcwj", wjgl)==1;
	}

	@Override
	public List<Wjgl> selectzcwjlist(Wjgl wjgl) {
		return queryList("selectzcwjlist", wjgl);
	}

	@Override
	public int selectzcwjlistCount(Wjgl wjgl) {
		return queryOne("selectzcwjlistCount", wjgl);
	}

	@Override
	public List<Wjgl> selectWjfile(Wjgl wjgl) {
		return queryList("selectWjfile",wjgl);
	}

	@Override
	public Wjgl selectWjById(Wjgl wjgl) {
		// TODO Auto-generated method stub
		return queryOne("selectWjById", wjgl);
	}

	@Override
	public boolean updateZcwj(Wjgl wjgl) {
		// TODO Auto-generated method stub
		return update("updateZcwj", wjgl)==1;
	}

	@Override
	public boolean deleteZcwj(Wjgl wjgl) {
		if(delete("deleteZcwj",wjgl)==1){
			delete("deleteWjfile1", wjgl.getId());
			return true;
		}
		return false;
	}

	@Override
	public boolean insertQtwj(Wjgl wjgl) {
		return insert("insertQtwj", wjgl)==1;
	}

	@Override
	public List<Wjgl> selectqtwjlist(Wjgl wjgl) {
		return queryList("selectqtwjlist", wjgl);
	}

	@Override
	public int selectqtwjlistCount(Wjgl wjgl) {
		return queryOne("selectqtwjlistCount", wjgl);
	}

	@Override
	public boolean deleteQtWjfile1(String id) {
		Wjgl wjgl=queryOne("selectqtwjbyid", id);
		if(wjgl==null)
		delete("deleteWjfile1",id);
		return true;
	}

	@Override
	public boolean updateQtwj(Wjgl wjgl) {
		return update("updateQtwj", wjgl)==1;
	}

	@Override
	public boolean deleteQtwj(Wjgl wjgl) {
		if(delete("deleteQtwj",wjgl)==1){
			delete("deleteWjfile1", wjgl.getId());
			return true;
		}
		return false;
	}

	
}
