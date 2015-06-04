package com.hdsx.jxzhpt.qqgl.server.impl;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
@Service
public class jhshServerImpl extends BaseOperate implements JhshServer {
	public jhshServerImpl(){
		super("jhsh", "jdbc");
	}
	@Override
	public boolean insertJhshLmsjFromCbsj(String xmbm) {
		return false;
	}

}
