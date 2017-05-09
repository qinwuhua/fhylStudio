package com.hdsx.jxzhpt.gcgl.controller;



import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.gcgl.bean.GcglXmjd;
import com.hdsx.jxzhpt.gcgl.server.GcglxmjdServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.utile.ResponseUtils;
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
	/**
	 * 根据项目编码查询月报
	 */
	public void selectYbByxmbm(){
		gcglxmjd.setPage(page);
		gcglxmjd.setRows(rows);
		int count=gcglxmjdServer.selectYbByxmbmCount(gcglxmjd);
		List<GcglXmjd> list=gcglxmjdServer.selectYbByxmbm(gcglxmjd);
		EasyUIPage<GcglXmjd> e=new EasyUIPage<GcglXmjd>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	//查询本月到位资金
	public void getbyzjdw(){
		try {
			JsonUtils.write(gcglxmjdServer.getbyzjdw(gcglxmjd), getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//添加月报
	public void insertYb(){
		ResponseUtils.write(getresponse(), gcglxmjdServer.insertYb(gcglxmjd)+"");
	}
	//修改月报
	public void updateYb(){
		ResponseUtils.write(getresponse(), gcglxmjdServer.updateYb(gcglxmjd)+"");
	}
	//删除月报
	public void deleteYb(){
		ResponseUtils.write(getresponse(), gcglxmjdServer.deleteYb(gcglxmjd)+"");
	}
	//修改月报状态
	public void updateYbzt(){
		
		gcglxmjd.setId(MyUtil.getQueryTJ(gcglxmjd.getId(), "id"));
		ResponseUtils.write(getresponse(), gcglxmjdServer.updateYbzt(gcglxmjd)+"");
	}
}
