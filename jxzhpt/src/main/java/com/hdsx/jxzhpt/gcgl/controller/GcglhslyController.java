package com.hdsx.jxzhpt.gcgl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglhsly;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
import com.hdsx.jxzhpt.gcgl.server.GcglhslyServer;
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
public class GcglhslyController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglhslyServerImpl")
	private GcglhslyServer gcglhslyServer;
	
	private Gcglhsly gcglhsly = new Gcglhsly();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	
	public Gcglhsly getGcglhsly() {
		return gcglhsly;
	}
	public void setGcglhsly(Gcglhsly gcglhsly) {
		this.gcglhsly = gcglhsly;
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
	public void inserthslyYb(){
		Boolean bl=gcglhslyServer.inserthslyYb(gcglhsly);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selecthslyYbByJhid(){
		gcglhsly.setPage(page);
		gcglhsly.setRows(rows);
		gcglhsly.setJhid(jhid);
		int count=gcglhslyServer.selecthslyYbByJhidCount(gcglhsly);
		List<Gcglhsly> list=gcglhslyServer.selecthslyYbByJhid(gcglhsly);
		EasyUIPage<Gcglhsly> e=new EasyUIPage<Gcglhsly>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updatehslyYb(){
			Boolean bl=gcglhslyServer.updatehslyYb(gcglhsly);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deletehslyYb(){
			Boolean bl=gcglhslyServer.deletehslyYb(gcglhsly);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shhslyYb(){
			Boolean bl=gcglhslyServer.shhslyYb(gcglhsly);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//添加车购税
		public void insertHslyCgs(){
			Boolean bl=gcglhslyServer.insertHslyCgs(gcglhsly);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//查询cgs
		public void selectHslyCgsList(){
			gcglhsly.setPage(page);
			gcglhsly.setRows(rows);
			gcglhsly.setJhid(jhid);
			int count=gcglhslyServer.selectHslyCgsListCount(gcglhsly);
			List<Gcglhsly> list=gcglhslyServer.selectHslyCgsList(gcglhsly);
			EasyUIPage<Gcglhsly> e=new EasyUIPage<Gcglhsly>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		//修改cgs
		public void updateHslyCgs(){
			Boolean bl=gcglhslyServer.updateHslyCgs(gcglhsly);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		public void deleteHslyCgs(){
			Boolean bl=gcglhslyServer.deleteHslyCgs(gcglhsly);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
}
