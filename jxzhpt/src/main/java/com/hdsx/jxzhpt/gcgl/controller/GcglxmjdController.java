package com.hdsx.jxzhpt.gcgl.controller;



import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.gcgl.bean.GcglXmjd;
import com.hdsx.jxzhpt.gcgl.server.GcglxmjdServer;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author qwh 
 *
 */
@Scope("prototype")
@Controller
public class GcglxmjdController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcglxmjdServerImpl")
	private GcglxmjdServer gcglxmjdServer;
	private GcglXmjd gcglxmjd = new GcglXmjd();
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
	public GcglXmjd getGcglxmjd() {
		return gcglxmjd;
	}
	public void setGcglxmjd(GcglXmjd gcglxmjd) {
		this.gcglxmjd = gcglxmjd;
	}
	
	
	
		
}
