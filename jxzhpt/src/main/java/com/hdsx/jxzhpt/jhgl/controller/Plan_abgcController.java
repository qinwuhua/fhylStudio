package com.hdsx.jxzhpt.jhgl.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSON;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.impl.CbsjServerImpl;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.jxzhpt.xtgl.bean.Bzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.util.lang.JsonUtil;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Scope("prototype")
@Controller
public class Plan_abgcController extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_abgcServerImpl")
	private Plan_abgcServer abgcServer;
	@Resource(name = "plan_wqgzServerImpl")
	private Plan_wqgzServer wqgzServer;
	@Resource(name = "plan_zhfzServerImpl")
	private Plan_zhfzServer zhfzServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private Plan_abgc jh;
	private Jckabgc lx;
	private Sckabgc sc;
	private Plan_zjzj zjzj;
	private Plan_upload uploads;
	private String flag;//标记是哪个模块
	private String fileuploadFileName;
	private File fileupload;
	private Bzbz bzbz;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	public String getcxtj(String bh,String name){
		String result="";
		if(bh!=null){
			String[] s = bh.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
					result+=" ("+name+" like '%"+s[i]+"%'";
				else
					result+=" or "+name+" like '%"+s[i]+"%'";
			}
			result+=")";
					}
		return result;
	}
	public void tuihuiAfById(){
		String cxtj="";
		cxtj=getcxtj(jh.getId(),"id");
		ResponseUtils.write(getresponse(), ""+abgcServer.tuihuiAfById(cxtj));
	}
	
	public void queryAbgcListByStatus(){
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			JsonUtils.write(abgcServer.queryAbgcListByStatus(jh,lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void querySumAbgc(){
		try {
			if("af".equals(jh.getXmlx())){
				lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwdm"));
				if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
					lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwdm like '"+lx.getGydwlx()+"%'");
				}
			}
				
			else {
				lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
				if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
					lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwbm like '"+lx.getGydwlx()+"%'");
				}
			}
				
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			if(lx.getTsdq()!=null)
				if(lx.getTsdq().length()>0){
					String[] tsdqs=lx.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							if("af".equals(jh.getXmlx()))
								tsdq+="ts.tsdq like '%"+tsdqs[i]+"%'";
							else
								tsdq+="lx.tsdq like '%"+tsdqs[i]+"%'";	
						else
							if("af".equals(jh.getXmlx()))
								tsdq+="or ts.tsdq like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or lx.tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lx.setTsdq(tsdq);
				}
				if(lx.getGldj()!=null)
				if(lx.getGldj().length()>0){
					String[] tsdqs=lx.getGldj().split(",");
					String tsdq="and substr(lxbm,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lx.setGldj(tsdq);
				}
				
				if("af".equals(jh.getXmlx())){
					if(lx.getLxjsdj()!=null)
						if(lx.getLxjsdj().length()>0){
							String[] tsdqs=lx.getLxjsdj().split(",");
							String tsdq="and decode(substr(lx.jsdj,0,1),'1','一','2','二','3','三','4','四','5','五',substr(lx.jsdj,0,1)) in (";
							for (int i = 0; i < tsdqs.length; i++) {
								if("全部".equals(tsdqs[i])){
									tsdq="";
									break;
								}
								if(i==0)
									tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
								else
									tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
							
							}
							if(tsdq==""){
								tsdq="";
							}else{
								tsdq+=")";
							}
							lx.setLxjsdj(tsdq);
						}
				}
				else{
					if(lx.getLxjsdj()!=null)
						if(lx.getLxjsdj().length()>0){
							String[] tsdqs=lx.getLxjsdj().split(",");
							String tsdq="and substr(lx.lxjsdj,0,1) in (";
							for (int i = 0; i < tsdqs.length; i++) {
								if("全部".equals(tsdqs[i])){
									tsdq="";
									break;
								}
								if(i==0)
									tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
								else
									tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
							
							}
							if(tsdq==""){
								tsdq="";
							}else{
								tsdq+=")";
							}
							lx.setLxjsdj(tsdq);
						}
				}
			jh.setJhxdwh(getTiaoJian(jh.getJhxdwh(),"xd.jhxdwh"));	
			if("af".equals(jh.getXmlx()))
				JsonUtils.write(abgcServer.querySumAfgc(jh,lx), getresponse().getWriter());
			else 
				JsonUtils.write(abgcServer.querySumAbgc(jh,lx), getresponse().getWriter());
				
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导入安保工程信息
	 */
	public void importAbgc_jh(){
		System.out.println("进入数据处理");
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader.readExcelContent(4,24,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			//将数据插入到数据库
			boolean b=abgcServer.importAbgc_jh(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * excel导出
	 * 通过flag来区分导出哪个excel
	 * 导出的excel将要设置sheet名，数据，表头，以及excel文件名
	 */
	public void exportExcel_jh_abgc(){
		if(lx.getGydwbm()!=null){
				if("af".equals(jh.getXmlx())){
					lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwdm"));
					if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
						lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwdm like '"+lx.getGydwlx()+"%'");
					}
				}
					
				else {
					lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
					if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
						lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwbm like '"+lx.getGydwlx()+"%'");
					}
				}
			}
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		if(lx.getTsdq()!=null)
			if(lx.getTsdq().length()>0){
				String[] tsdqs=lx.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						if("af".equals(jh.getXmlx()))
							tsdq+="ts.tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="lx.tsdq like '%"+tsdqs[i]+"%'";	
					else
						if("af".equals(jh.getXmlx()))
							tsdq+="or ts.tsdq like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or lx.tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lx.setTsdq(tsdq);
			}
			if(lx.getGldj()!=null)
			if(lx.getGldj().length()>0){
				String[] tsdqs=lx.getGldj().split(",");
				String tsdq="and substr(lxbm,0,1) in (";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="'"+tsdqs[i]+"'";
					else
						tsdq+=",'"+tsdqs[i]+"'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				lx.setGldj(tsdq);
			}
			
			if("af".equals(jh.getXmlx())){
				if(lx.getLxjsdj()!=null)
					if(lx.getLxjsdj().length()>0){
						String[] tsdqs=lx.getLxjsdj().split(",");
						String tsdq="and decode(substr(lx.jsdj,0,1),'1','一','2','二','3','三','4','四','5','五',substr(lx.jsdj,0,1)) in (";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
							else
								tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						lx.setLxjsdj(tsdq);
					}
			}
			else{
				if(lx.getLxjsdj()!=null)
					if(lx.getLxjsdj().length()>0){
						String[] tsdqs=lx.getLxjsdj().split(",");
						String tsdq="and substr(lx.lxjsdj,0,1) in (";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
							else
								tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						lx.setLxjsdj(tsdq);
					}
			}
		
		List<Excel_list> list = new ArrayList<Excel_list>();
		ExportExcel_new ee = new ExportExcel_new();
		List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
		SheetBean sheetb = new SheetBean();
		String excelHtml="";
		String tableName="";
		if("af".equals(jh.getXmlx()))
			list = abgcServer.exportExcel_jh1(jh, lx);
		else
			list = abgcServer.exportExcel_jh(jh, lx);
		
//		System.out.println("行政区划："+lx.getXzqhdm()+"    管养单位："+lx.getGydwbm());
		
		ExcelData eldata=new ExcelData();//创建一个类
		if("af".equals(jh.getXmlx())){
		eldata.setTitleName("普通公路路网结构改造工程计划表（安全生命防护工程）");//设置第一行
		eldata.setSheetName("安全生命防护工程");//设置sheeet名
		eldata.setFileName("普通公路路网结构改造工程计划表（安全生命防护工程）");//设置文件名
		}
		else{
			eldata.setTitleName("普通公路路网结构改造工程计划表（安保工程）");//设置第一行
			eldata.setSheetName("安保工程项目");//设置sheeet名
			eldata.setFileName("普通公路路网结构改造工程计划表（安保工程）");//设置文件名
		}
		
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,2,0,0));
		et.add(new Excel_tilte("设区市",1,2,1,1));
		et.add(new Excel_tilte("县（市、区）",1,2,2,2));
		et.add(new Excel_tilte("最新年报桩号",1,1,3,5));
		et.add(new Excel_tilte("路网规划前",1,1,6,8));
		et.add(new Excel_tilte("建设性质",1,2,9,9));
		et.add(new Excel_tilte("总里程（公里）",1,2,10,10));
		et.add(new Excel_tilte("项目隐患里程（公里）",1,2,11,11));
		et.add(new Excel_tilte("总投资（万元）",1,2,12,12));
		et.add(new Excel_tilte("中央车购税资金（万元）",1,2,13,13));
		et.add(new Excel_tilte("地方自筹（万元）",1,2,14,14));
		et.add(new Excel_tilte("建设内容",1,2,15,15));
		et.add(new Excel_tilte("批复文号",1,2,16,16));
		et.add(new Excel_tilte("管养单位",1,2,17,17));
		et.add(new Excel_tilte("备注",1,2,18,18));
		et.add(new Excel_tilte("特殊地区",1,2,19,19));
		et.add(new Excel_tilte("路线编码",2,2,3,3));
		et.add(new Excel_tilte("起点桩号",2,2,4,4));
		et.add(new Excel_tilte("讫点桩号",2,2,5,5));
		et.add(new Excel_tilte("路线编码",2,2,6,6));
		et.add(new Excel_tilte("起点桩号",2,2,7,7));
		et.add(new Excel_tilte("讫点桩号",2,2,8,8));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*excelHtml="<tr><td>计划状态</td><td>上报年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>隐患里程</td><td>批复总投资</td></tr>";
		if("af".equals(jh.getXmlx())){
			sheetb.setTableName("安防工程项目");
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安防");
			tableName="安防工程项目";//excel 文件的名字
		}
		else {
			sheetb.setTableName("安保工程项目");
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			tableName="安保工程项目";//excel 文件的名字
		}
		
		sheetb.setColnum((short)12);
		sheetb.setList(list);
		sheetb.setFooter(null);
		sheetBeans.add(sheetb);
		String stylefileName="module.xls";
		//导出excel
		ee.initStyle(ee.workbook, stylefileName);
		HttpServletResponse response= getresponse();
		ee.makeExcel(tableName, sheetBeans, response);*/
	}
	/**
	 * 查询安保工程的列表信息
	 */
	public void queryAbgcList(){
		try {
			
			System.out.println(lx.getGydwdm()+"    "+lx.getGydwbm());
			jh.setJhxdwh(getTiaoJian(jh.getJhxdwh(),"xd.jhxdwh"));
			if(lx.getGydwbm()!=null){
				if("af".equals(jh.getXmlx())){
					lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwdm"));
					if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
						lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwdm like '"+lx.getGydwlx()+"%'");
					}
				}
					
				else {
					lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
					if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
						lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwbm like '"+lx.getGydwlx()+"%'");
					}
				}
			}
			if(lx.getTsdq()!=null)
				if(lx.getTsdq().length()>0){
					String[] tsdqs=lx.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							if("af".equals(jh.getXmlx()))
								tsdq+="ts.tsdq like '%"+tsdqs[i]+"%'";
							else
								tsdq+="lx.tsdq like '%"+tsdqs[i]+"%'";	
						else
							if("af".equals(jh.getXmlx()))
								tsdq+="or ts.tsdq like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or lx.tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lx.setTsdq(tsdq);
				}
				if(lx.getGldj()!=null)
				if(lx.getGldj().length()>0){
					String[] tsdqs=lx.getGldj().split(",");
					String tsdq="and substr(lxbm,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lx.setGldj(tsdq);
				}

				if("af".equals(jh.getXmlx())){
					if(lx.getLxjsdj()!=null)
						if(lx.getLxjsdj().length()>0){
							String[] tsdqs=lx.getLxjsdj().split(",");
							String tsdq="and decode(substr(lx.jsdj,0,1),'1','一','2','二','3','三','4','四','5','五',substr(lx.jsdj,0,1)) in (";
							for (int i = 0; i < tsdqs.length; i++) {
								if("全部".equals(tsdqs[i])){
									tsdq="";
									break;
								}
								if(i==0)
									tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
								else
									tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
							
							}
							if(tsdq==""){
								tsdq="";
							}else{
								tsdq+=")";
							}
							lx.setLxjsdj(tsdq);
						}
				}
				else{
					if(lx.getLxjsdj()!=null)
						if(lx.getLxjsdj().length()>0){
							String[] tsdqs=lx.getLxjsdj().split(",");
							String tsdq="and substr(lx.lxjsdj,0,1) in (";
							for (int i = 0; i < tsdqs.length; i++) {
								if("全部".equals(tsdqs[i])){
									tsdq="";
									break;
								}
								if(i==0)
									tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
								else
									tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
							
							}
							if(tsdq==""){
								tsdq="";
							}else{
								tsdq+=")";
							}
							lx.setLxjsdj(tsdq);
						}
				}
				

			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			List<SjbbMessage> list = new ArrayList<SjbbMessage>();
				if("af".equals(jh.getXmlx())){
					jsonMap.put("total", abgcServer.queryAfgcCount(jh, lx));
					jsonMap.put("rows",abgcServer.queryAfgcList(page, rows, jh, lx));
				}else{
					jsonMap.put("total", abgcServer.queryAbgcCount(jh, lx));
					jsonMap.put("rows",abgcServer.queryAbgcList(page, rows, jh, lx));
				}
				
				JsonUtils.write(jsonMap, getresponse().getWriter());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getTiaoJian(String bh,String name){
		String result="";
		if(bh!=null&&!"".equals(bh)){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			String[] s = bh.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
					result+=" and ("+name+" like '%"+s[i]+"%'";
				else
					result+=" or "+name+" like '%"+s[i]+"%'";
			}
			result+=")";
			//System.out.println(result);
			//result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
		}
		return result;
	}
	//批量审批用到
	public void editAbgcStatusBatch(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			if("af".equals(jh.getXmlx())){
				lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwdm"));
				lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
				List<Plan_abgc> splist = abgcServer.queryAfgcByStatus(jh,lx);
				for (Plan_abgc item : splist) {
					item.setJh_sbthcd(new Integer(new Integer(item.getJh_sbthcd()).intValue()+2).toString());
					item.setSpzt("1");
					item.setSpsj(new Date());
					item.setSpbmdm(lx.getXzqhdm());//这里行政区划代码保存的是管养单位编码
				}
				//result.put("result", new Boolean(abgcServer.updateStatusBatch1(splist)).toString());
			}
			else{
				lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
				lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
				List<Plan_abgc> splist = abgcServer.queryAbgcByStatus(jh,lx);
				for (Plan_abgc item : splist) {
					item.setJh_sbthcd(new Integer(new Integer(item.getJh_sbthcd()).intValue()+2).toString());
					item.setSpzt("1");
					item.setSpsj(new Date());
					item.setSpbmdm(lx.getXzqhdm());//这里行政区划代码保存的是管养单位编码
				}
				result.put("result", new Boolean(abgcServer.updateStatusBatch(splist)).toString());
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询安保工程的年份列表，弃用
	 */
	public void queryAbgcNfs(){
		try {
			JsonUtils.write(abgcServer.queryAbgcNfs(), getresponse().getWriter()) ;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据ID查询安保工程的相信信息
	 */
	public void queryAbgcById(){
		try {
			if("af".equals(jh.getXmlx()))
				JsonUtils.write(abgcServer.queryAfgcById(jh.getId()), getresponse().getWriter());
			else
			JsonUtils.write(abgcServer.queryAbgcById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据ID删除安保工程计划
	 */
	public void dropAbgcById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(abgcServer.dropAbgcById(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改安保工程的详细信息
	 */
	public void editAbgcById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			System.out.println("审查："+jh.getSckid());
			if("af".equals(jh.getXmlx())){
				result.put("jh",new Boolean((abgcServer.editAfgcById(jh)>0)).toString());
				result.put("sc", new Boolean(true).toString());
			}else{
				result.put("jh",new Boolean((abgcServer.editAbgcById(jh)>0)).toString());
				result.put("sc", new Boolean(abgcServer.editAbgcSckBysckid(sc)).toString());
			}
			
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editAbgcTzById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh",new Boolean((abgcServer.editAbgcTzById(jh)>0)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改安保工程的上报和审批状态
	 */
	public void editAbgcStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			if("af".equals(jh.getXmlx())){
				result.put("result", new Boolean(abgcServer.editStatus1(jh)).toString());
			}else {
				result.put("result", new Boolean(abgcServer.editStatus(jh)).toString());
			}
			JsonUtils.write(result,getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改安保审查库的列入计划
	 */
	public void updateLrztBySckid(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(abgcServer.updateLrztBySckid(jh.getSckid())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 路网补助标准
	 */
	public void lwBzbz(){
		try {
			JsonUtils.write(abgcServer.lwBzbz(bzbz), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getafBzbz(){
		try {
			JsonUtils.write(abgcServer.getafBzbz(bzbz), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 上传文件
	 * @throws Exception
	 */
	public void uploadAbgcFile() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setCharacterEncoding("utf-8"); 	
			String fid=UUID.randomUUID().toString();
			if((uploadGk!=null)){
				String fileurl="E:\\江西综合平台上传文件\\kgbg\\"+ jh.getJhnf() +"\\";
				File file =new File(fileurl);
				Plan_upload upload =new Plan_upload(fid,uploadGkFileName, "工可报告", uploads.getParentid(), fileurl+uploadGkFileName, null);
				CbsjServer cbsjServer =new CbsjServerImpl();
				upload.setFid(fid);
				if(cbsjServer.insertFile(upload) && cbsjServer.insertFileJl(upload)){
					uploadFile(file,uploadGkFileName,uploadGk);
					response.getWriter().print(uploadGkFileName+"上传成功！");
				}
			}else{
				String fileurl="E:\\江西综合平台上传文件\\sjsgt\\"+ jh.getJhnf() +"\\";
				File file =new File(fileurl);
				Plan_upload upload =new Plan_upload(fid,uploadSjtFileName, "设计施工图", uploads.getParentid(), fileurl+uploadSjtFileName, null);
				CbsjServer cbsjServer =new CbsjServerImpl();
				upload.setFid(fid);
				if(cbsjServer.insertFile(upload) && cbsjServer.insertFileJl(upload)){
					uploadFile(file,uploadSjtFileName,uploadSjt);
					response.getWriter().print(uploadSjtFileName+"上传成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print((uploadSjtFileName==null ? uploadGkFileName : uploadSjtFileName) +"上传成功！");
		}
	}
	private void uploadFile(File file,String fileName,File filewj) throws FileNotFoundException,IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(filewj); 
		File saveFile =new File(file, fileName);
		OutputStream os = new FileOutputStream(saveFile);
		//设置缓存  
		byte[] buffer = new byte[1024]; 
		int length = 0;
		while((length= is.read(buffer))>0){
			os.write(buffer,0,length);
		}
		is.close();
		os.flush();
		os.close();
	}
	/**
	 * 下载文件
	 */
	public void downAbgcFile(){
        try {
        	System.out.println(uploads.getFileurl());
        	File file =new File(uploads.getFileurl());
        	HttpServletResponse response = getresponse();
        	OutputStream out = response.getOutputStream();
        	response.setContentType("application/x-download");
        	response.addHeader("Content-Disposition", "attachment;filename="+new String(uploads.getFilename().getBytes("GBK"),"ISO-8859-1"));
        	byte[] buffer = new byte[1024];
        	InputStream is = new FileInputStream(file);
        	int length = 0;
    		while((length= is.read(buffer))>0){
    			out.write(buffer,0,length);
    		}
        	out.write(buffer);
        	out.flush();
        	out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryFjByParentId2(){
		List<Plan_upload> filelist = abgcServer.queryFjByParentId2(uploads);
		try {
			JsonUtils.write(filelist, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void downAbgcFile2(){
		try {
        	HttpServletResponse response = getresponse();
        	Plan_upload queryFjById = abgcServer.queryFjById(uploads.getId());
        	OutputStream out = response.getOutputStream();
        	response.setContentType("application/x-download");
        	response.addHeader("Content-Disposition", "attachment;filename="+new String(queryFjById.getFilename().getBytes("GBK"),"ISO-8859-1"));
        	byte[] buffer = queryFjById.getFiledata();
        	out.write(buffer);
        	out.flush();
        	out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询特殊地区
	 */
	public void queryTsdq(){
		try {
			List<TreeNode> result = abgcServer.queryTsdq();
			/*TreeNode tree=new TreeNode();
			tree.setId(null);
			tree.setText("全部");
			result.add(0, tree);*/
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryFjByParentId(){
		List<Plan_upload> filelist = abgcServer.queryFjByParentId(uploads);
		try {
			JsonUtils.write(filelist, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除文件
	 */
	public void deleteFile(){
		try {
			JsonUtils.write(abgcServer.deleteFile(uploads),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteFile2(){
		try {
			JsonUtils.write(abgcServer.deleteFile2(uploads),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导出安保工程计划资金下达Excel
	 */
	public void exportAbgcZjxdExcel(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[10];
		title[0]=new ExcelTitleCell("路线信息",false, new ExcelCoordinate(0, (short)0), null,50);
		title[1]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)1), null,15);
		title[2]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)2), null,15);
		title[3]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)3), null,15);
		title[4]=new ExcelTitleCell("总补助资金",false, new ExcelCoordinate(0, (short)4), null,15);
		title[5]=new ExcelTitleCell("车购税",false, new ExcelCoordinate(0, (short)5), null,15);
		title[6]=new ExcelTitleCell("省投资",false, new ExcelCoordinate(0, (short)6), null,15);
		title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,15);
		title[8]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("ID",true, new ExcelCoordinate(0, (short)9), null,20);
		
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "lxxx");//路线信息
		attribute.put("1", "pfztz");//批复总投资
		attribute.put("2", "tbdw");//填报单位-即导出单位
		attribute.put("3", "xdnf");//下达年份
		attribute.put("4", "xdzj");//下达的总投资
		attribute.put("5", "btzzj");//下达的部投资
		attribute.put("6", "stz");//下达的部投资
		attribute.put("7", "jhxdwh");//下达的部投资
		attribute.put("8", "ztz");//下达的部投资
		attribute.put("9", "xmid");
		//准备数据
		String gydwmc=zjxdServer.queryGydwmcById(lx.getGydwdm());
		List<Object> excelData = new ArrayList<Object>();
		if("af".equals(jh.getXmlx())){
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwdm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			//此处遍历查询计划资金下达模块的所有项目
			for (Plan_abgc item : abgcServer.queryAfgcList(jh, lx)) {
				Plan_zjxd zjxd=new Plan_zjxd();
				String strLx=(item.getJckabgc().getLxmc()==null ? "" : item.getJckabgc().getLxmc()+"-" )+
						item.getJckabgc().getLxbm()+"("+
						item.getJckabgc().getQdzh()+"-"+
						item.getJckabgc().getZdzh()+")";
				zjxd.setLxxx(strLx);
				zjxd.setPfztz(item.getPfztz());
				zjxd.setXmid(item.getId());
				zjxd.setTbdw(gydwmc);
				excelData.add(zjxd);
			}
			ExcelEntity excel=new ExcelEntity("安防工程",title,attribute,excelData);
			ExcelExportUtil.excelWrite(excel, "安防工程-计划资金下达", getresponse());
		}else{
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			//此处遍历查询计划资金下达模块的所有项目
			for (Plan_abgc item : abgcServer.queryAbgcList(jh, lx)) {
				Plan_zjxd zjxd=new Plan_zjxd();
				String strLx=(item.getJckabgc().getLxmc()==null ? "" : item.getJckabgc().getLxmc()+"-" )+
						item.getJckabgc().getLxbm()+"("+
						item.getJckabgc().getQdzh()+"-"+
						item.getJckabgc().getZdzh()+")";
				zjxd.setLxxx(strLx);
				zjxd.setPfztz(item.getPfztz());
				zjxd.setXmid(item.getId());
				zjxd.setTbdw(gydwmc);
				excelData.add(zjxd);
			}
			ExcelEntity excel=new ExcelEntity("安保工程",title,attribute,excelData);
			ExcelExportUtil.excelWrite(excel, "安保工程-计划资金下达", getresponse());
		}
		
	}
	public void exportExcelAbgcJhSh(){
		if("af".equals(jh.getXmlx())){
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwdm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			String fileTitle="<title=行政区划,fieid=xzqhmc>,<title=管养单位,fieid=gydw>,<title=路线编码,fieid=lxbm>,<title=路线名称,fieid=lxmc>,<title=审查起点桩号,fieid=scqdzh>,<title=审查止点桩号,fieid=sczdzh>,<title=审查总里程,fieid=sczlc>,<title=审查隐患里程,fieid=scyhlc>,<title=方案评估单位,fieid=fapgdw>,<title=方案审查单位,fieid=fascdw>,<title=方案审批时间,fieid=faspsj>,<title=审批文号,fieid=spwh>,<title=投资估算,fieid=tzgs>,<title=建设性质,fieid=jsxz>,<title=建设内容,fieid=jsnr>,<title=审查备注,fieid=scbz>,<title=上报年份,fieid=jhnf>,<title=计划开工时间,fieid=jhkgsj1>,<title=计划完工时间,fieid=jhwgsj1>,<title=计划完成(处),fieid=jhwc_c>,<title=设计单位,fieid=sjdw>,<title=设计批复单位,fieid=sjpfdw>,<title=批复文号,fieid=pfwh>,<title=批复时间,fieid=pfsj1>,<title=是否申请按比例补助,fieid=sfsqablbz>,<title=按比例补助申请文号,fieid=ablbzsqwh>,<title=批复总投资,fieid=pfztz>,<title=部补助资金,fieid=jhsybbzje>,<title=地方自筹,fieid=jhsydfzczj>,<title=备注,fieid=remarks>,<title=计划ID,fieid=id,hidden=true>,<title=审查库ID,fieid=sckid,hidden=true>";
			String fileName="安防工程计划库审核";
			List<Object> excelData=new ArrayList<Object>();
			excelData =abgcServer.exportExcelAfgcJhSh(jh, lx);
			ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
		}else{
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			String fileTitle="<title=行政区划,fieid=xzqhmc>,<title=管养单位,fieid=gydw>,<title=路线编码,fieid=lxbm>,<title=路线名称,fieid=lxmc>,<title=审查起点桩号,fieid=scqdzh>,<title=审查止点桩号,fieid=sczdzh>,<title=审查总里程,fieid=sczlc>,<title=审查隐患里程,fieid=scyhlc>,<title=方案评估单位,fieid=fapgdw>,<title=方案审查单位,fieid=fascdw>,<title=方案审批时间,fieid=faspsj>,<title=审批文号,fieid=spwh>,<title=投资估算,fieid=tzgs>,<title=建设性质,fieid=jsxz>,<title=建设内容,fieid=jsnr>,<title=审查备注,fieid=scbz>,<title=上报年份,fieid=jhnf>,<title=计划开工时间,fieid=jhkgsj1>,<title=计划完工时间,fieid=jhwgsj1>,<title=计划完成(处),fieid=jhwc_c>,<title=设计单位,fieid=sjdw>,<title=设计批复单位,fieid=sjpfdw>,<title=批复文号,fieid=pfwh>,<title=批复时间,fieid=pfsj1>,<title=是否申请按比例补助,fieid=sfsqablbz>,<title=按比例补助申请文号,fieid=ablbzsqwh>,<title=批复总投资,fieid=pfztz>,<title=部补助资金,fieid=jhsybbzje>,<title=地方自筹,fieid=jhsydfzczj>,<title=备注,fieid=remarks>,<title=计划ID,fieid=id,hidden=true>,<title=审查库ID,fieid=sckid,hidden=true>";
			String fileName="安保工程计划库审核";
			List<Object> excelData=new ArrayList<Object>();
			excelData =abgcServer.exportExcelAbgcJhSh(jh, lx);
			ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
		}
	}
	public void importExcelAbgcJhSh(){
		String str="xzqhmc,gydw,lxbm,lxmc,scqdzh,sczdzh,sczlc,scyhlc,fapgdw,fascdw,faspsj,spwh,tzgs,jsxz,jsnr,scbz,jhnf,jhkgsj1,jhwgsj1,jhwc_c,sjdw,sjpfdw,pfwh,pfsj1,sfsqablbz,ablbzsqwh,pfztz,jhsybbzje,jhsydfzczj,remarks,id,sckid";
		try {
			List<Plan_abgc> list = ExcelImportUtil.readExcel(str, 0, Plan_abgc.class,fileupload);
			if(abgcServer.updateImportAbgcJhSh(list)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 管养单位或行政区划代码处理
	 * @param bh
	 * @param name
	 * @return
	 */
	public String gydwOrxzqhBm(String bh,String name){
		String result=null;
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$") || bh.matches("^[0-9]*[1-9][0-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			result = bh.indexOf(",")==-1 ? " lx."+name+" like '%"+bh+"%'": "lx."+name+" in ("+bh+")";
		}
		return result;
	}
	public String gydwBm(String bh,String name){
		String result=null;
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$") || bh.matches("^[0-9]*[1-9][0-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
		result = bh.indexOf(",")==-1 ?  " lx."+name+" like '%'||substr('"+bh+"',0,4)||'_'||substr('"+bh+"',6)||'%'" : "lx."+name+" in ("+bh+")";
		}
		return result;
	}
	/**
	 * 修改安保工程金额
	 * @throws Exception 
	 * @throws IOException 
	 */
	public void editAbZj() throws IOException, Exception{
		try{
			String Strresult="false";
			jh.setPfztz(new Double(new Double(jh.getPfztz()).doubleValue()+new Double(zjzj.getZtz()).doubleValue()).toString());
			jh.setJhsybbzje(new Double(new Double(jh.getJhsybbzje()).doubleValue()+new Double(zjzj.getBbzje()).doubleValue()).toString());
			jh.setJhsydfzczj(new Double(new Double(jh.getJhsydfzczj().equals("") ?"0":jh.getJhsydfzczj()).doubleValue()+new Double(zjzj.getStz()).doubleValue()).toString());
			if(abgcServer.editZjById(jh) && zjxdServer.insertZjzj(zjzj)){
				Strresult="true";
			}
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", Strresult);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	public void abgcTz(){
		try {
			boolean updateTzxz = abgcServer.updateTzxz(jh);
			boolean result = false;
			if(updateTzxz){
				int queryAbgcTz = abgcServer.queryAbgcTz(jh);
				if(queryAbgcTz>0){
					result = abgcServer.updateAbgcTz(jh);
				}else{
					result = abgcServer.insertAbgcTz(jh);
				}
				if(jh.getTzxz().equals("取消")){
					result = abgcServer.dropAbgcById(jh.getId());
				}
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryAbgcTzList(){
		try {
			System.out.println(lx.getGydwdm()+"    "+lx.getGydwbm());
			if(lx.getGydwbm()!=null){
				lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			}
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", abgcServer.queryAbgcTzCount(jh, lx));
			jsonMap.put("rows",abgcServer.queryAbgcTzList(page, rows, jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void querySumAbgcTz(){
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(abgcServer.querySumAbgcTz(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void tzTh(){
		try {
			if(!jh.getTzxz().equals("取消")){
				Plan_abgc queryAbgcById = abgcServer.queryAbgcById(jh.getId());
				if(queryAbgcById!=null){
					abgcServer.dropAbgcById(jh.getId());
				}
			}
			boolean b = abgcServer.insertAbgcFromBf(jh);
			b = abgcServer.dropAbgcBfById(jh);
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("result", b);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryAbgcTzById(){
		try {
			JsonUtils.write(abgcServer.queryAbgcTzById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//计划查询 安保工程 导出
	public void jhcxAbgcExcel(){
		String s = jh.getGydwdm();
		String s1 = jh.getLxmc();
		String s2 = jh.getXzqhdm();
		String s3 = jh.getSfylsjl();
		String s4 = jh.getGldj();
		String s5 = jh.getTsdq();
		String s6 = jh.getJhnf();
		String s7 = jh.getShzt();
		String s8 = jh.getJsdj();
		System.out.println("dd");
		
		try {
			/*HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String gydws=(String) session.getAttribute("gydwbb");	
			String xzqhs=(String) session.getAttribute("xzqhbb");*/
			if(s.indexOf(",")==-1){
				jh.setGydwdm("and lx.gydwbm like '%'||substr('"+s+"',0,4)||'_'||substr('"+s1+"',6)||'%'");
			}else{
				jh.setGydwdm("and lx.gydwbm in ("+s+")");
			}
			if(s2.indexOf(",")==-1){
				jh.setXzqhdm("and lx.xzqhdm like '%"+s2+"%'");
			}else{
				jh.setXzqhdm("and lx.xzqhdm in ("+s2+")");
			}
			 jh.setLxmc(jh.getLxmc());
			 jh.setSfylsjl(jh.getSfylsjl());
			 jh.setJhnf(jh.getJhnf());
			 jh.setShzt(jh.getShzt());
			
			if(jh.getTsdq()!=null)
				if(jh.getTsdq().length()>0){
					String[] tsdqs=jh.getTsdq().split(",");
					String tsdq="and(";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							if("af".equals(jh.getXmlx()))
								tsdq+="ts.tsdq like '%"+tsdqs[i]+"%'";
							else
								tsdq+="lx.tsdq like '%"+tsdqs[i]+"%'";	
						else
							if("af".equals(jh.getXmlx()))
								tsdq+="or ts.tsdq like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or lx.tsdq like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					jh.setTsdq(tsdq);
				}
			if(jh.getGldj()!=null)
				if(jh.getGldj().length()>0){
					String[] tsdqs=jh.getGldj().split(",");
					String tsdq="and substr(lxbm,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					jh.setGldj(tsdq);
				}
				
			if(jh.getJsdj()!=null)
				if(jh.getJsdj().length()>0){
					String[] tsdqs=jh.getJsdj().split(",");
					String tsdq="and substr(lx.lxjsdj,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
						else
							tsdq+=",'"+tsdqs[i].substring(0, 1).replaceAll("等", "五")+"'";
					
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					jh.setJsdj(tsdq);
				}
			List<Excel_list> list = abgcServer.exportExcleAbgc(jh);
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("计划查询安保工程");//设置第一行
			eldata.setSheetName("计划查询安保工程");//设置sheeet名
			eldata.setFileName("计划查询安保工程");//设置文件名
			eldata.setEl(list);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("管养单位",1,1,1,1));
			et.add(new Excel_tilte("县(市、区)",1,1,2,2));
			et.add(new Excel_tilte("行政区划代码",1,1,3,3));
			et.add(new Excel_tilte("路线编码",1,1,4,4));
			et.add(new Excel_tilte("路线名称",1,1,5,5));
			et.add(new Excel_tilte("计划年份",1,1,6,6));
			et.add(new Excel_tilte("计划开工时间",1,1,7,7));
			et.add(new Excel_tilte("计划完工时间",1,1,8,8));
			et.add(new Excel_tilte("总投资（万元）",1,1,9,9));
			et.add(new Excel_tilte("上报状态",1,1,10,10));
			et.add(new Excel_tilte("审批状态",1,1,11,11));
			et.add(new Excel_tilte("开工状态",1,1,12,12));
			et.add(new Excel_tilte("竣工状态",1,1,13,13));
			et.add(new Excel_tilte("补助历史",1,1,14,14));
			et.add(new Excel_tilte("起点桩号",1,1,15,15));
			et.add(new Excel_tilte("止点桩号",1,1,16,16));
			et.add(new Excel_tilte("养护里程",1,1,17,17));
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			
				Excel_export.excel_exportjhsh(eldata,response);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	// get set
	public int getPage() {
		return page;
	}
	public Plan_zjzj getZjzj() {
		return zjzj;
	}
	public void setZjzj(Plan_zjzj zjzj) {
		this.zjzj = zjzj;
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
	public Plan_abgcServer getAbgcServer() {
		return abgcServer;
	}
	public void setAbgcServer(Plan_abgcServer abgcServer) {
		this.abgcServer = abgcServer;
	}
	public Plan_abgc getJh() {
		return jh;
	}
	public void setJh(Plan_abgc jh) {
		this.jh = jh;
	}
	public Jckabgc getLx() {
		return lx;
	}
	public void setLx(Jckabgc lx) {
		this.lx = lx;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public Bzbz getBzbz() {
		return bzbz;
	}
	public void setBzbz(Bzbz bzbz) {
		this.bzbz = bzbz;
	}

	public File getUploadGk() {
		return uploadGk;
	}

	public void setUploadGk(File uploadGk) {
		this.uploadGk = uploadGk;
	}

	public String getUploadGkFileName() {
		return uploadGkFileName;
	}

	public void setUploadGkFileName(String uploadGkFileName) {
		this.uploadGkFileName = uploadGkFileName;
	}

	public File getUploadSjt() {
		return uploadSjt;
	}

	public void setUploadSjt(File uploadSjt) {
		this.uploadSjt = uploadSjt;
	}

	public String getUploadSjtFileName() {
		return uploadSjtFileName;
	}
	public void setUploadSjtFileName(String uploadSjtFileName) {
		this.uploadSjtFileName = uploadSjtFileName;
	}
	public Plan_upload getUploads() {
		return uploads;
	}
	public void setUploads(Plan_upload uploads) {
		this.uploads = uploads;
	}

	public Sckabgc getSc() {
		return sc;
	}

	public void setSc(Sckabgc sc) {
		this.sc = sc;
	}
	
}
