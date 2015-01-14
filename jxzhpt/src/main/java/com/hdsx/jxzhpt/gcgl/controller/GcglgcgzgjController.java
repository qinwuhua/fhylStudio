package com.hdsx.jxzhpt.gcgl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglgcgzgjServer;
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
public class GcglgcgzgjController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglgcgzgjServerImpl")
	private GcglgcgzgjServer gcglgcgzgjServer;
	
	private Gcglgcgzgj gcglgcgzgj = new Gcglgcgzgj();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}

	public Gcglgcgzgj getGcglgcgzgj() {
		return gcglgcgzgj;
	}
	public void setGcglgcgzgj(Gcglgcgzgj gcglgcgzgj) {
		this.gcglgcgzgj = gcglgcgzgj;
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
	public void insertgcgzgjYb(){
		Boolean bl=gcglgcgzgjServer.insertgcgzgjYb(gcglgcgzgj);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectgcgzgjYbByJhid(){
		gcglgcgzgj.setPage(page);
		gcglgcgzgj.setRows(rows);
		gcglgcgzgj.setJhid(jhid);
		int count=gcglgcgzgjServer.selectgcgzgjYbByJhidCount(gcglgcgzgj);
		List<Gcglgcgzgj> list=gcglgcgzgjServer.selectgcgzgjYbByJhid(gcglgcgzgj);
		EasyUIPage<Gcglgcgzgj> e=new EasyUIPage<Gcglgcgzgj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updategcgzgjYb(){
			Boolean bl=gcglgcgzgjServer.updategcgzgjYb(gcglgcgzgj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deletegcgzgjYb(){
			Boolean bl=gcglgcgzgjServer.deletegcgzgjYb(gcglgcgzgj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shgcgzgjYb(){
			Boolean bl=gcglgcgzgjServer.shgcgzgjYb(gcglgcgzgj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//添加车购税
		public void insertGcgzgjCgs(){
			Boolean bl=gcglgcgzgjServer.insertGcgzgjCgs(gcglgcgzgj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询cgs
		public void selectGcgzgjCgsList(){
			gcglgcgzgj.setPage(page);
			gcglgcgzgj.setRows(rows);
			gcglgcgzgj.setJhid(jhid);
			int count=gcglgcgzgjServer.selectGcgzgjCgsListCount(gcglgcgzgj);
			List<Gcglgcgzgj> list=gcglgcgzgjServer.selectGcgzgjCgsList(gcglgcgzgj);
			EasyUIPage<Gcglgcgzgj> e=new EasyUIPage<Gcglgcgzgj>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		//修改cgs
		public void updateGcgzgjCgs(){
			Boolean bl=gcglgcgzgjServer.updateGcgzgjCgs(gcglgcgzgj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void deleteGcgzgjCgs(){
			Boolean bl=gcglgcgzgjServer.deleteGcgzgjCgs(gcglgcgzgj);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
}
