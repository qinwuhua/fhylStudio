package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckwqgzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目审查库——灾害防治Action层
 * @author lhp
 *
 */
@Controller
public class SckwqgzController extends BaseActionSupport implements ModelDriven<Sckwqgz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckwqgzServerImpl")
	private SckwqgzServer wqgzServer;
	private Sckwqgz sckwqgz=new Sckwqgz();
	private String delstr;
	
	public void insertSckwqgz(){
		boolean b = wqgzServer.insertSckwqgz(sckwqgz);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckwqgz(){
		List<Sckwqgz> list = wqgzServer.selectSckwqgz(sckwqgz);
		int count = wqgzServer.selectWqgzCount(sckwqgz);
		EasyUIPage<Sckwqgz> eui = new EasyUIPage<Sckwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckWqgz(){
		if(wqgzServer.deleteSckWqgz(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckwqgz(){
		if(wqgzServer.updateSckWqgz(sckwqgz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckwqgzById(){
		try {
			JsonUtils.write(wqgzServer.selectSckwqgzById(sckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckWqgzSbzt(){
		if(wqgzServer.xgSckWqgzSbzt(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckShwqgz(){
		List<Sckwqgz> list = wqgzServer.selectSckShwqgz(sckwqgz);
		int count = wqgzServer.selectWqgzShCount(sckwqgz);
		EasyUIPage<Sckwqgz> eui = new EasyUIPage<Sckwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckWqgzShzt(){
		if(wqgzServer.xgSckWqgzShzt(sckwqgz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	

	public Sckwqgz getSckwqgz() {
		return sckwqgz;
	}
	public void setSckwqgz(Sckwqgz sckwqgz) {
		this.sckwqgz = sckwqgz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Sckwqgz getModel() {
		return sckwqgz;
	}
	
}
