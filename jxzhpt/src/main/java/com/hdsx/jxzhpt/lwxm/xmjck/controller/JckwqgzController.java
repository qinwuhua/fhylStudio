package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目基础库——危桥改造Action层
 * @author lhp
 *
 */
@Controller
public class JckwqgzController extends BaseActionSupport implements ModelDriven<Jckwqgz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckwqgzServerImpl")
	private JckwqgzServer wqgzServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	private String delstr;
	
	public void insertWqgz(){
		boolean b = wqgzServer.insertWqgz(jckwqgz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	public void selectWqgz(){
		List<Jckwqgz> wqgzList = wqgzServer.selectWqgzList(jckwqgz);
		int count = wqgzServer.selectWqgzCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui = new EasyUIPage<Jckwqgz>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectWqgzById(){
		try {
			JsonUtils.write(wqgzServer.selectWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateWqgzById(){
		try {
			JsonUtils.write(wqgzServer.updateWqgzById(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteWqgzById(){
		try {
			JsonUtils.write(wqgzServer.deleteWqgzById(delstr),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzShzt(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzShzt(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzSbzt(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzSbzt(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void wqgzGpsroad(){
		try {
			JsonUtils.write(wqgzServer.selectGpsroad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void JckWqgzRoad(){
		try {
			JsonUtils.write(wqgzServer.JckWqgzRoad(jckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectJckShwqgz(){
		List<Jckwqgz> wqgzList = wqgzServer.selectJckShwqgz(jckwqgz);
		int count = wqgzServer.selectWqgzShCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui = new EasyUIPage<Jckwqgz>();
		eui.setRows(wqgzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckWqgzTH(){
		try {
			JsonUtils.write(wqgzServer.xgJckWqgzTH(jckwqgz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void onceWqgz(){
		boolean b = wqgzServer.onceWqgz(jckwqgz);
		System.out.println("**************************************"+b);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	} 
	
	
	public Jckwqgz getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Jckwqgz jckwqgz) {
		this.jckwqgz = jckwqgz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Jckwqgz getModel() {
		return jckwqgz;
	}

}
