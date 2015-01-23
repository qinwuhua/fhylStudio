package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglshServerImpl extends BaseOperate implements GcglshServer {

	public GcglshServerImpl() {
		super("gcglsh", "jdbc");
	}

	@Override
	public Boolean insertshYb(Gcglsh gcglsh) {
		Gcglsh gcglzhfz1=queryOne("queryYbByYf", gcglsh);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglsh.setShzt("未审核");
		if(insert("insertshYb", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectshYbByJhidCount(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("selectshYbByJhidCount", gcglsh);
	}

	@Override
	public List<Gcglsh> selectshYbByJhid(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectshYbByJhid",gcglsh);
	}
	@Override
	public int selectshYbByJhidCount1(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("selectshYbByJhidCount1", gcglsh);
	}

	@Override
	public List<Gcglsh> selectshYbByJhid1(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectshYbByJhid1",gcglsh);
	}

	@Override
	public Boolean updateshYb(Gcglsh gcglsh) {
		if(update("updateshYb", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteshYb(Gcglsh gcglsh) {
		if(delete("deleteshYb", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shShYb(Gcglsh gcglsh) {
		if(update("shShYb", gcglsh)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertShCgs(Gcglsh gcglsh) {
		Gcglsh gcglwqgz1=queryOne("queryCGSByYf", gcglsh);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertShCgs", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectShCgsListCount(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryOne("selectShCgsListCount", gcglsh);
	}

	@Override
	public List<Gcglsh> selectShCgsList(Gcglsh gcglsh) {
		// TODO Auto-generated method stub
		return queryList("selectShCgsList",gcglsh);
	}

	@Override
	public Boolean updateShCgs(Gcglsh gcglsh) {
		if(update("updateShCgs", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteShCgs(Gcglsh gcglsh) {
		if(delete("deleteShCgs", gcglsh)>0){
			return true;
		}else{
			return false;
		}
	}

	
	@Override
	public boolean uploadWqgzFilesgxk(Gcglsh gcglwqgz) {
		if(update("uploadWqgzFilesgxk", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgtc(Gcglsh gcglwqgz) {
		if(update("uploadWqgzFilejgtc", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean uploadWqgzFilejgys(Gcglsh gcglwqgz) {
		if(update("uploadWqgzFilejgys", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Gcglsh downWqgzFile(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("downWqgzFile", gcglwqgz);
	}

	@Override
	public Boolean insertWqgzwwg(Gcglsh gcglwqgz) {
		if(update("insertWqgzwwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzwg(Gcglsh gcglwqgz) {
		gcglwqgz.setJgzt("1");
		if(update("insertWqgzwg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertWqgzkg(Gcglsh gcglwqgz) {
		gcglwqgz.setKgzt("1");
		if(update("insertWqgzkg", gcglwqgz)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectWqgzjhListCount(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhListCount", gcglwqgz);
	}

	@Override
	public List<Gcglsh> selectWqgzjhList(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryList("selectWqgzjhList", gcglwqgz);
	}

	@Override
	public Gcglsh selectWqgzjhFile(Gcglsh gcglwqgz) {
		// TODO Auto-generated method stub
		return queryOne("selectWqgzjhFile", gcglwqgz);
	}
	@Override
	public Boolean sbWqgzYb(Gcglsh gcglabgc) {
		if(update("sbWqgzYb", gcglabgc)>0){
			return true;
		}else{
			return false;
		}
	}
}
