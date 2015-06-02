package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
@Service
public class CbsjServerImpl extends BaseOperate implements CbsjServer {
	public CbsjServerImpl(){
		super("cbsj", "jdbc");
	}
	private Map<String, Object> params=new HashMap<String, Object>();
	@Override
	public List<Cbsj> queryCbsjLmgz(Cbsj lmsj, int page, int rows) {
		params.put("lmsj", lmsj);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryCbsjLmgz",params);
	}
	@Override
	public int queryCbsjLmgzCount(Cbsj lmsj) {
		params.put("lmsj", lmsj);
		return queryOne("queryCbsjLmgzCount", params);
	}
	@Override
	public Cbsj queryCbsjLmgzByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryOne("queryCbsjLmgzByXmbm",params);
	}
	@Override
	public boolean updateCbsjLmgz(Cbsj cbsj) {
		return update("updateCbsjLmgz",cbsj)>0;
	}
	@Override
	public boolean insertFile(Plan_upload uploads) {
		return insert("insertFile", uploads)>0;
	}
	@Override
	public List<Plan_upload> queryFileByXmbm(String xmbm) {
		params.put("xmbm", xmbm);
		return queryList("queryFileByXmbm",params);
	}
	@Override
	public boolean deleteLmgzByXmbm(String xmbm) {
		System.out.println("项目编码："+xmbm);
		String[] split = xmbm.split(",");
		List<Cbsj> list=new ArrayList<Cbsj>();
		for (String string : split) {
			Cbsj obj=new Cbsj();
			obj.setXmbm(string);
			list.add(obj);
		}
		return deleteBatch("deleteLmgzByXmbm",list)==list.size();
	}

}
