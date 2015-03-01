package com.hdsx.jxzhpt.xtgl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.utile.DealShape2;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.Dzdt;
import com.hdsx.jxzhpt.xtgl.server.DzdtServer;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class DzdtController extends BaseActionSupport{
	@Resource(name = "dzdtServerImpl")
	private DzdtServer dzdtServer;
	private Dzdt dzdt;
	
	public void selLines(){
		
		
		HashMap<String, Object> hm=new HashMap<String, Object>();
		//System.out.println(ldxx.getRoadends());
		//ldxx.setRoadstart(0.0);
		//ldxx.setRoadends(53.466);
		List<Dzdt> rl=dzdtServer.selLines(dzdt);
		List<HashMap<String,String>> xyHashMapList = new ArrayList<HashMap<String,String>>();
		for(int i=0;i<rl.size();i++){
			Dzdt tempmb = rl.get(i);
			DealShape2<Dzdt> dealShape = new DealShape2<Dzdt>();
			System.out.println("--------");
			xyHashMapList =dealShape.getXyHashMapList("G6001",tempmb.getShape(),0.007,40.996);
			System.out.println("++++++++++++"+xyHashMapList);
			tempmb.setXyHashMapList(xyHashMapList);
		}
		
		
		try {
			JsonUtils.write(rl, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public Dzdt getDzdt() {
		return dzdt;
	}

	public void setDzdt(Dzdt dzdt) {
		this.dzdt = dzdt;
	}
	
	
}
