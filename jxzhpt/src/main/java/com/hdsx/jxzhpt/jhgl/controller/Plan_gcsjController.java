package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_gcsjController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "plan_gcsjServerImpl")
	private Plan_gcsjServer gcsjServer;
	private Plan_gcsj jh;
	private Plan_lx_gcsj lx;
	
	public void queryGcsjList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("total", gcsjServer.queryGcsjCount(jh,lx));
		jsonMap.put("rows", gcsjServer.queryGcsjList(page,rows,jh,lx));
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjById(){
		try {
			JsonUtils.write(gcsjServer.queryGcsjById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//set get
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
	public Plan_gcsjServer getGcsjServer() {
		return gcsjServer;
	}
	public void setGcsjServer(Plan_gcsjServer gcsjServer) {
		this.gcsjServer = gcsjServer;
	}
	public Plan_gcsj getJh() {
		return jh;
	}
	public void setJh(Plan_gcsj jh) {
		this.jh = jh;
	}
	public Plan_lx_gcsj getLx() {
		return lx;
	}
	public void setLx(Plan_lx_gcsj lx) {
		this.lx = lx;
	}
}
