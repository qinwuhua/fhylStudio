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
import com.hdsx.jxzhpt.wjxt.bean.Zdxx;
import com.hdsx.jxzhpt.wjxt.bean.Zhqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;
import com.hdsx.jxzhpt.wjxt.server.ZdxxServer;
import com.hdsx.jxzhpt.wjxt.server.ZhqkServer;

@Service
public class ZdxxServerImpl extends BaseOperate implements ZdxxServer {

	public ZdxxServerImpl() {
		super("zdxx", "jdbc");
	}

	@Override
	public boolean insertzdxx(Zdxx zdxx) {
		if(insert("insertzdxx", zdxx)>0){
			return true;
		}else
			return false;
	}

	@Override
	public int selectZdxxListCount(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryOne("selectZdxxListCount", zdxx);
	}

	@Override
	public List<Zdxx> selectZdxxList(Zdxx zdxx) {
		// TODO Auto-generated method stub
		return queryList("selectZdxxList", zdxx);
	}

	@Override
	public boolean updatezdxx(Zdxx zdxx) {
		if(insert("updatezdxx", zdxx)>0){
			return true;
		}else
			return false;
	}

	@Override
	public boolean deletezdxx(Zdxx zdxx) {
		if(insert("deletezdxx", zdxx)>0){
			return true;
		}else
			return false;
	}

	
}
