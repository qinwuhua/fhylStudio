package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目基础库——安保工程Action层
 * @author lhp
 *
 */
@Controller
public class JckabgcController extends BaseActionSupport implements ModelDriven<Jckabgc>{

	private static final long serialVersionUID = 4289343039465643667L;
	@Resource(name="jckabgcServerImpl")
	private JckabgcServer abgcServer;
	private Jckabgc jckabgc=new Jckabgc();
	
	public void insertAbgc(){
		boolean b = abgcServer.insertAbgc(jckabgc);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectAbgc(){
		List<Jckabgc> abgcList = abgcServer.selectAbgcList();
		try {
			JsonUtils.write(abgcList, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectAbgcById(){
		try {
			JsonUtils.write(abgcServer.selectAbgcById(jckabgc),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void selectGpsroad(){
		System.out.println("@#@#@#@#@#@##@#@#@##@#@"+jckabgc.getLxbm());
		try {
			JsonUtils.write(abgcServer.selectGpsroad(jckabgc), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Jckabgc getJckabgc() {
		return jckabgc;
	}

	public void setJckabgc(Jckabgc jckabgc) {
		this.jckabgc = jckabgc;
	}


	@Override
	public Jckabgc getModel() {
		return jckabgc;
	}
	
	
}
