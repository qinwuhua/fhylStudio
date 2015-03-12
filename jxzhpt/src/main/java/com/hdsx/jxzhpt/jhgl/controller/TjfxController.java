package com.hdsx.jxzhpt.jhgl.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_yhdzxServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.utile.AnyChartUtil;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.util.lang.JsonUtil;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.ibm.icu.math.BigDecimal;

@Scope("prototype")
@Controller
public class TjfxController extends BaseActionSupport{
	@Resource(name = "plan_abgcServerImpl")
	private Plan_abgcServer abgcServer;
	@Resource(name = "plan_wqgzServerImpl")
	private Plan_wqgzServer wqgzServer;
	@Resource(name = "plan_zhfzServerImpl")
	private Plan_zhfzServer zhfzServer;
	@Resource(name = "plan_yhdzxServerImpl")
	private Plan_yhdzxServer yhdzxServer;
	@Resource(name = "gcgjServerImpl")
	private Plan_gcgjServer gcgjServer;//工程改建
	@Resource(name = "plan_GcsjServerImpl")
	private Plan_gcsjServer gcsjServer;
	@Resource(name="plan_shuihServerImpl")
	private Plan_shuihServer shuihServer;
	private String xmlx;
	private String nf;
	
	public void queryJcktj(){
		try {	
			Map<String, Object> result=new HashMap<String, Object>();
			List<TreeNode> abgc = abgcServer.queryJcktj();
			result.put("abgc", abgc);
			List<TreeNode> wqgz = wqgzServer.queryJcktj();
			result.put("wqgz", wqgz);
			List<TreeNode> zhfz = zhfzServer.queryJcktj();
			result.put("zhfz", zhfz);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJcktj1(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			List<TreeNode> abgc=null;
			List<TreeNode> wqgz=null;
			List<TreeNode> zhfz=null;
			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			Map<String,Object> parameter=new HashMap<String,Object>();
			if(xmlx.equals("abgc")){
				abgc = abgcServer.queryJcktj();
				parameter.put("chart_title_y", "个/公里");
				for(int i=0;i<abgc.size();i++){
					Map<String, String> t=new HashMap<String, String>();
					String name=abgc.get(i).getName();
					t.put("name", name);
					t.put("count", abgc.get(i).getText());
					t.put("length", abgc.get(i).getParent());
					list.add(t);
				}
			}
			else if(xmlx.equals("wqgz")){
				wqgz= wqgzServer.queryJcktj();
				parameter.put("chart_title_y", "个/米");
				for(int i=0;i<wqgz.size();i++){
					Map<String, String> t=new HashMap<String, String>();
					String name=wqgz.get(i).getName();
					t.put("name", name);
					t.put("count", wqgz.get(i).getText());
					t.put("length", wqgz.get(i).getParent());
					list.add(t);
				}
			}
			else if(xmlx.equals("zhfz")){
				zhfz = zhfzServer.queryJcktj();
				parameter.put("chart_title_y", "个/公里");
				for(int i=0;i<zhfz.size();i++){
					Map<String, String> t=new HashMap<String, String>();
					String name=zhfz.get(i).getName();
					t.put("name", name);
					t.put("count", zhfz.get(i).getText());
					t.put("length", zhfz.get(i).getParent());
					list.add(t);
				}
			}
			
			parameter.put("chart_title", "行政区划");//title
			String yName="里程";//y单位
			int precision=0;//小数的位数
			parameter.put("yName", yName);
			parameter.put("precision",precision);
			parameter.put("list",list);
			String chartType = "jckbar.ftl";
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			result.put("bar", anyChartXml);
			ResponseUtils.write(getresponse(), anyChartXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void queryJhktj(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			List<TreeNode> gcsj = gcsjServer.queryJhktj(nf);
			result.put("gcsj", gcsj);
			List<TreeNode> gcgj = gcgjServer.queryJhktj(nf);
			result.put("gcgj", gcgj);
			List<TreeNode> shuih = shuihServer.queryJhktj(nf);
			result.put("shuih", shuih);
			List<TreeNode> yhdzx = yhdzxServer.queryJhktj(nf);
			result.put("yhdzx", yhdzx);
			List<TreeNode> abgc = abgcServer.queryJcktj();
			result.put("abgc", abgc);
			List<TreeNode> wqgz= wqgzServer.queryJcktj();
			result.put("wqgz", wqgz);
			List<TreeNode> zhfz= zhfzServer.queryJcktj();
			result.put("zhfz", zhfz);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
	public String getNf() {
		return nf;
	}
	public void setNf(String nf) {
		this.nf = nf;
	}
}
