package com.hdsx.jxzhpt.gcgl.server.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
@Service
public class GcglwqgzServerImpl extends BaseOperate implements GcglwqgzServer {

	public GcglwqgzServerImpl() {
		super("gcglwqgz", "jdbc");
	}

	@Override
	public Boolean insertWqgzYb(Gcglwqgz gcglwqgz) {
		Gcglwqgz gcglwqgz1=queryOne("queryYbByYf", gcglwqgz);
		if(gcglwqgz1!=null){
			return false;
		}
		gcglwqgz.setShzt("未审核");
		if(insert("insertWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzYbByJhidCount(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzYbByJhidCount", gcglwqgz);
	}

	@Override
	public List<Gcglwqgz> selectWqgzYbByJhid(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzYbByJhid",gcglwqgz);
	}

	@Override
	public Boolean updateWqgzYb(Gcglwqgz gcglwqgz) {
		if(insert("updateWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteWqgzYb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		if(delete("deleteWqgzYb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shwqgzyb(Gcglwqgz gcglwqgz) {
		// TODO Auto-generated method stub
		if(update("shwqgzyb", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

}
