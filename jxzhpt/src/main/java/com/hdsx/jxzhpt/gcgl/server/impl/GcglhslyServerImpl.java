package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglhsly;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglhslyServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglhslyServerImpl extends BaseOperate implements GcglhslyServer {

	public GcglhslyServerImpl() {
		super("gcglhsly", "jdbc");
	}

	@Override
	public Boolean inserthslyYb(Gcglhsly gcglhsly) {
		Gcglhsly gcglzhfz1=queryOne("queryYbByYf", gcglhsly);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglhsly.setShzt("未审核");
		if(insert("inserthslyYb", gcglhsly)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selecthslyYbByJhidCount(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryOne("selecthslyYbByJhidCount", gcglhsly);
	}

	@Override
	public List<Gcglhsly> selecthslyYbByJhid(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryList("selecthslyYbByJhid",gcglhsly);
	}

	@Override
	public Boolean updatehslyYb(Gcglhsly gcglhsly) {
		if(update("updatehslyYb", gcglhsly)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deletehslyYb(Gcglhsly gcglhsly) {
		if(delete("deletehslyYb", gcglhsly)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shhslyYb(Gcglhsly gcglhsly) {
		if(update("shhslyYb", gcglhsly)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertHslyCgs(Gcglhsly gcglhsly) {
		Gcglhsly gcglwqgz1=queryOne("queryCGSByYf", gcglhsly);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertHslyCgs", gcglhsly)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectHslyCgsListCount(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryOne("selectHslyCgsListCount", gcglhsly);
	}

	@Override
	public List<Gcglhsly> selectHslyCgsList(Gcglhsly gcglhsly) {
		// TODO Auto-generated method stub
		return queryList("selectHslyCgsList",gcglhsly);
	}

	@Override
	public Boolean updateHslyCgs(Gcglhsly gcglhsly) {
		if(update("updateHslyCgs", gcglhsly)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteHslyCgs(Gcglhsly gcglhsly) {
		if(delete("deleteHslyCgs", gcglhsly)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean uploadWqgzFilesgxk(Gcglhsly gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglhsly gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglhsly gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglhsly downWqgzFile(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglhsly gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglhsly gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglhsly gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglhsly> selectWqgzjhList(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglhsly selectWqgzjhFile(Gcglhsly gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}
	@Override
	public Boolean sbWqgzYb(Gcglhsly gcglabgc) {
		if(update("sbWqgzYb", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}
}
