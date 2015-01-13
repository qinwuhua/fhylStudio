package com.hdsx.jxzhpt.jhgl.controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.jhgl.server.TreeSelectServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;


@Scope("prototype")
@Controller
public class Plan_gcgjController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcgjServerImpl")
	private Plan_gcgjServer gcgjServer;//工程改建
	private Plan_gcgj jh;
	private Plan_lx_gcgj lx;
	
	/**
	 * 获取工程改建项目列表
	 */
	public void queryGcgjList(){
		try {
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", gcgjServer.queryGcgjCount(jh,lx));
			jsonMap.put("rows", gcgjServer.queryGcgjList(page,rows,jh,lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据ID获取计划信息
	 */
	public void queryGcgjById(){
		try {
			JsonUtils.write(gcgjServer.queryGcgjById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//get set
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
	public Plan_gcgjServer getGcgjServer() {
		return gcgjServer;
	}
	public void setGcgjServer(Plan_gcgjServer gcgjServer) {
		this.gcgjServer = gcgjServer;
	}
	public Plan_gcgj getJh() {
		return jh;
	}
	public void setJh(Plan_gcgj jh) {
		this.jh = jh;
	}
	public Plan_lx_gcgj getLx() {
		return lx;
	}
	public void setLx(Plan_lx_gcgj lx) {
		this.lx = lx;
	}
}
