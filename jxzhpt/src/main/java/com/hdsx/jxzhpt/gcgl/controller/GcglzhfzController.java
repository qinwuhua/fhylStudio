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
//	//添加月报
//	public void insertAbgcYb(){
//		System.out.println(gcglabgc);
//		Boolean bl=gcglabgcServer.insertAbgcYb(gcglabgc);
//		if(bl){
//			ResponseUtils.write(getresponse(), "true");
//		}else{
//			ResponseUtils.write(getresponse(), "false");
//		}
//	}
//	//查询月报
//	public void selectAbgcYbByJhid(){
//		Gcglabgc gcglabgc=new Gcglabgc();
//		gcglabgc.setPage(page);
//		gcglabgc.setRows(rows);
//		gcglabgc.setJhid(jhid);
//		int count=gcglabgcServer.selectAbgcYbByJhidCount(gcglabgc);
//		List<Gcglabgc> list=gcglabgcServer.selectAbgcYbByJhid(gcglabgc);
//		EasyUIPage<Gcglabgc> e=new EasyUIPage<Gcglabgc>();
//		e.setRows(list);
//		e.setTotal(count);
//		try {
//			JsonUtils.write(e, getresponse().getWriter());
//		} catch (Exception e1) {
//			e1.printStackTrace();
//		}
//	}
//		//修改月报
//		public void updateAbgcYb(){
//			System.out.println(gcglabgc);
//			Boolean bl=gcglabgcServer.updateAbgcYb(gcglabgc);
//			if(bl){
//				ResponseUtils.write(getresponse(), "true");
//			}else{
//				ResponseUtils.write(getresponse(), "false");
//			}
//		}
//		//删除月报
//		public void deleteAbgcYb(){
//			Boolean bl=gcglabgcServer.deleteAbgcYb(gcglabgc);
//			if(bl){
//				ResponseUtils.write(getresponse(), "true");
//			}else{
//				ResponseUtils.write(getresponse(), "false");
//			}
//		}
//		//审核月报
//		public void shAbgcYb(){
//			Boolean bl=gcglabgcServer.shAbgcYb(gcglabgc);
//			if(bl){
//				ResponseUtils.write(getresponse(), "true");
//			}else{
//				ResponseUtils.write(getresponse(), "false");
//			}
//		}
}
