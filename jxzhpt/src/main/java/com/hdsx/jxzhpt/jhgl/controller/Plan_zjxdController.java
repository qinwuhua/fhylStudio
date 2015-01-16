package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_zjxdController extends BaseActionSupport {
	private int page=1;
	private int rows=5;
	private Plan_zjxd zjxd;
	@Resource(name = "plan_abgcServerImpl")
	private Plan_zjxdServer zjxdServer;
	public void queryZjxdByXmId(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		try {
			jsonMap.put("total", zjxdServer.queryZjxdCount(zjxd.getXmid()));
			jsonMap.put("rows", zjxdServer.queryZjxdByXmId(zjxd.getXmid()));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZjxdById(){
		try {
			JsonUtils.write(zjxdServer.queryZjxdById(zjxd.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addZjxd(){
		try {
			JsonUtils.write(zjxdServer.addZjxd(zjxd),getresponse().getWriter());
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
	public Plan_zjxd getZjxd() {
		return zjxd;
	}
	public void setZjxd(Plan_zjxd zjxd) {
		this.zjxd = zjxd;
	}
	public Plan_zjxdServer getZjxdServer() {
		return zjxdServer;
	}
	public void setZjxdServer(Plan_zjxdServer zjxdServer) {
		this.zjxdServer = zjxdServer;
	}
}
