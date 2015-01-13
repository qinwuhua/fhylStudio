package com.hdsx.jxzhpt.gcgl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
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
public class GcglshController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglshServerImpl")
	private GcglshServer gcglshServer;
	
	private Gcglsh gcglsh = new Gcglsh();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	
	public Gcglsh getGcglsh() {
		return gcglsh;
	}
	public void setGcglsh(Gcglsh gcglsh) {
		this.gcglsh = gcglsh;
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
	public void insertshYb(){
		System.out.println(gcglsh+"---------------------------");
		Boolean bl=gcglshServer.insertshYb(gcglsh);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectshYbByJhid(){
		gcglsh.setPage(page);
		gcglsh.setRows(rows);
		gcglsh.setJhid(jhid);
		int count=gcglshServer.selectshYbByJhidCount(gcglsh);
		List<Gcglsh> list=gcglshServer.selectshYbByJhid(gcglsh);
		EasyUIPage<Gcglsh> e=new EasyUIPage<Gcglsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updateshYb(){
			Boolean bl=gcglshServer.updateshYb(gcglsh);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteshYb(){
			Boolean bl=gcglshServer.deleteshYb(gcglsh);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shShYb(){
			Boolean bl=gcglshServer.shShYb(gcglsh);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//添加车购税
		public void insertShCgs(){
			Boolean bl=gcglshServer.insertShCgs(gcglsh);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询cgs
		public void selectShCgsList(){
			gcglsh.setPage(page);
			gcglsh.setRows(rows);
			gcglsh.setJhid(jhid);
			int count=gcglshServer.selectShCgsListCount(gcglsh);
			List<Gcglsh> list=gcglshServer.selectShCgsList(gcglsh);
			EasyUIPage<Gcglsh> e=new EasyUIPage<Gcglsh>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		//修改cgs
		public void updateShCgs(){
			Boolean bl=gcglshServer.updateShCgs(gcglsh);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void deleteShCgs(){
			Boolean bl=gcglshServer.deleteShCgs(gcglsh);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}		
}
