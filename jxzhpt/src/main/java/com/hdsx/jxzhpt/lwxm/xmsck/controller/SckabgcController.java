package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckabgcServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目审查库——安保工程Action层
 * @author lhp
 *
 */
@Controller
public class SckabgcController extends BaseActionSupport implements ModelDriven<Sckabgc>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckabgcServerImpl")
	private SckabgcServer abgcServer;
	private Sckabgc sckabgc=new Sckabgc();
	private String delstr;
	private int page=1;
	private int rows=10;
	
	public void insertSckabgc(){
		boolean b = abgcServer.insertSckabgc(sckabgc);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckabgc(){
		List<Sckabgc> list = abgcServer.selectSckabgc(sckabgc);
		int count = abgcServer.selectAbgcCount(sckabgc);
		EasyUIPage<Sckabgc> eui = new EasyUIPage<Sckabgc>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckAbgc(){
		if(abgcServer.deleteSckAbgc(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckabgc(){
		if(abgcServer.updateSckabgc(sckabgc)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckabgcById(){
		try {
			JsonUtils.write(abgcServer.selectSckabgcById(sckabgc), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckAbgcSbzt(){
		if(abgcServer.xgSckAbgcSbzt(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	
	
	
	public Sckabgc getSckabgc() {
		return sckabgc;
	}
	public void setSckabgc(Sckabgc sckabgc) {
		this.sckabgc = sckabgc;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	@Override
	public Sckabgc getModel() {
		return sckabgc;
	}
	
}
