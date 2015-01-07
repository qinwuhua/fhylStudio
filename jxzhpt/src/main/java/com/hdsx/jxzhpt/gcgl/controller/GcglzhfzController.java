package com.hdsx.jxzhpt.gcgl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcgl.server.GcglzhfzServer;
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
public class GcglzhfzController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglzhfzServerImpl")
	private GcglzhfzServer gcglzhfzServer;
	
	private Gcglzhfz gcglzhfz = new Gcglzhfz();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	public Gcglzhfz getGcglzhfz() {
		return gcglzhfz;
	}
	public void setGcglzhfz(Gcglzhfz gcglzhfz) {
		this.gcglzhfz = gcglzhfz;
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
	public void insertZhfzYb(){
		Boolean bl=gcglzhfzServer.insertZhfzYb(gcglzhfz);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectZhfzYbByJhid(){
		Gcglzhfz gcglzhfz=new Gcglzhfz();
		gcglzhfz.setPage(page);
		gcglzhfz.setRows(rows);
		gcglzhfz.setJhid(jhid);
		int count=gcglzhfzServer.selectZhfzYbByJhidCount(gcglzhfz);
		List<Gcglzhfz> list=gcglzhfzServer.selectZhfzYbByJhid(gcglzhfz);
		EasyUIPage<Gcglzhfz> e=new EasyUIPage<Gcglzhfz>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updateZhfzYb(){
			Boolean bl=gcglzhfzServer.updateZhfzYb(gcglzhfz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteZhfzYb(){
			Boolean bl=gcglzhfzServer.deleteZhfzYb(gcglzhfz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shZhfzYb(){
			Boolean bl=gcglzhfzServer.shZhfzYb(gcglzhfz);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
}
