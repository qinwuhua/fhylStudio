package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzsjServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglgcgzsjServerImpl extends BaseOperate implements GcglgcgzsjServer {

	public GcglgcgzsjServerImpl() {
		super("gcglgcglsj", "jdbc");
	}

	@Override
	public Boolean insertgcgzsjYb(Gcglgcgzsj gcglgcgzsj) {
		Gcglgcgzsj gcglzhfz1=queryOne("queryYbByYf", gcglgcgzsj);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglgcgzsj.setShzt("未审核");
		if(insert("insertgcgzsjYb", gcglgcgzsj)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectgcgzsjYbByJhidCount(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryOne("selectgcgzsjYbByJhidCount", gcglgcgzsj);
	}

	@Override
	public List<Gcglgcgzsj> selectgcgzsjYbByJhid(Gcglgcgzsj gcglgcgzsj) {
		// TODO Auto-generated method stub
		return queryList("selectgcgzsjYbByJhid",gcglgcgzsj);
	}

	@Override
	public Boolean updategcgzsjYb(Gcglgcgzsj gcglgcgzsj) {
		if(update("updategcgzsjYb", gcglgcgzsj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletegcgzsjYb(Gcglgcgzsj gcglgcgzsj) {
		if(delete("deletegcgzsjYb", gcglgcgzsj)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shgcgzsjyb(Gcglgcgzsj gcglgcgzsj) {
		if(update("shgcgzsjyb", gcglgcgzsj)>0){
		return true;
		}else{
			return false;
		}
	}

}
