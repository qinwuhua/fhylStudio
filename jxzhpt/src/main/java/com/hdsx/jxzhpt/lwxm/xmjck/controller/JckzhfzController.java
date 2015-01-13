package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckzhfzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目基础库——灾害防治Action层
 * @author lhp
 *
 */
@Controller
public class JckzhfzController extends BaseActionSupport implements ModelDriven<Jckzhfz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="jckzhfzServerImpl")
	private JckzhfzServer zhfzServer;
	private Jckzhfz jckzhfz=new Jckzhfz();
	private String delstr;
	
	public void insertZhfz(){
		boolean b = zhfzServer.insertZhfz(jckzhfz);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectZhfz(){
		List<Jckzhfz> zhfzList = zhfzServer.selectZhfzList(jckzhfz);
		int count = zhfzServer.selectZhfzCount(jckzhfz);
		EasyUIPage<Jckzhfz> eui = new EasyUIPage<Jckzhfz>();
		eui.setRows(zhfzList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectZhfzById(){
		try {
			JsonUtils.write(zhfzServer.selectZhfzById(jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateZhfzById(){
		try {
			JsonUtils.write(zhfzServer.updateZhfzById(jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteZhfzById(){
		try {
			JsonUtils.write(zhfzServer.deleteZhfzById(delstr),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckZhfzShzt(){
		try {
			JsonUtils.write(zhfzServer.xgJckZhfzShzt(jckzhfz),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckZhfzSbzt(){
		try {
			JsonUtils.write(zhfzServer.xgJckZhfzSbzt(delstr),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void zhfzGpsroad(){
		try {
			JsonUtils.write(zhfzServer.selectGpsroad(jckzhfz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void JckzhfzRoad(){
		try {
			JsonUtils.write(zhfzServer.JckzhfzRoad(jckzhfz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Jckzhfz getJckzhfz() {
		return jckzhfz;
	}
	public void setJckzhfz(Jckzhfz jckzhfz) {
		this.jckzhfz = jckzhfz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Jckzhfz getModel() {
		return jckzhfz;
	}

	
	
	
}
