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
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

@Service
public class ZhqkServerImpl extends BaseOperate implements ZhqkServer {

	public ZhqkServerImpl() {
		super("zhqk", "jdbc");
	}

	@Override
	public boolean insertzhqk(Zhqk zhqk) {
		if(insert("insertzhqk",zhqk)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectZhqkListCount(Zhqk zhqk) {
		// TODO Auto-generated method stub
		return queryOne("selectZhqkListCount", zhqk);
	}

	@Override
	public List<Zhqk> selectZhqkList(Zhqk zhqk) {
		// TODO Auto-generated method stub
		return queryList("selectZhqkList",zhqk);
	}

	@Override
	public boolean deletezhqk(Zhqk zhqk) {
		if(delete("deletezhqk",zhqk)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updatezhqk(Zhqk zhqk) {
		if(update("updatezhqk",zhqk)>0){
			return true;
		}else{
			return false;
		}
	}

	
}
