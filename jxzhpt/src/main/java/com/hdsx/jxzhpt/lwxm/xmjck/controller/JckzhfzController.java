package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
/**
 * 项目基础库——灾害防治Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckzhfzController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckzhfzServerImpl")
	private JckzhfzServer zhfzServer;
	private Jckzhfz zhfz;
	
	public void insertZhfz(){
		boolean b = zhfzServer.insertZhfz(zhfz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}

	

	public Jckzhfz getZhfz() {
		return zhfz;
	}
	public void setZhfz(Jckzhfz zhfz) {
		this.zhfz = zhfz;
	}
	
	
}
