package com.hdsx.jxzhpt.gcgl.server.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglaqybServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;

@Service
public class GcglaqybServerImpl extends BaseOperate implements GcglaqybServer {

	public GcglaqybServerImpl() {
		super("gcglaqyb", "jdbc");
	}

	@Override
	public Boolean insertAqybb(Gcglaqyb gcglaqyb) {
		System.out.println(gcglaqyb);
		if(insert("insertAqybb", gcglaqyb)>0){
			return true;
		}else{
			return false;
		}
		
	}


}
