package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglyhdzxServerImpl extends BaseOperate implements GcglyhdzxServer {

	public GcglyhdzxServerImpl() {
		super("gcglyhdzx", "jdbc");
	}

	@Override
	public Boolean insertYhdzxYb(Gcglyhdzx gcglyhdzx) {
		Gcglyhdzx gcglzhfz1=queryOne("queryYbByYf", gcglyhdzx);
		if(gcglzhfz1!=null){
			return false;
		}
		gcglyhdzx.setShzt("未审核");
		if(insert("insertYhdzxYb", gcglyhdzx)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectYhdzxYbByJhidCount(Gcglyhdzx gcglyhdzx) {
		// TODO Auto-generated method stub
		return queryOne("selectYhdzxYbByJhidCount", gcglyhdzx);
	}

	@Override
	public List<Gcglyhdzx> selectYhdzxYbByJhid(Gcglyhdzx gcglyhdzx) {
		// TODO Auto-generated method stub
		return queryList("selectYhdzxYbByJhid",gcglyhdzx);
	}

	@Override
	public Boolean updateYhdzxYb(Gcglyhdzx gcglyhdzx) {
		if(update("updateYhdzxYb", gcglyhdzx)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public Boolean deleteYhdzxYb(Gcglyhdzx gcglyhdzx) {
		if(delete("deleteYhdzxYb", gcglyhdzx)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean shYhdzxYb(Gcglyhdzx gcglyhdzx) {
		if(update("shYhdzxYb", gcglyhdzx)>0){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean insertYhdzxCgs(Gcglyhdzx gcglyhdzx) {
		Gcglyhdzx gcglwqgz1=queryOne("queryCGSByYf", gcglyhdzx);
		if(gcglwqgz1!=null){
			return false;
		}
		if(insert("insertYhdzxCgs", gcglyhdzx)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int selectYhdzxCgsListCount(Gcglyhdzx gcglyhdzx) {
		// TODO Auto-generated method stub
		return queryOne("selectYhdzxCgsListCount", gcglyhdzx);
	}

	@Override
	public List<Gcglabgc> selectYhdzxCgsList(Gcglyhdzx gcglyhdzx) {
		// TODO Auto-generated method stub
		return queryList("selectYhdzxCgsList",gcglyhdzx);
	}

	@Override
	public Boolean updateYhdzxCgs(Gcglyhdzx gcglyhdzx) {
		// TODO Auto-generated method stub
		if(update("updateYhdzxCgs", gcglyhdzx)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Boolean deleteYhdzxCgs(Gcglyhdzx gcglyhdzx) {
		// TODO Auto-generated method stub
		if(delete("deleteYhdzxCgs", gcglyhdzx)>0){
			return true;
		}else{
			return false;
		}
	}

}
