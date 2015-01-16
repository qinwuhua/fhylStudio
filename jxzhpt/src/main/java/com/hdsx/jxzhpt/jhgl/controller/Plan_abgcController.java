package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_abgcController extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_abgcServerImpl")
	private Plan_abgcServer abgcServer;
	private Plan_abgc jh;
	private Jckabgc lx;
	
	public void queryAbgcList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("total", abgcServer.queryAbgcCount(jh, lx));
		jsonMap.put("rows",abgcServer.queryAbgcList(page, rows, jh, lx));
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryAbgcNfs(){
		try {
			JsonUtils.write(abgcServer.queryAbgcNfs(), getresponse().getWriter()) ;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// get set
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
	public Plan_abgcServer getAbgcServer() {
		return abgcServer;
	}
	public void setAbgcServer(Plan_abgcServer abgcServer) {
		this.abgcServer = abgcServer;
	}
	public Plan_abgc getJh() {
		return jh;
	}
	public void setJh(Plan_abgc jh) {
		this.jh = jh;
	}
	public Jckabgc getLx() {
		return lx;
	}
	public void setLx(Jckabgc lx) {
		this.lx = lx;
	}
}
