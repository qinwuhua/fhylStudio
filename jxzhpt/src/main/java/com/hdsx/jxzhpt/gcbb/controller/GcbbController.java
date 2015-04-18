package com.hdsx.jxzhpt.gcbb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcbb.bean.GcgjJd;
import com.hdsx.jxzhpt.gcbb.bean.GcsjJd;
import com.hdsx.jxzhpt.gcbb.server.GcbbServer;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
public class GcbbController extends BaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8781627913390367320L;
	@Resource(name="gcbbServerImpl")
	private GcbbServer gcbbServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	private Xmbb xmbb;
	
	public void selGcgjJdbb() throws IOException, Exception{
		List<GcgjJd> selGcgjJdbb = gcbbServer.selGcgjJdbb(xmbb);
		JsonUtils.write(selGcgjJdbb, getresponse().getWriter());
	}
	public void selShuihJdbb() throws IOException, Exception{
		List<GcgjJd> selShuihJdbb=gcbbServer.selShuihJdbb(xmbb);
		JsonUtils.write(selShuihJdbb, getresponse().getWriter());
	}
	public void selGcsjJdbb() throws IOException, Exception{
		List<GcsjJd> gcsj=gcbbServer.selGcsjJdbb(xmbb);
		JsonUtils.write(gcsj, getresponse().getWriter());
	}
	/***
	 * 获取年份列表
	 */
	public void getYearList(){
		List<String> list= new ArrayList<String>();
		Calendar calendar =Calendar.getInstance();
		int temp=calendar.get(Calendar.YEAR);
		for(int i=temp;i>temp-10;i--){
			list.add(i+"");
		}
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {}
	}
	
	public void selYearList(){
		String l=null;
		Calendar calendar =Calendar.getInstance();
		int nf=calendar.get(Calendar.YEAR);
		l="[{'id':'"+nf+"','text':'"+nf+"','iconCls':'icon-none'}";
		for(int i=1;i<10;i++){
			l+=",{'id':'"+(nf-i)+"','text':'"+(nf-i)+"','iconCls':'icon-none'}";
		}
		l+="]";
		try {
			JsonUtils.write(l, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Xmbb getXmbb() {
		return xmbb;
	}
	public void setXmbb(Xmbb xmbb) {
		this.xmbb = xmbb;
	}
}
