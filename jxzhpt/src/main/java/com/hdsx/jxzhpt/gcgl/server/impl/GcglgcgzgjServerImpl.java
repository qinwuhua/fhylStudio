package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzgjServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglgcgzgjServerImpl extends BaseOperate implements GcglgcgzgjServer {

	public GcglgcgzgjServerImpl() {
		super("gcglgcgzgj", "jdbc");
	}

	@Override
	public Boolean insertgcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		Gcglgcgzgj gcglzhfz1=queryOne("queryYbByYf", gcglgcgzgj);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglgcgzgj.setShzt("未审核");
		if(insert("insertgcgzgjYb", gcglgcgzgj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectgcgzgjYbByJhidCount(Gcglgcgzgj gcglgcgzgj) {
		// TODO Auto-generated method stub
		return queryOne("selectgcgzgjYbByJhidCount", gcglgcgzgj);
	}

	@Override
	public List<Gcglgcgzgj> selectgcgzgjYbByJhid(Gcglgcgzgj gcglgcgzgj) {
		// TODO Auto-generated method stub
		return queryList("selectgcgzgjYbByJhid",gcglgcgzgj);
	}

	@Override
	public Boolean updategcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		if(update("updategcgzgjYb", gcglgcgzgj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletegcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		if(delete("deletegcgzgjYb", gcglgcgzgj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shgcgzgjYb(Gcglgcgzgj gcglgcgzgj) {
		if(update("shgcgzgjYb", gcglgcgzgj)>0){
		return true;
		}else{
			return false;
		}
	}

//	@Override
//	public Boolean shShYb(Gcglsh gcglsh) {
//		if(update("shShYb", gcglsh)>0){
//		return true;
//		}else{
//			return false;
//		}
//	}

}
