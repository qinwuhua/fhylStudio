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

}
