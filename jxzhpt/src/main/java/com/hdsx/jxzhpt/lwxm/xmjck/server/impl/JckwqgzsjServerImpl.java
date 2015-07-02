package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
@Service
public class JckwqgzsjServerImpl extends BaseOperate implements JckwqgzsjServer {
	public JckwqgzsjServerImpl() {
		super("jckwqgzsj", "jdbc");
	}

	@Override
	public boolean deleteqlzpbyxmbm(Jckwqgzsj jckwqgzsj) {
		if(delete("deleteqlzpbyxmbm",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public boolean insertWqgz(Jckwqgzsj jckwqgzsj) {
		if(insert("insertWqgz",jckwqgzsj)>0)
			return true;
		else return false;
	}

	@Override
	public List<Jckwqgzsj> selectWqgzList(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzList",jckwqgzsj);
	}

	@Override
	public int selectWqgzCount(Jckwqgzsj jckwqgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzCount", jckwqgzsj);
	}

}
