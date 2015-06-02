package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.CbsjLmsj;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
@Service
public class CbsjServerImpl extends BaseOperate implements CbsjServer {
	public CbsjServerImpl(){
		super("cbsj", "jdbc");
	}
	private Map<String, Object> params=new HashMap<String, Object>();
	@Override
	public List<CbsjLmsj> queryCbsjLmsj(CbsjLmsj lmsj, int page, int rows) {
		params.put("lmsj", lmsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjLmsj",params);
	}
	@Override
	public int queryCbsjLmsjCount(CbsjLmsj lmsj) {
		params.put("lmsj", lmsj);
		return queryOne("queryCbsjLmsjCount", params);
	}

}
