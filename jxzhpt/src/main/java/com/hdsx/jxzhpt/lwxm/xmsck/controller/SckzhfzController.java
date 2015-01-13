package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckzhfzServer;
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
public class SckzhfzController extends BaseActionSupport implements ModelDriven<Sckzhfz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckzhfzServerImpl")
	private SckzhfzServer zhfzServer;
	private Sckzhfz sckzhfz=new Sckzhfz();
	private String delstr;
	
	public void insertSckzhfz(){
		boolean b =zhfzServer.insertSckzhfz(sckzhfz);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckzhfz(){
		List<Sckzhfz> list = zhfzServer.selectSckzhfz(sckzhfz);
		int count = zhfzServer.selectZhfzCount(sckzhfz);
		EasyUIPage<Sckzhfz> eui = new EasyUIPage<Sckzhfz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckZhfz(){
		if(zhfzServer.deleteSckZhfz(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckZhfz(){
		if(zhfzServer.updateSckZhfz(sckzhfz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckzhfzById(){
		try {
			JsonUtils.write(zhfzServer.selectSckzhfzById(sckzhfz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckZhfzSbzt(){
		if(zhfzServer.xgSckZhfzSbzt(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckShzhfz(){
		List<Sckzhfz> list = zhfzServer.selectSckShzhfz(sckzhfz);
		int count = zhfzServer.selectZhfzShCount(sckzhfz);
		EasyUIPage<Sckzhfz> eui = new EasyUIPage<Sckzhfz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckZhfzShzt(){
		if(zhfzServer.xgSckZhfzShzt(sckzhfz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	

	public Sckzhfz getSckzhfz() {
		return sckzhfz;
	}
	public void setSckzhfz(Sckzhfz sckzhfz) {
		this.sckzhfz = sckzhfz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Sckzhfz getModel() {
		return sckzhfz;
	}
	
}
