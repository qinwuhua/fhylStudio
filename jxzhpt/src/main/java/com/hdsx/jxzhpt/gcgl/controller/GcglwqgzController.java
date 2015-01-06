package com.hdsx.jxzhpt.gcgl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.Master;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author xunq
 *
 */
@Scope("prototype")
@Controller
public class GcglwqgzController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglwqgzServerImpl")
	private GcglwqgzServer gcglwqgzServer;
	
	private Gcglwqgz gcglwqgz;
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	public Gcglwqgz getGcglwqgz() {
		return gcglwqgz;
	}
	public void setGcglwqgz(Gcglwqgz gcglwqgz) {
		this.gcglwqgz = gcglwqgz;
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
	//添加月报
	public void insertWqgzYb(){
		System.out.println(gcglwqgz);
		Boolean bl=gcglwqgzServer.insertWqgzYb(gcglwqgz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectWqgzYbByJhid(){
		Gcglwqgz gcglwqgz=new Gcglwqgz();
		gcglwqgz.setPage(page);
		gcglwqgz.setRows(rows);
		gcglwqgz.setJhid(jhid);
		int count=gcglwqgzServer.selectWqgzYbByJhidCount(gcglwqgz);
		List<Gcglwqgz> list=gcglwqgzServer.selectWqgzYbByJhid(gcglwqgz);
		EasyUIPage<Gcglwqgz> e=new EasyUIPage<Gcglwqgz>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//添加月报
		public void updateWqgzYb(){
			System.out.println(gcglwqgz);
			Boolean bl=gcglwqgzServer.updateWqgzYb(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteWqgzYb(){
			Boolean bl=gcglwqgzServer.deleteWqgzYb(gcglwqgz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
}
