package com.hdsx.jxzhpt.gcbb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcbb.bean.Gcbb5;
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
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
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
	
	/**
	 * 管养单位或行政区划代码处理
	 * @param bh
	 * @param name
	 * @return
	 */
	public String gydwOrxzqhBm(String bh,String name){
		if(bh.indexOf(",")==-1){
			int i=0;
			if(bh.matches("^[0-9]*[1-9]00$")){
				i=2;
			}else if(bh.matches("^[0-9]*[1-9]0000$")){
				i=4;
			}
			bh=bh.substring(0,bh.length()-i);
		}
		return bh.indexOf(",")==-1 ? name+" like '%"+bh+"%'": name+" in ("+bh+")";
	}
	
	public void selGcgjJdbb() throws IOException, Exception{
		xmbb.setGydw(gydwOrxzqhBm(xmbb.getGydw(),"gydwdm"));
		xmbb.setXzqh(gydwOrxzqhBm(xmbb.getXzqh(), "xzqhdm"));
		List<GcgjJd> selGcgjJdbb = gcbbServer.selGcgjJdbb(xmbb);
		JsonUtils.write(selGcgjJdbb, getresponse().getWriter());
	}
	public void selShuihJdbb() throws IOException, Exception{
		String tiaojian1="";
		String tiaojian2="";
		String gydwdm = "";
		String xzqhdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = xmbb.getGydw();
		xzqhdm	= xmbb.getXzqh();
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%"+gydwdm+"%'";
		}else{
			tiaojian1="and gydwdm in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		System.out.println(tiaojian1);
		System.out.println(tiaojian2);
		xmbb.setGydw(tiaojian1);
		xmbb.setXzqh(tiaojian2);

		List<GcgjJd> selShuihJdbb=gcbbServer.selShuihJdbb(xmbb);
		for (GcgjJd gcgjJd : selShuihJdbb) {
			
		}
		if("flag".equals(flag)){
			
			
		}else{
			JsonUtils.write(selShuihJdbb, getresponse().getWriter());	
		}
	}
	public void selGcsjJdbb() throws IOException, Exception{
		List<GcsjJd> gcsj=gcbbServer.selGcsjJdbb(xmbb);
		JsonUtils.write(gcsj, getresponse().getWriter());
	}
	public void selYhdzxJdbb() throws IOException, Exception{
		List<GcsjJd> yhdzx=gcbbServer.selYhdzxJdbb(xmbb);
		JsonUtils.write(yhdzx, getresponse().getWriter());
	}
	public void selGcbb5(){
		try{
			List<Gcbb5> s=gcbbServer.selGcbb5(xmbb);
			JsonUtils.write(s, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
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
	private String gydw;
	private String xzqh;

	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public void exportbbsj_set(){
//		System.out.println("*"+gydw);
//		System.out.println("*"+xzqh);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("gydwbb", gydw);
		session.setAttribute("xzqhbb", xzqh);
	}
}
