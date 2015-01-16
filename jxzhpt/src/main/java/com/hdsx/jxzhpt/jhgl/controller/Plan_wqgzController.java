package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_wqgzController extends BaseActionSupport {
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_wqgzServerImpl")
	private Plan_wqgzServer wqgzServer;
	private Plan_wqgz jh;
	private Jckwqgz lx;
	
	public void queryWqgzNfs(){
		try {
			JsonUtils.write(wqgzServer.queryWqgzNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryWqgzList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		jsonMap.put("total", wqgzServer.queryWqgzCount(jh, lx));
		jsonMap.put("rows", wqgzServer.queryWqgzList(page, rows, jh, lx));
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryWqgzById(){
		try {
			JsonUtils.write(wqgzServer.queryWqgzById(jh.getId()), getresponse().getWriter());
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

	public Plan_wqgzServer getWqgzServer() {
		return wqgzServer;
	}

	public void setWqgzServer(Plan_wqgzServer wqgzServer) {
		this.wqgzServer = wqgzServer;
	}

	public Plan_wqgz getJh() {
		return jh;
	}

	public void setJh(Plan_wqgz jh) {
		this.jh = jh;
	}

	public Jckwqgz getLx() {
		return lx;
	}

	public void setLx(Jckwqgz lx) {
		this.lx = lx;
	}
}
