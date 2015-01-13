package com.hdsx.jxzhpt.gcgl.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcgl.server.GcglabgcServer;
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
public class GcglyhdzxController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglyhdzxServerImpl")
	private GcglyhdzxServer gcglyhdzxServer;
	
	private Gcglyhdzx gcglyhdzx = new Gcglyhdzx();
	private String jhid;
	
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	
	public Gcglyhdzx getGcglyhdzx() {
		return gcglyhdzx;
	}
	public void setGcglyhdzx(Gcglyhdzx gcglyhdzx) {
		this.gcglyhdzx = gcglyhdzx;
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
	public void insertYhdzxYb(){
		Boolean bl=gcglyhdzxServer.insertYhdzxYb(gcglyhdzx);
		if(bl){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	//查询月报
	public void selectYhdzxYbByJhid(){
		Gcglyhdzx gcglyhdzx = new Gcglyhdzx();
		gcglyhdzx.setPage(page);
		gcglyhdzx.setRows(rows);
		gcglyhdzx.setJhid(jhid);
		int count=gcglyhdzxServer.selectYhdzxYbByJhidCount(gcglyhdzx);
		List<Gcglyhdzx> list=gcglyhdzxServer.selectYhdzxYbByJhid(gcglyhdzx);
		EasyUIPage<Gcglyhdzx> e=new EasyUIPage<Gcglyhdzx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
		//修改月报
		public void updateYhdzxYb(){
			Boolean bl=gcglyhdzxServer.updateYhdzxYb(gcglyhdzx);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//删除月报
		public void deleteYhdzxYb(){
			Boolean bl=gcglyhdzxServer.deleteYhdzxYb(gcglyhdzx);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		//审核月报
		public void shYhdzxYb(){
			Boolean bl=gcglyhdzxServer.shYhdzxYb(gcglyhdzx);
			if(bl){
				ResponseUtils.write(getresponse(), "true");
			}else{
				ResponseUtils.write(getresponse(), "false");
			}
		}
		// 添加车购税
		public void insertYhdzxCgs() {
			Boolean bl = gcglyhdzxServer.insertYhdzxCgs(gcglyhdzx);
			if (bl) {
				ResponseUtils.write(getresponse(), "true");
			} else {
				ResponseUtils.write(getresponse(), "false");
			}
		}

		// 查询cgs
		public void selectYhdzxCgsList() {
			gcglyhdzx.setPage(page);
			gcglyhdzx.setRows(rows);
			gcglyhdzx.setJhid(jhid);
			int count = gcglyhdzxServer.selectYhdzxCgsListCount(gcglyhdzx);
			List<Gcglabgc> list = gcglyhdzxServer.selectYhdzxCgsList(gcglyhdzx);
			EasyUIPage<Gcglabgc> e = new EasyUIPage<Gcglabgc>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		// 修改cgs
		public void updateYhdzxCgs() {
			Boolean bl = gcglyhdzxServer.updateYhdzxCgs(gcglyhdzx);
			if (bl) {
				ResponseUtils.write(getresponse(), "true");
			} else {
				ResponseUtils.write(getresponse(), "false");
			}
		}

		public void deleteYhdzxCgs() {
			Boolean bl = gcglyhdzxServer.deleteYhdzxCgs(gcglyhdzx);
			if (bl) {
				ResponseUtils.write(getresponse(), "true");
			} else {
				ResponseUtils.write(getresponse(), "false");
			}
		}		
		
}
