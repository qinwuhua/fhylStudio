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

import net.sf.ezmorph.array.IntArrayMorpher;

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
import com.hdsx.jxzhpt.jhgl.server.Plan_zjqfServer;
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
	@Resource(name = "plan_zjqfServerImpl")
	private Plan_zjqfServer zjqfServer;
	
	private String xmlx;
	private String nf;//年份，开始年份
	private String end;//结束年份
	private String xzqhdm;//行政区划代码
	
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
					t.put("count", zhfz.get(i).getParent());
					t.put("length", zhfz.get(i).getText());
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
			List<TreeNode> abgc = abgcServer.queryJcktj1(nf);
			result.put("abgc", abgc);
			List<TreeNode> wqgz= wqgzServer.queryJcktj1(nf);
			result.put("wqgz", wqgz);
			List<TreeNode> zhfz= zhfzServer.queryJcktj1(nf);
			result.put("zhfz", zhfz);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJhktjt(){
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		Map<String,Object> parameter=new HashMap<String,Object>();
		parameter.put("chart_title", "行政区划");//title
		String yName="金额";//y单位
		int precision=3;//小数的位数
		parameter.put("chart_title_y", yName);
		parameter.put("precision",precision);
		String chartType = "jhkbar.ftl";
		List<TreeNode> gcsj = gcsjServer.queryJhktj(nf);
		List<TreeNode> gcgj = gcgjServer.queryJhktj(nf);
		List<TreeNode> shuih = shuihServer.queryJhktj(nf);
		List<TreeNode> yhdzx = yhdzxServer.queryJhktj(nf);
		List<TreeNode> abgc = abgcServer.queryJcktj1(nf);
		List<TreeNode> wqgz= wqgzServer.queryJcktj1(nf);
		List<TreeNode> zhfz= zhfzServer.queryJcktj1(nf);
		for(int i=0;i<gcsj.size();i++){
			Map<String, String> param=new HashMap<String, String>();
			param.put("name", gcsj.get(i).getName());
			double je= new Double(gcsj.get(i).getText()).doubleValue()+
					new Double(gcgj.get(i).getText()).doubleValue()+
					new Double(shuih.get(i).getText()).doubleValue()+
					new Double(yhdzx.get(i).getText()).doubleValue()+
					new Double(abgc.get(i).getText()).doubleValue()+
					new Double(wqgz.get(i).getText()).doubleValue()+
					new Double(zhfz.get(i).getText()).doubleValue();
			param.put("je", new Double(je).toString());
			list.add(param);
		}
		parameter.put("list",list);
		String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
		Map<String, String> result=new HashMap<String, String>();
		result.put("bar", anyChartXml);
		ResponseUtils.write(getresponse(), anyChartXml);
	}
	
	public void queryJhktj2(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			result.put("gcgj", gcgjServer.queryJhktj2(xzqhdm,nf,end));
			result.put("gcsj", gcsjServer.queryJhktj2(xzqhdm,nf,end));
			result.put("shuih", shuihServer.queryJhktj2(xzqhdm,nf,end));
			result.put("yhdzx", yhdzxServer.queryJhktj2(xzqhdm,nf,end));
			result.put("abgc", abgcServer.queryJhktj2(xzqhdm,nf,end));
			result.put("wqgz", wqgzServer.queryJhktj2(xzqhdm,nf,end));
			result.put("zhfz", zhfzServer.queryJhktj2(xzqhdm,nf,end));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJhktjt2(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			//设置AnyChart信息
			Map<String,Object> parameter=new HashMap<String,Object>();
			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			parameter.put("xName", "年份");//title
			parameter.put("chart_title", "区划金额趋势图");
			String yName="总金额";//y单位
			int precision=3;//小数的位数
			parameter.put("yName", yName);
			parameter.put("precision",precision);
			parameter.put("legend_title", "行政区划");
			String chartType = "jhkline.ftl";
			
			TreeNode treenode=new TreeNode();
			treenode.setId(xzqhdm);
			List<TreeNode> xzqhlist = zjqfServer.queryChildXzqh(treenode);
			for(int i=Integer.parseInt(nf);i<=Integer.parseInt(end);i++){
				Map<String, String> one=new HashMap<String, String>();
				one.put("year", new Integer(i).toString());
				for (TreeNode item : xzqhlist){
					xzqhdm=item.getId().substring(0,4)+"__";
					double sumJe=
							gcgjServer.queryJhktj2(xzqhdm,new Integer(i).toString())+
							gcsjServer.queryJhktj2(xzqhdm,new Integer(i).toString())+
							shuihServer.queryJhktj2(xzqhdm,new Integer(i).toString())+
							yhdzxServer.queryJhktj2(xzqhdm,new Integer(i).toString())+
							abgcServer.queryJhktj2(xzqhdm,new Integer(i).toString())+
							wqgzServer.queryJhktj2(xzqhdm,new Integer(i).toString())+
							zhfzServer.queryJhktj2(xzqhdm,new Integer(i).toString());
					one.put("je"+item.getId(), new Double(sumJe).toString());
				}
				list.add(one);
			}
			parameter.put("list",list);
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			ResponseUtils.write(getresponse(), anyChartXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJhktjt3(){
		Map<String, Object> result=new HashMap<String, Object>();
		//设置AnyChart信息
		Map<String,Object> parameter=new HashMap<String,Object>();
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		parameter.put("xName", "年份");//title
		parameter.put("chart_title", "区划金额趋势图");
		String yName="总金额";//y单位
		int precision=3;//小数的位数
		parameter.put("yName", yName);
		parameter.put("precision",precision);
		parameter.put("legend_title", "行政区划");
		String chartType = "jhkline2.ftl";
		List<TreeNode> gcgj = gcgjServer.queryJhktjt3(xzqhdm,nf,end);
		List<TreeNode> gcsj=gcsjServer.queryJhktjt3(xzqhdm,nf,end);
		List<TreeNode> shuih=shuihServer.queryJhktjt3(xzqhdm,nf,end);
		List<TreeNode> yhdzx=yhdzxServer.queryJhktjt3(xzqhdm,nf,end);
		List<TreeNode> wqgz=wqgzServer.queryJhktjt3(xzqhdm,nf,end);
		List<TreeNode> abgc=abgcServer.queryJhktjt3(xzqhdm,nf,end);
		List<TreeNode> zhfz=zhfzServer.queryJhktjt3(xzqhdm,nf,end);
		for(int i=Integer.parseInt(nf);i<=Integer.parseInt(end);i++){
			Map<String, String> one=new HashMap<String, String>();
			String year = new Integer(i).toString();
			one.put("year",year);
			one.put("gcgj", "0");
			one.put("gcsj", "0");
			one.put("shuih", "0");
			one.put("yhdzx", "0");
			one.put("wqgz", "0");
			one.put("abgc", "0");
			one.put("zhfz", "0");
			for (TreeNode item : gcgj) {
				if(item.getName().equals(year)){
					one.put("gcgj", item.getText());
				}
			}
			for (TreeNode item : gcsj) {
				if(item.getName().equals(year))
					one.put("gcsj", item.getText());
			}
			for (TreeNode item : shuih) {
				if(item.getName().equals(year))
					one.put("shuih", item.getText());
			}
			for (TreeNode item : yhdzx) {
				if(item.getName().equals(year))
					one.put("yhdzx", item.getText());
			}
			for (TreeNode item : wqgz) {
				if(item.getName().equals(year))
					one.put("wqgz", item.getText());
			}
			for (TreeNode item : abgc) {
				if(item.getName().equals(year))
					one.put("abgc", item.getText());
			}
			for (TreeNode item : zhfz) {
				if(item.getName().equals(year))
					one.put("zhfz", item.getText());
			}
			list.add(one);
		}
		parameter.put("list",list);
		String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
		ResponseUtils.write(getresponse(), anyChartXml);
	}
	
	public void queryGcktj(){
		Map<String, Object> result=new HashMap<String, Object>();
		List<TreeNode> gcgj = gcgjServer.queryGcktj();
		result.put("gcgj", gcgj);
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
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
}
