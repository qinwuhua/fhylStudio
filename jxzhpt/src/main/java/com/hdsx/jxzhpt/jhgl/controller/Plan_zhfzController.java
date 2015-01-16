package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_zhfzController  extends BaseActionSupport{
	private int page;
	private int rows;
	@Resource(name = "plan_zhfzServerImpl")
	private Plan_zhfzServer zhfzServer;
	private Plan_zhfz jh;
	private Jckzhfz lx;
	public void queryZhfzList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("rows", zhfzServer.queryZhfzList(page, rows, jh, lx));
		jsonMap.put("total", zhfzServer.queryZhfzCount(jh, lx));
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZhfaById(){
		try {
			JsonUtils.write(zhfzServer.queryZhfaById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryZhfaNfs(){
		try {
			JsonUtils.write(zhfzServer.queryZhfaNfs(),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	public Plan_zhfzServer getZhfzServer() {
		return zhfzServer;
	}
	public void setZhfzServer(Plan_zhfzServer zhfzServer) {
		this.zhfzServer = zhfzServer;
	}
	public Plan_zhfz getJh() {
		return jh;
	}
	public void setJh(Plan_zhfz jh) {
		this.jh = jh;
	}
	public Jckzhfz getLx() {
		return lx;
	}
	public void setLx(Jckzhfz lx) {
		this.lx = lx;
	}
}
