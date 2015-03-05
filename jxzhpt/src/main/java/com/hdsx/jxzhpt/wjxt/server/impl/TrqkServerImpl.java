package com.hdsx.jxzhpt.wjxt.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.wjxt.bean.Trqk;
import com.hdsx.jxzhpt.wjxt.server.TrqkServer;

@Service
public class TrqkServerImpl extends BaseOperate implements TrqkServer {

	public TrqkServerImpl() {
		super("trqk", "jdbc");
	}

	@Override
	public Boolean insertTrqk(Trqk trqk) {
		if(insert("insertTrqk", trqk)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectTrqkListCount(Trqk trqk) {
		// TODO Auto-generated method stub
		return queryOne("selectTrqkListCount", trqk);
	}

	@Override
	public List<Trqk> selectTrqkList(Trqk trqk) {
		// TODO Auto-generated method stub
		return queryList("selectTrqkList",trqk);
	}

	
}
