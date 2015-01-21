package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_shuihController extends BaseActionSupport {
	private int page=1;
	private int rows=10;
	@Resource(name="plan_shuihServerImpl")
	private Plan_shuihServer shuihServer;
	private Plan_shuih jh;
	private Plan_lx_shuih lx;
	
	public void queryShuihList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		try {
			jsonMap.put("total", shuihServer.queryShuihCount(jh, lx));
			jsonMap.put("rows",shuihServer.queryShuihList(page, rows, jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihById(){
		try {
			JsonUtils.write(shuihServer.queryShuihById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihNfs(){
		try {
			JsonUtils.write(shuihServer.queryShuihNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropShuihById(){
		try {
			JsonUtils.write(shuihServer.dropShuihById(jh.getId()),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editShuihById(){
		try {
			JsonUtils.write(shuihServer.editShuihById(jh), getresponse().getWriter());
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
	public Plan_shuihServer getShuihServer() {
		return shuihServer;
	}
	public void setShuihServer(Plan_shuihServer shuihServer) {
		this.shuihServer = shuihServer;
	}
	public Plan_shuih getJh() {
		return jh;
	}
	public void setJh(Plan_shuih jh) {
		this.jh = jh;
	}
	public Plan_lx_shuih getLx() {
		return lx;
	}
	public void setLx(Plan_lx_shuih lx) {
		this.lx = lx;
	}
}
