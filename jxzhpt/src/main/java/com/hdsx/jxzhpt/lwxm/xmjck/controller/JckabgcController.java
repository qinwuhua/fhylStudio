package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.File;
import java.io.FileInputStream;
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

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckabgcServer;
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
 * 项目基础库——安保工程Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class JckabgcController extends BaseActionSupport implements ModelDriven<Jckabgc>{

	private static final long serialVersionUID = 4289343039465643667L;
	@Resource(name="jckabgcServerImpl")
	private JckabgcServer abgcServer;
	private Jckabgc jckabgc=new Jckabgc();
	private String delstr;
	private String fileuploadFileName;
	private File fileupload;
	private String tbbmbm1;
	private String tbbmbm2;
	private String sbthcd1;
	
	public void importAbgc(){
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
				dataMapArray = ExcelReader.readExcelContent(3,15,fs,Jckabgc.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map<String,String>> data = ExcelReader.removeBlankRow2(dataMapArray[0]);
			try{
				if(abgcServer.yanZhen(data, tbbmbm1).equals("ok")){
					if(abgcServer.importAbgc(data,tbbmbm2,sbthcd1)) 
						response.getWriter().print(fileuploadFileName+"导入成功");
					else 
						response.getWriter().print(fileuploadFileName+"服务器异常,请重试");
				}else{
					response.getWriter().print(fileuploadFileName+abgcServer.yanZhen(data, tbbmbm1));
				}
			}catch(Exception e){
				e.printStackTrace();
				response.getWriter().print(fileuploadFileName+"数据有误");
			}
			
		}catch(Exception e){}
	}
	public void exportExcel_abgc(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=abgcServer.exportExcel_abgc(jckabgc);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>上报状态</td><td>管养单位</td><td>行政区划</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>总里程</td><td>隐患里程</td><td>修建/改建年度</td><td>项目年份</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保工程项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)12);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保工程项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void exportExcel_abgc_sh(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=abgcServer.exportExcel_abgc_sh(jckabgc);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>总里程</td><td>隐患里程</td><td>修建/改建年度</td><td>项目年份</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保工程项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)12);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保工程项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void insertAbgc(){
		boolean b = abgcServer.insertAbgc(jckabgc);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectAbgc(){
		List<Jckabgc> abgcList = abgcServer.selectAbgcList(jckabgc);
		int count = abgcServer.selectAbgcCount(jckabgc);
		EasyUIPage<Jckabgc> eui=new EasyUIPage<Jckabgc>();
		eui.setRows(abgcList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectAbgcById(){
		try {
			JsonUtils.write(abgcServer.selectAbgcById(jckabgc),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateAbgcById(){
		try {
			JsonUtils.write(abgcServer.updateAbgcById(jckabgc),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteAbgcById(){
		try {
			JsonUtils.write(abgcServer.deleteAbgcById(delstr),getresponse().getWriter());
		}  catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckAbgcShzt(){
		try {
			JsonUtils.write(abgcServer.xgJckAbgcShzt(delstr,jckabgc),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckAbgcSbzt(){
		try {
			JsonUtils.write(abgcServer.xgJckAbgcSbzt(delstr,jckabgc),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充LXMC
	public void abgcGpsroad(){
		try {
			JsonUtils.write(abgcServer.selectGpsroad(jckabgc), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//自动填充SCK-LXMC
	public void selectJckRoad(){
		try {
			JsonUtils.write(abgcServer.selectJckRoad(jckabgc),getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void selectAbgcSh(){
		List<Jckabgc> abgcList = abgcServer.selectJckShabgc(jckabgc);
		int count = abgcServer.selectAbgcShCount(jckabgc);
		EasyUIPage<Jckabgc> eui=new EasyUIPage<Jckabgc>();
		eui.setRows(abgcList);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgJckAbgcTH(){
		try {
			JsonUtils.write(abgcServer.xgJckAbgcTH(jckabgc),getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void onceAbgc(){
		boolean b = abgcServer.onceAbgc(jckabgc);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	

	public String getTbbmbm2() {
		return tbbmbm2;
	}
	public void setTbbmbm2(String tbbmbm2) {
		this.tbbmbm2 = tbbmbm2;
	}
	public Jckabgc getJckabgc() {
		return jckabgc;
	}
	public void setJckabgc(Jckabgc jckabgc) {
		this.jckabgc = jckabgc;
	}
	
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}
	@Override
	public Jckabgc getModel() {
		return jckabgc;
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
	public String getTbbmbm1() {
		return tbbmbm1;
	}
	public void setTbbmbm1(String tbbmbm1) {
		this.tbbmbm1 = tbbmbm1;
	}
	public String getSbthcd1() {
		return sbthcd1;
	}
	public void setSbthcd1(String sbthcd1) {
		this.sbthcd1 = sbthcd1;
	}
	
}
