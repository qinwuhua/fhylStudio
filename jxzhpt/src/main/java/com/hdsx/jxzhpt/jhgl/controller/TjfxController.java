package com.hdsx.jxzhpt.jhgl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_yhdzxServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjqfServer;
import com.hdsx.jxzhpt.utile.AnyChartUtil;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.webutil.struts.BaseActionSupport;

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
	private String ftlName;
	
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
			Map<String,Map<String,Object>> attribute=null;
			if(getRequest().getSession().getAttribute("jhktj2")==null){
				attribute=new HashMap<String, Map<String,Object>>();
			}else{
				attribute=(HashMap<String,Map<String,Object>>)getRequest().getSession().getAttribute("jhktj2");
			}
			attribute.put(xzqhdm, result);
			getRequest().getSession().setAttribute("jhktj2", attribute);
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
			Map<String,Object> attribute = (HashMap<String, Object>)getRequest().getSession().getAttribute("jhktj2");
			for(int i=Integer.parseInt(nf);i<=Integer.parseInt(end);i++){
				Map<String, String> one=new HashMap<String, String>();
				one.put("year", new Integer(i).toString());
				for (TreeNode item : xzqhlist){
					double sumJe=0;
					Map<String,Object> jhMap=(Map<String, Object>) attribute.get(item.getId());
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("gcgj"), sumJe);
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("gcsj"), sumJe);
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("shuih"), sumJe);
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("yhdzx"), sumJe);
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("abgc"), sumJe);
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("wqgz"), sumJe);
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("zhfz"), sumJe);
					one.put("je"+item.getId(), new Double(sumJe).toString());
				}
				list.add(one);
			}
			getRequest().getSession().removeAttribute("jhktj2");
			parameter.put("list",list);
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			ResponseUtils.write(getresponse(), anyChartXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 遍历集合获取对应年份的金额
	 * @param year
	 * @param list
	 * @param sumJe
	 * @return
	 */
	private double getJeFromList(int year, List<TreeNode> list, double sumJe) {
		for (TreeNode node : list) {
			if(node.getId().equals(new Integer(year).toString()))
				sumJe=sumJe+new Double(node.getText()).doubleValue();
		}
		return sumJe;
	}
	
	public void queryJhktjt3(){
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
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			List<TreeNode> gcgj = gcgjServer.queryGcktj(xzqhdm,nf);
			result.put("gcgj", gcgj);
			List<TreeNode> gcsj = gcsjServer.queryGcktj(xzqhdm,nf);
			result.put("gcsj", gcsj);
			List<TreeNode> shuih = shuihServer.queryGcktj(xzqhdm,nf);
			result.put("shuih", shuih);
			List<TreeNode> yhdzx=yhdzxServer.queryGcktj(xzqhdm,nf);
			result.put("yhdzx", yhdzx);
			List<TreeNode> wqgz=wqgzServer.queryGcktj(xzqhdm,nf);
			result.put("wqgz", wqgz);
			List<TreeNode> abgc=abgcServer.queryGcktj(xzqhdm,nf);
			result.put("abgc", abgc);
			List<TreeNode> zhfz=zhfzServer.queryGcktj(xzqhdm,nf);
			result.put("zhfz", zhfz);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcktjt(){
		try {
			Map<String,Object> parameter=new HashMap<String,Object>();
			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			parameter.put("xName", "年份");//title
			parameter.put("chart_title_y", "金额");
			String yName="总金额";//y单位
			int precision=3;//小数的位数
			parameter.put("yName", yName);
			parameter.put("precision",precision);
			parameter.put("chart_title", "行政区划统计图");
			String chartType = "gckbar.ftl";
			TreeNode treenode=new TreeNode();
			treenode.setId(xzqhdm);
			List<TreeNode> xzqhlist = zjqfServer.queryChildXzqh(treenode);
			for (TreeNode xzqh : xzqhlist) {
				xzqh.setId(xzqh.getId().substring(0, 4)+"__");
				Map<String, String> one=new HashMap<String, String>();
				one.put("name", xzqh.getName());
				TreeNode gcgj = gcgjServer.queryGcktjt(xzqh.getId());
				TreeNode gcsj = gcsjServer.queryGcktjt(xzqh.getId());
				TreeNode shuih = shuihServer.queryGcktjt(xzqh.getId());
				TreeNode yhdzx=yhdzxServer.queryGcktjt(xzqh.getId());
				TreeNode wqgz=wqgzServer.queryGcktjt(xzqh.getId());
				TreeNode abgc=abgcServer.queryGcktjt(xzqh.getId());
				TreeNode zhfz=zhfzServer.queryGcktjt(xzqh.getId());
				double gjztz=new Double(gcgj.getText()).doubleValue();
				double sjztz=new Double(gcsj.getText()).doubleValue();
				double shuihztz=new Double(shuih.getText()).doubleValue();
				double yhdzxztz=new Double(yhdzx.getText()).doubleValue();
				double wqgzztz=new Double(wqgz.getText()).doubleValue();
				double abgcztz=new Double(abgc.getText()).doubleValue();
				double zhfzztz=new Double(zhfz.getText()).doubleValue();
				double ztz=(gjztz+sjztz+shuihztz+yhdzxztz+wqgzztz+abgcztz+zhfzztz);
				one.put("ztz", new Double(ztz).toString());
				double wg=(new Double(gcgj.getParent()).doubleValue()+
						new Double(gcsj.getParent()).doubleValue()+
						new Double(shuih.getParent()).doubleValue()+
						new Double(yhdzx.getParent()).doubleValue()+
						new Double(wqgz.getParent()).doubleValue()+
						new Double(abgc.getParent()).doubleValue()+
						new Double(zhfz.getParent()).doubleValue());
				one.put("wg", new Double(wg).toString());
				list.add(one);
			}
			parameter.put("list",list);
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			ResponseUtils.write(getresponse(), anyChartXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcktj2(){
		try{
			Map<String,Object> parameter=new HashMap<String,Object>();
			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			parameter.put("xName", "年份");//title
			parameter.put("chart_title_y", "金额");
			String yName="总金额";//y单位
			int precision=3;//小数的位数
			parameter.put("yName", yName);
			parameter.put("precision",precision);
			parameter.put("chart_title", "行政区划统计图");
			String chartType = ftlName;
			list.add(getMap(gcgjServer.queryGcktj2(xzqhdm,nf), "路面改建"));
			list.add(getMap(gcsjServer.queryGcktj2(xzqhdm,nf), "路面升级"));
			list.add(getMap(shuihServer.queryGcktj2(xzqhdm,nf), "水毁项目"));
			list.add(getMap(yhdzxServer.queryGcktj2(xzqhdm,nf), "养护大中修"));
			list.add(getMap(abgcServer.queryGcktj2(xzqhdm,nf), "安保工程"));
			list.add(getMap(wqgzServer.queryGcktj2(xzqhdm,nf), "危桥改造"));
			list.add(getMap(zhfzServer.queryGcktj2(xzqhdm,nf), "灾害防治"));
			parameter.put("list",list);
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			ResponseUtils.write(getresponse(), anyChartXml);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public Map<String, String> getMap(TreeNode item,String name){
		Map<String, String> result=new HashMap<String, String>();
		result.put("name", name);
		result.put("dntz", item.getId());
		result.put("dnsl", item.getName());
		result.put("lstz", item.getText());
		result.put("lssl", item.getParent());
		return result;
	}
	
	public void queryXmlxTj(){
		Map<String,Object> parameter=new HashMap<String,Object>();
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		parameter.put("xName", "年份");//title
		parameter.put("chart_title_y", "金额");
		String yName="总金额";//y单位
		int precision=3;//小数的位数
		parameter.put("yName", yName);
		parameter.put("precision",precision);
		parameter.put("chart_title", "行政区划统计图");
		String chartType = "gckxmlxbar.ftl";
		List<TreeNode> data=null;
		System.out.println("项目类型："+xmlx);
		if(xmlx.equals("1"))
			data = gcgjServer.queryGcktj(xzqhdm,nf);
		else if(xmlx.equals("2"))
			data = gcsjServer.queryGcktj(xzqhdm,nf);
		else if(xmlx.equals("3"))
			data=shuihServer.queryGcktj(xzqhdm,nf);
		else if(xmlx.equals("4"))
			data=yhdzxServer.queryGcktj(xzqhdm,nf);
		else if(xmlx.equals("5"))
			data=abgcServer.queryGcktj(xzqhdm,nf);
		else if(xmlx.equals("6"))
			data=wqgzServer.queryGcktj(xzqhdm,nf);
		else if(xmlx.equals("7"))
			data=zhfzServer.queryGcktj(xzqhdm,nf);
		for(TreeNode item :data){
			Map<String, String> one=new HashMap<String, String>();
			if(item.getId().equals("0")){
				one.put("name", "未开工");
			}else if(item.getId().equals("1")){
				one.put("name", "在建");
			}else if(item.getId().equals("2")){
				one.put("name", "竣工");
			}
			if(ftlName.equals("ztz"))
				one.put("value", item.getText());
			else if(ftlName.equals("sl"))
				one.put("value", item.getName());
			list.add(one);
		}
		parameter.put("list",list);
		String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
		ResponseUtils.write(getresponse(), anyChartXml);
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
	public String getFtlName() {
		return ftlName;
	}
	public void setFtlName(String ftlName) {
		this.ftlName = ftlName;
	}
}
