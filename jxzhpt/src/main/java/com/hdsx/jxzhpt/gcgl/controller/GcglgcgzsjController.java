package com.hdsx.jxzhpt.gcgl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzsjServer;
import com.hdsx.jxzhpt.gcgl.server.GcglshServer;
import com.hdsx.jxzhpt.gcgl.server.GcglwqgzServer;
import com.hdsx.jxzhpt.gcgl.server.GcglyhdzxServer;
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
public class GcglgcgzsjController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglgcgzsjServerImpl")
	private GcglgcgzsjServer gcglgcgzsjServer;
	
	private Gcglgcgzsj gcglgcgzsj = new Gcglgcgzsj();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	
	public Gcglgcgzsj getGcglgcgzsj() {
		return gcglgcgzsj;
	}
	public void setGcglgcgzsj(Gcglgcgzsj gcglgcgzsj) {
		this.gcglgcgzsj = gcglgcgzsj;
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
	public void insertgcgzsjYb(){
		Boolean bl=gcglgcgzsjServer.insertgcgzsjYb(gcglgcgzsj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectgcgzsjYbByJhid(){
		gcglgcgzsj.setPage(page);
		gcglgcgzsj.setRows(rows);
		gcglgcgzsj.setJhid(jhid);
		int count=gcglgcgzsjServer.selectgcgzsjYbByJhidCount(gcglgcgzsj);
		List<Gcglgcgzsj> list=gcglgcgzsjServer.selectgcgzsjYbByJhid(gcglgcgzsj);
		EasyUIPage<Gcglgcgzsj> e=new EasyUIPage<Gcglgcgzsj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updategcgzsjYb(){
			Boolean bl=gcglgcgzsjServer.updategcgzsjYb(gcglgcgzsj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deletegcgzsjYb(){
			Boolean bl=gcglgcgzsjServer.deletegcgzsjYb(gcglgcgzsj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shgcgzsjyb(){
			Boolean bl=gcglgcgzsjServer.shgcgzsjyb(gcglgcgzsj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
}
