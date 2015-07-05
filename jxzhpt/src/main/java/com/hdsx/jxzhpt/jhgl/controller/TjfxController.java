package com.hdsx.jxzhpt.jhgl.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_yhdzxServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjqfServer;
import com.hdsx.jxzhpt.jhgl.server.TjfxServer;
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
	@Resource(name = "tjfxServerImpl")
	private TjfxServer tjfxServer;
	
	private String xmlx;
	private String nf;//年份，开始年份
	private String end;//结束年份
	private String xzqhdm;//行政区划代码
	private String ftlName;
	
	public void queryJcktj(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			TreeNode treenode=new TreeNode();
			treenode.setId("36__00");
			List<TreeNode> xzqhlist = zjqfServer.queryChildXzqh(treenode);
			List<TreeNode> abgc = new ArrayList<TreeNode>();
			List<TreeNode> wqgz = new ArrayList<TreeNode>();
			List<TreeNode> zhfz = new ArrayList<TreeNode>();
			for (TreeNode item : xzqhlist) {
				String xzqh =item.getParent()==null ? item.getId().substring(0, 2) : item.getId().substring(0, 4);
				xzqh="'"+xzqh+"'";
				treenode.setId(xzqh);
				TreeNode abObj = abgcServer.queryJcktj(treenode);
				abObj.setName(item.getName());
				abgc.add(abObj);
				TreeNode wqObj = wqgzServer.queryJcktj(treenode);
				wqObj.setName(item.getName());
				wqgz.add(wqObj);
				TreeNode zhObj = zhfzServer.queryJcktj(treenode);
				zhObj.setName(item.getName());
				zhfz.add(zhObj);
			}
			System.out.println("安保："+abgc.size());
			result.put("abgc", abgc);
			result.put("wqgz", wqgz);
			result.put("zhfz", zhfz);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJcktj1(){
		try {
			/*Map<String, Object> result=new HashMap<String, Object>();
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
					if(!name.equals("江西省")){
						t.put("name", name);
						t.put("count", abgc.get(i).getText());
						t.put("length", abgc.get(i).getParent());
						list.add(t);
					}
				}
			}
			else if(xmlx.equals("wqgz")){
				wqgz= wqgzServer.queryJcktj();
				parameter.put("chart_title_y", "个/米");
				for(int i=0;i<wqgz.size();i++){
					Map<String, String> t=new HashMap<String, String>();
					String name=wqgz.get(i).getName();
					if(!name.equals("江西省")){
						t.put("name", name);
						t.put("count", wqgz.get(i).getText());
						t.put("length", wqgz.get(i).getParent());
						list.add(t);
					}
				}
			}
			else if(xmlx.equals("zhfz")){
				zhfz = zhfzServer.queryJcktj();
				parameter.put("chart_title_y", "个/公里");
				for(int i=0;i<zhfz.size();i++){
					Map<String, String> t=new HashMap<String, String>();
					String name=zhfz.get(i).getName();
					if(!name.equals("江西省")){
						t.put("name", name);
						t.put("count", zhfz.get(i).getParent());
						t.put("length", zhfz.get(i).getText());
						list.add(t);
					}
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
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void queryJhktj(){
		try {
			//Map<String, Object> result=new HashMap<String, Object>();
			List<TreeNode> result=new ArrayList<TreeNode>();
			List<TreeNode> gcgj = gcgjServer.queryJhktj(xzqhdm.equals("360000") ? xzqhdm.substring(0, 2) : xzqhdm.substring(0, 4),nf);
			result.addAll(gcgj);
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
		TreeNode treenode=new TreeNode();
		treenode.setId(xzqhdm);
		List<TreeNode> xzqhlist = zjqfServer.queryChildXzqh(treenode);
		for (TreeNode item : xzqhlist) {
			if(item.getId().equals("360000"))
				continue;
			List<TreeNode> gcgj = gcgjServer.queryJhktj(item.getId().substring(0,4),nf);
			Map<String, String> param=new HashMap<String, String>();
			param.put("name", item.getName());
			double je= 0;
			for (TreeNode jh : gcgj) {
				je=je+new Double(jh.getText()).doubleValue();
			}
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
			Map<String,Map<String,Object>> attribute=null;
			result.put("gcgj", gcgjServer.queryJhktj2(xzqhdm,nf,end));
			if(getRequest().getSession().getAttribute("jhktj2")==null){
				attribute=new HashMap<String, Map<String,Object>>();
			}else{
				attribute=(HashMap<String,Map<String,Object>>)getRequest().getSession().getAttribute("jhktj2");
			}
			attribute.put(xzqhdm+"00", result);
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
					if(item.getId().equals("36") || item.getId().equals("360000"))
						continue;
					String xzqhdm = item.getId().equals("360000") ? item.getId().substring(0,2) : item.getId().substring(0,4);
					Map<String,Object> jhMap=(Map<String, Object>) attribute.get(item.getId());
					sumJe = getJeFromList(i, (ArrayList<TreeNode>)jhMap.get("gcgj"), sumJe);
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
	
	public void queryJhktj3(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			JsonUtils.write(gcgjServer.queryJhktj3(xmlx,nf,end,xzqhdm), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	//-----------------------------------------------重做后
	/**
	 * 计划库统计中的年份统计
	 * @throws Exception 
	 */
	@SuppressWarnings("unchecked")
	public void queryNftj() throws Exception{
		try {
			Map<String, Object> result = tjfxServer.queryByNfAndXzqhdm(nf,xzqhdm);
			result.put("XZQHDM", xzqhdm);
			List<Map<String, Object>> nftj=null;
			if(getRequest().getSession().getAttribute("nftj")!=null){
				nftj =(List<Map<String, Object>>) getRequest().getSession().getAttribute("nftj");
				if(nftj.size()!=12){
					nftj.add(result);
				}
			}else{
				nftj=new ArrayList<Map<String,Object>>();
				nftj.add(result);
				getRequest().getSession().setAttribute("nftj", nftj);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 设置年份统计柱状图的数据参数
	 */
	public void queryNftjt(){
		try{
			TreeNode treenode=new TreeNode();
			treenode.setId(xzqhdm);
			List<TreeNode> xzqhlist = zjqfServer.queryChildXzqh(treenode);
			
			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			@SuppressWarnings("unchecked")
			List<Map<String, Object>> sessionData = (List<Map<String, Object>>) getRequest().getSession().getAttribute("nftj");
			if(sessionData!=null){
				for(int i=0;i<sessionData.size();i++){
					Map<String, Object> map = sessionData.get(i);
					System.out.println(map.get("XZQHDM"));
					if(map.get("XZQHDM")!=null){
						for (TreeNode node : xzqhlist) {
							if(node.getId().equals(map.get("XZQHDM").toString())){
								Map<String, String> item=new HashMap<String, String>();
								item.put("name", node.getName());
								item.put("je", new Double(map.get("ZTZ").toString()).toString());
								list.add(item);
							}
						}
					}
				}
			}
			Map<String,Object> parameter=new HashMap<String,Object>();
			parameter.put("chart_title", "行政区划");//title
			String yName="金额";//y单位
			parameter.put("chart_title_y", yName);
			int precision=3;//小数的位数
			parameter.put("precision",precision);
			String chartType = "jhkbar.ftl";
			parameter.put("list",list);
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			Map<String, String> result=new HashMap<String, String>();
			result.put("bar", anyChartXml);
			ResponseUtils.write(getresponse(), anyChartXml);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 行政区划统计趋势分析
	 */
	public void queryXzqhtjqsfx(){
		try{
			TreeNode treenode=new TreeNode();
			treenode.setId("36__00");
			List<TreeNode> xzqh = zjqfServer.queryChildXzqh(treenode);
			
			List<Map<String,String>> result =new ArrayList<Map<String,String>>();
			for (TreeNode item : xzqh) {
				xzqhdm = item.getId().equals("360000") ? item.getId().substring(0,2) : item.getId().substring(0,4);
				//查询到此行政区划的总计信息
				List<Map<String,Object>> qs = tjfxServer.queryXzqhQsfx(xzqhdm,nf,end);
				//返回数据对象
				Map<String, String> index =new HashMap<String, String>();
				index.put("xzqh", item.getName());
				index.put("xzqhdm", item.getId());
				for (Map<String, Object> map : qs) {
					index.put(map.get("NF").toString()+"je", map.get("ZTZ").toString());
					index.put(map.get("NF").toString()+"xmcgs", map.get("BTZ").toString());
					index.put(map.get("NF").toString()+"xmstz", map.get("STZ").toString());
					index.put(map.get("NF").toString()+"xmzj", map.get("ZJ").toString());
				}
				result.add(index);
			}
			getRequest().getSession().setAttribute("xzqhqsfx", result);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 行政区划统计趋势分析图
	 */
	public void queryXzqhtjqsfxt(){
		try {
			//设置AnyChart信息
			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			List<Map<String,String>> sessionData = (List<Map<String, String>>) getRequest().getSession().getAttribute("xzqhqsfx");
			for(int i=Integer.parseInt(nf);i<=Integer.parseInt(end);i++){
				Map<String, String> one=new HashMap<String, String>();
				one.put("year", new Integer(i).toString());
				for(int j=0;j<sessionData.size();j++){
					if(sessionData.get(j).get("xzqhdm").equals("36") || sessionData.get(j).get("xzqhdm").equals("360000"))
						continue;
					String strje = sessionData.get(j).get(i+"je")==null ? "0" : sessionData.get(j).get(i+"je");
					one.put("je"+sessionData.get(j).get("xzqhdm"), strje);
				}
				list.add(one);
			}
			Map<String,Object> parameter=new HashMap<String,Object>();
			parameter.put("xName", "年份");//title
			parameter.put("chart_title", "区划金额趋势图");
			String yName="总金额";//y单位
			parameter.put("yName", yName);
			int precision=3;//小数的位数
			parameter.put("precision",precision);
			parameter.put("legend_title", "行政区划");
			String chartType = "jhkline.ftl";
			parameter.put("list",list);
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			ResponseUtils.write(getresponse(), anyChartXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 项目类型统计趋势分析
	 */
	public void queryXmlxtjqsfx(){
		try{
			List<Map<String,String>> result =new ArrayList<Map<String,String>>();
			
			xzqhdm = xzqhdm.equals("360000") ? xzqhdm.substring(0,2) : xzqhdm.substring(0,4);
			List<Map<String,Object>> xmlxData = tjfxServer.queryXmlxtjqsfx(xzqhdm,nf,end);
			String [] xmlx={"安保工程","危桥工程","灾害工程","升级改造工程","路面改造工程","新建工程","养护大中修工程","水毁工程"};
			for (String item : xmlx) {
				Map<String, String> index =new HashMap<String, String>();
				xmlxfenlei(index,xmlxData,item);
				System.out.println(index);
				result.add(index);
			}
			getRequest().getSession().setAttribute("xmlxqs", result);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void xmlxfenlei(Map<String, String> index,List<Map<String,Object>> xmlxData,String xmlx){
		List<Map<String,Object>> obj=new ArrayList<Map<String,Object>>();
		for(int i=0;i<xmlxData.size();i++){
			if(xmlxData.get(i).get("XMLX").toString().equals(xmlx)){
				obj.add(xmlxData.get(i));
			}
		}
		System.out.println(xmlx+"个数"+obj.size());
		for (int i = 0; i < obj.size(); i++) {
			index.put(obj.get(i).get("NF")+"je", obj.get(i).get("ZTZ").toString());
			index.put(obj.get(i).get("NF")+"xmcgs", obj.get(i).get("BTZ").toString());
			index.put(obj.get(i).get("NF")+"xmstz", obj.get(i).get("STZ").toString());
			index.put(obj.get(i).get("NF")+"xmzj", obj.get(i).get("ZJ").toString());
		}
		index.put("xmlx", xmlx);
	}
	/**
	 * 项目类型统计趋势分析图
	 */
	public void queryXmlxtjqsfxt(){
		@SuppressWarnings("unchecked")
		List<Map<String,String>> sessionData = (List<Map<String, String>>) getRequest().getSession().getAttribute("xmlxqs");
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		String [] xmlx={"安保工程","危桥工程","灾害工程","升级改造工程","路面改造工程","新建工程","养护大中修工程","水毁工程"};
		for(int i=Integer.parseInt(nf);i<=Integer.parseInt(end);i++){
			Map<String, String> index =new HashMap<String, String>();
			index.put("year", new Integer(i).toString());
			for (Map<String,String> item : sessionData) {
				if(item.get("xmlx").equals("安保工程")){
					index.put("abgc", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}else if(item.get("xmlx").equals("危桥工程")){
					index.put("wqgz", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}else if(item.get("xmlx").equals("灾害工程")){
					index.put("zhfz", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}else if(item.get("xmlx").equals("升级改造工程")){
					index.put("gcsj", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}else if(item.get("xmlx").equals("路面改造工程")){
					index.put("gcgj", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}else if(item.get("xmlx").equals("新建工程")){
					index.put("xj", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}else if(item.get("xmlx").equals("养护大中修工程")){
					index.put("yhdzx", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}else if(item.get("xmlx").equals("水毁工程")){
					index.put("shuih", item.get(i+"je")==null ? "0" : item.get(i+"je"));
				}
			}
			list.add(index);
		}
		
		//设置AnyChart信息
		Map<String,Object> parameter=new HashMap<String,Object>();
		parameter.put("list",list);
		String yName="总金额";//y单位
		parameter.put("yName", yName);
		int precision=3;//小数的位数
		parameter.put("precision",precision);
		parameter.put("xName", "年份");//title
		parameter.put("chart_title", "区划金额趋势图");
		parameter.put("legend_title", "行政区划");
		String chartType = "jhkline2.ftl";
		String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
		ResponseUtils.write(getresponse(), anyChartXml);
	}
	/**
	 * 工程库行政区划统计分析
	 */
	public void queryGckXzqhtj(){
		try{
			TreeNode treenode=new TreeNode();
			treenode.setId("36__00");
			List<TreeNode> xzqh = zjqfServer.queryChildXzqh(treenode);
			
			List<Map<String,Object>> result =new ArrayList<Map<String,Object>>();
			for (TreeNode item : xzqh) {
				xzqhdm = item.getId().equals("360000") ? item.getId().substring(0,2) : item.getId().substring(0,4);
				Map<String,Object> index = tjfxServer.queryGckXzqhtj(xzqhdm,nf);
				index.put("xzqh", item.getName());
				result.add(index);
			}
			getRequest().getSession().setAttribute("gckxzqh", result);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 工程库行政区划统计分析图
	 */
	public void queryGckXzqhtjt(){
		try {
			Map<String,Object> parameter=new HashMap<String,Object>();
			List<Map<String,String>> list=new ArrayList<Map<String,String>>();
			@SuppressWarnings("unchecked")
			List<Map<String,Object>> attribute = (List<Map<String, Object>>) getRequest().getSession().getAttribute("gckxzqh");
			for (Map<String,Object> item : attribute) {
				Map<String, String> index=new HashMap<String, String>();
				index.put("name", item.get("xzqh").toString());
				index.put("ztz", item.get("ZTZ").toString());
				index.put("wg", item.get("WCTZ").toString());
				list.add(index);
			}
			parameter.put("list",list);
			parameter.put("xName", "年份");//title
			parameter.put("chart_title_y", "金额");
			String yName="总金额";//y单位
			parameter.put("yName", yName);
			int precision=3;//小数的位数
			parameter.put("precision",precision);
			parameter.put("chart_title", "行政区划统计图");
			String chartType = "gckbar.ftl";
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			ResponseUtils.write(getresponse(), anyChartXml);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 工程库项目类型统计
	 */
	public void queryGckXmlxtj(){
		try{
			List<Map<String,Object>> result =new ArrayList<Map<String,Object>>();
			xzqhdm = xzqhdm.equals("360000") ? xzqhdm.substring(0,2) : xzqhdm.substring(0,4);
			result =tjfxServer.queryGckXmlxtj(nf,xzqhdm);
			getRequest().getSession().setAttribute("gckxmlxtj", result);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 工程库项目类型统计图1
	 */
	@SuppressWarnings("unchecked")
	public void queryGckXmlxtjt(){
		try{
			List<Map<String, String>> data =new ArrayList<Map<String,String>>();
			
			List<Map<String,Object>> lstz = tjfxServer.queryGckXmlxTjtLstz(nf,xzqhdm);
			List<Map<String,Object>> gckxmlxtj = (List<Map<String, Object>>) getRequest().getSession().getAttribute("gckxmlxtj");
			String [] xmlxs={"安保工程","危桥工程","灾害工程","升级改造工程","路面改造工程","新建工程","养护大中修工程","水毁工程"};
			for (String xmlx : xmlxs) {
				Map<String, String> index =new HashMap<String, String>();
				index.put("name", xmlx);
				b : for(int i=0;i<gckxmlxtj.size();i++){
					if(gckxmlxtj.get(i).get("XMLX").toString().equals(xmlx)){
						index.put("dntz", gckxmlxtj.get(i).get("ZTZ").toString());
						index.put("dnsl", gckxmlxtj.get(i).get("SL").toString());
						index.put("lstz", lstz.get(i).get("ZTZ").toString());
						index.put("lssl", gckxmlxtj.get(i).get("SL").toString());
						data.add(index);
						break b;
					}
				}
			}
			Map<String,Object> parameter=new HashMap<String,Object>();
			parameter.put("xName", "年份");//title
			parameter.put("chart_title_y", "金额");
			String yName="总金额";//y单位
			parameter.put("yName", yName);
			int precision=3;//小数的位数
			parameter.put("precision",precision);
			parameter.put("chart_title", "行政区划统计图");
			String chartType = ftlName;
			parameter.put("list",data);
			String anyChartXml = AnyChartUtil.getAnyChartXml(chartType, parameter);
			ResponseUtils.write(getresponse(), anyChartXml);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 工程库项目类型统计图2
	 */
	public void queryGckXmlxtjt2(){
		
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
