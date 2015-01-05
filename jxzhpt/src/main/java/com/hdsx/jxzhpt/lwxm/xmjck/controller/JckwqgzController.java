package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
/**
 * 项目基础库——危桥改造Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckwqgzController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckwqgzServerImpl")
	private JckwqgzServer wqgzServer;
	private Jckwqgz wqgz;
	
	public void insertWqgz(){
		boolean b = wqgzServer.insertWqgz(wqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	

	public Jckwqgz getWqgz() {
		return wqgz;
	}

	public void setWqgz(Jckwqgz wqgz) {
		this.wqgz = wqgz;
	}

	
	
}
