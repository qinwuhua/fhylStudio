package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
/**
 * 项目基础库——安保工程Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckabgcController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckabgcServerImpl")
	private JckabgcServer abgcServer;
	private Jckabgc abgc;
	
	public void insertAbgc(){
		boolean b = abgcServer.insertAbgc(abgc);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}

	public Jckabgc getAbgc() {
		return abgc;
	}

	public void setAbgc(Jckabgc abgc) {
		this.abgc = abgc;
	}
	
	
}
