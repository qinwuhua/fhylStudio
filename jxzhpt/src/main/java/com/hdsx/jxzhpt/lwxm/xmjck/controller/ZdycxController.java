package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglhsly;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycx;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.ZdycxServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 数据查询——自定义查询Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class ZdycxController extends BaseActionSupport implements ModelDriven<Zdycx>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6215287293930608947L;
	@Resource(name="zdycxServerImpl")
	private ZdycxServer zdycxServer;
	private Zdycx zdycx=new Zdycx();
	private String xmlx;
	
	public void selZdy() throws IOException, Exception{
		xmlx=zdycx.getXmlx();
		if("wqgz".equals(xmlx)){
			List<Gcglwqgz> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglwqgz> eui=new EasyUIPage<Gcglwqgz>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("abgc".equals(xmlx)){
			List<Gcglabgc> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglabgc> eui=new EasyUIPage<Gcglabgc>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("zhfz".equals(xmlx)){
			List<Gcglzhfz> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglzhfz> eui=new EasyUIPage<Gcglzhfz>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("lmsj".equals(xmlx)){
			List<Gcglgcgzsj> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglgcgzsj> eui=new EasyUIPage<Gcglgcgzsj>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("lmgj".equals(xmlx)){
			List<Gcglgcgzgj> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglgcgzgj> eui=new EasyUIPage<Gcglgcgzgj>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("yhdzx".equals(xmlx)){
			List<Gcglyhdzx> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglyhdzx> eui=new EasyUIPage<Gcglyhdzx>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("shxm".equals(xmlx)){
			List<Gcglsh> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglsh> eui=new EasyUIPage<Gcglsh>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else{
			List<Gcglhsly> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglhsly> eui=new EasyUIPage<Gcglhsly>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}	
	}
	
	
	
	
	
	@Override
	public Zdycx getModel() {
		return zdycx;
	}
}
